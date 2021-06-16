rename_gitignores <- function(
    path
) {
    # .gitignore files are not installed along with the other files, so we name
    # them ..gitignore (double dots) and later rename to .gitignore
    gitignore_paths <- fs::dir_ls(
        path,
        all = TRUE,
        recurse = TRUE,
        type = "file",
        regexp = "\\.\\.gitignore$"
    )

    lapply(gitignore_paths, rename_gitignore_path)
}

rename_gitignore_path <- function(
    path
) {
    path_dir <- fs::path_dir(path)
    new_path <- fs::path(path_dir, ".gitignore")

    fs::file_move(path, new_path)
}
