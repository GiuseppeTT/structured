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
    expectation_function = function(...) expect_true(TRUE)
) {
    levels <- get_argument(structure_project, "level")
    types <- get_argument(structure_project, "type")

    for (level in levels) {
        for (type in types) {
            local_test_directory()

            path <- fs::path("my-project")
            structure_project(path, level, type)
            expectation_function(path, level, type)
        }
    }
}

test_that("structure_project works", {
    expect_error(iterate_structures(), NA)
})

test_that("There are no ..gitignore (double dots) files", {
    iterate_structures(function(path, level, type) {
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
    iterate_structures(function(path, level, type) {
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
    iterate_structures(function(path, level, type) {
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
    iterate_structures(function(path, level, type) {
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
