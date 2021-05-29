iterate_project_combinations <- function(
    expectation_function = function(...) invisible(NULL)
) {
    structure_project_arguments <- formals(structure_project)
    project_levels <- eval(structure_project_arguments$project_level)
    analysis_formats <- eval(structure_project_arguments$analysis_format)

    for (project_level in project_levels) {
        for (analysis_format in analysis_formats) {
            project_path <- fs::file_temp()
            structure_project(project_path, project_level, analysis_format)
            expectation_function(project_path, project_level, analysis_format)
            fs::dir_delete(project_path)
        }
    }
}

test_that("structure_project works", {
    expect_error(iterate_project_combinations(), NA)
})

test_that("There are no name template files", {
    iterate_project_combinations(function(project_path, project_level, analysis_format) {
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
    iterate_project_combinations(function(project_path, project_level, analysis_format) {
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
    iterate_project_combinations(function(project_path, project_level, analysis_format) {
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
