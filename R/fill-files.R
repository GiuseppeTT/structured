fill_files <- function(
    path,
    level,
    type
) {
    variables <- define_variables(path, level, type)

    fill_file_names(path, variables)
    fill_file_contents(path, variables)
}

fill_file_names <- function(
    path,
    variables
) {
    project_files <- fs::dir_ls(
        path,
        all = TRUE,
        recurse = TRUE,
        type = "file"
    )

    lapply(project_files, glue_file_path, .variables = variables)
}

fill_file_contents <- function(
    path,
    variables
) {
    project_files <- fs::dir_ls(
        path,
        all = TRUE,
        recurse = TRUE,
        type = "file"
    )

    lapply(project_files, glue_file_content, .variables = variables)
}
