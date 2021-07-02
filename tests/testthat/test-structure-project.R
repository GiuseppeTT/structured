get_argument <- function(
    function_,
    argument,
    environment = parent.frame()
) {
    arguments <- formals(function_)
    argument_value <- arguments[[argument]]

    if (is.call(argument_value))
        argument_value <- eval(argument_value, envir = environment)

    return(argument_value)
}

iterate_structures <- function(
    expectation_function = function(...) expect_true(TRUE),
    open
) {
    levels <- get_argument(structure_project, "level")
    types <- get_argument(structure_project, "type")

    for (level in levels) {
        for (type in types) {
            for (open in c(FALSE, TRUE)) {
                test_directory <- local_test_directory()

                path <- fs::path("my-project")
                path <- fs::path_abs(path)
                returned_path <- structure_project(path, level, type, open)
                expectation_function(test_directory, returned_path, path, level, type, open)
            }
        }
    }
}

test_that("structure_project raises no error", {
    expect_error(iterate_structures(), NA)
})

test_that("returned path is the same path", {
    iterate_structures(function(test_directory, returned_path, path, level, type, open) {
        expect_equal(fs::path_real(fs::path_abs(returned_path)), fs::path_real(fs::path_abs(path)))
    })
})

test_that("There are no ..gitignore (double dots) files", {
    iterate_structures(function(test_directory, returned_path, path, level, type, open) {
        dot_dot_gitignore_paths <- fs::dir_ls(
            path,
            all = TRUE,
            recurse = TRUE,
            type = "file",
            regexp = "\\.\\.gitignore$"
        )
        expect_length(dot_dot_gitignore_paths, 0)
    })
})

test_that("There are no name template files", {
    iterate_structures(function(test_directory, returned_path, path, level, type, open) {
        name_template_files <- fs::dir_ls(
            path,
            all = TRUE,
            recurse = TRUE,
            type = "file",
            regexp = "\\{\\{.*\\}\\}"
        )
        expect_length(name_template_files, 0)
    })
})

test_that("There are no content template files", {
    iterate_structures(function(test_directory, returned_path, path, level, type, open) {
        fs::dir_map(
            path,
            fun = function(file_path) {
                file_content <- read_file(file_path)
                template_matches <- grep("\\{\\{.*\\}\\}", file_content)
                expect_length(template_matches, 0)
            },
            all = TRUE,
            recurse = TRUE,
            type = "file"
        )
    })
})

test_that("There are no .gitkeep files", {
    iterate_structures(function(test_directory, returned_path, path, level, type, open) {
        gitkeep_paths <- fs::dir_ls(
            path,
            all = TRUE,
            recurse = TRUE,
            type = "file",
            regexp = "\\.gitkeep$"
        )
        expect_length(gitkeep_paths, 0)
    })
})

test_that("Working directory changes based on open", {
    iterate_structures(function(test_directory, returned_path, path, level, type, open) {
        if (open)
            expect_equal(fs::path_real(fs::path_abs(getwd())), fs::path_real(fs::path_abs(path)))
        else
            expect_equal(fs::path_real(fs::path_abs(getwd())), fs::path_real(fs::path_abs(test_directory)))
    })
})
