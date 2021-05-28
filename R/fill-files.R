fill_files <- function(
    project_path,
    project_level,
    analysis_format
) {
    data <- list(
        project_slug = fs::file_name(project_path)
    )

    fill_file_names(project_path, data)
    fill_file_contents(project_path, data)
}

fill_file_names <- function(
    project_path,
    data
) {

}

fill_file_contents <- function(
    project_path,
    data
) {

}
