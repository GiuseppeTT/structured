clean_files <- function(
    path
) {
    delete_gitkeeps(path)
}

delete_gitkeeps <- function(
    path
) {
    gitkeep_paths <- fs::dir_ls(
        path,
        all = TRUE,
        recurse = TRUE,
        type = "file",
        regexp = "\\.gitkeep$"
    )

    fs::file_delete(gitkeep_paths)
}
