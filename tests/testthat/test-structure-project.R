structure_project_arguments <- formals(structure_project)
project_levels <- eval(structure_project_arguments$project_level)
analysis_formats <- eval(structure_project_arguments$analysis_format)

iterate_project_combinations <- function(
    expectation_function
) {
    for (project_level in project_levels) {
        for (analysis_format in analysis_formats) {
            project_path <- fs::file_temp()
            expectation_function(project_path)
            fs::dir_delete(project_path)
        }
    }
}


test_that("Project creation works", {
    for (project_level in project_levels) {
        for (analysis_format in analysis_formats) {
            project_path <- fs::file_temp()
            expect_error(structure_project(project_path, project_level, analysis_format), NA)
            fs::dir_delete(project_path)
        }
    }
})

test_that("There are no template files", {
    for (project_level in project_levels) {
        for (analysis_format in analysis_formats) {
            project_path <- fs::file_temp()
            structure_project(project_path, project_level, analysis_format)

            name_template_files <- fs::dir_ls(
                project_path,
                all = TRUE,
                recurse = TRUE,
                type = "file",
                regexp = "\\{\\{.*\\}\\}$"
            )
            expect_length(name_template_files, 0)

            project_files <- fs::dir_ls(
                project_path,
                all = TRUE,
                recurse = TRUE,
                type = "file"
            )
            content_template_files <- character()
            expect_length(content_template_files, 0)

            fs::dir_delete(project_path)
        }
    }
})

test_that("There are no .gitkeep", {
    for (project_level in project_levels) {
        for (analysis_format in analysis_formats) {
            project_path <- fs::file_temp()
            structure_project(project_path, project_level, analysis_format)

            gitkeep_paths <- fs::dir_ls(
                project_path,
                all = TRUE,
                recurse = TRUE,
                type = "file",
                regexp = "\\.gitkeep$"
            )
            expect_length(gitkeep_paths, 0)

            fs::dir_delete(project_path)
        }
    }
})
