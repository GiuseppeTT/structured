clean_files <- function(
    project_path
) {
    delete_gitkeeps(project_path)
}

delete_gitkeeps <- function(
    project_path
) {
    gitkeep_paths <- fs::dir_ls(
        project_path,
        all = TRUE,
        recurse = TRUE,
        type = "file",
        regexp = "\\.gitkeep$"
    )

    fs::file_delete(gitkeep_paths)
}
