structure_project_arguments <- formals(structure_project)
project_levels <- eval(structure_project_arguments$project_level)
analysis_formats <- eval(structure_project_arguments$analysis_format)

iterate_project_combinations <- function(
    expectation_function = function(x) invisible(x)
) {
    for (project_level in project_levels) {
        for (analysis_format in analysis_formats) {
            project_path <- fs::file_temp()
            structure_project(project_path, project_level, analysis_format)
            expectation_function(project_path)
            fs::dir_delete(project_path)
        }
    }
}

test_that("Project creation works", {
    expect_error(iterate_project_combinations(), NA)
})

test_that("There are no template files", {
    iterate_project_combinations(function(project_path) {
        name_template_files <- fs::dir_ls(
            project_path,
            all = TRUE,
            recurse = TRUE,
            type = "file",
            regexp = "\\{\\{.*\\}\\}$"
        )
        expect_length(name_template_files, 0)

        fs::dir_map(
            project_path,
            fun = function(path) {
                file_content <- read_file(path)
                template_matches <- grep("\\{\\{.*\\}\\}", file_content)
                expect_length(template_matches, 0)
            },
            all = TRUE,
            recurse = TRUE,
            type = "file"
        )
    })
})

test_that("There are no .gitkeep", {
    iterate_project_combinations(function(project_path) {
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
