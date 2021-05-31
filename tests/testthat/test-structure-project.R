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
    project_levels <- get_argument(structure_project, "project_level")
    analysis_formats <- get_argument(structure_project, "analysis_format")

    for (project_level in project_levels) {
        for (analysis_format in analysis_formats) {
            local_test_directory()

            project_path <- fs::path("my-project")
            structure_project(project_path, project_level, analysis_format)
            expectation_function(project_path, project_level, analysis_format)
        }
    }
}

test_that("structure_project works", {
    expect_error(iterate_structures(), NA)
})

test_that("There are no name template files", {
    iterate_structures(function(project_path, project_level, analysis_format) {
        name_template_files <- fs::dir_ls(
            project_path,
            all = TRUE,
            recurse = TRUE,
            type = "file",
            regexp = "\\{\\{.*\\}\\}"
        )
        expect_length(name_template_files, 0)
    })
})

test_that("There are no content template files", {
    iterate_structures(function(project_path, project_level, analysis_format) {
        fs::dir_map(
            project_path,
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
    iterate_structures(function(project_path, project_level, analysis_format) {
        gitkeep_paths <- fs::dir_ls(
            project_path,
            all = TRUE,
            recurse = TRUE,
            type = "file",
            regexp = "\\.gitkeep$"
        )
        expect_length(gitkeep_paths, 0)
    })
})
