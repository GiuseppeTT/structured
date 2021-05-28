fill_files <- function(
    project_path,
    project_level,
    analysis_format
) {
    variables <- define_variables(project_path, project_level, analysis_format)

    fill_file_names(project_path, variables)
    fill_file_contents(project_path, variables)
}

fill_file_names <- function(
    project_path,
    variables
) {
    old_paths <- fs::dir_ls(
        project_path,
        all = TRUE,
        recurse = TRUE,
        type = "file"
    )

    new_paths <- lapply(old_paths, glue_file_path, .variables = variables)
    new_paths <- unlist(new_paths, use.names = FALSE)
    new_paths <- fs::as_fs_path(new_paths)

    fs::file_move(old_paths, new_paths)
}

fill_file_contents <- function(
    project_path,
    variables
) {
    project_files <- fs::dir_ls(
        project_path,
        all = TRUE,
        recurse = TRUE,
        type = "file"
    )

    lapply(project_files, glue_file_content, .variables = variables)
}
