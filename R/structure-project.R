#' @title
#' Create a structured project
#'
#' @description
#' Create a structured project from a given template.
#'
#' @param project_path
#' Path to the new project.
#'
#' @param project_level
#' Project level. One of "Basic" or "Intermediate".
#'
#' @param analysis_format
#' Analysis format. One of "Script", "R Markdown", "R Markdown (Structured)" or
#' "Shiny".
#'
#' @export
structure_project <- function(
    project_path,
    project_level = c(
        "Basic",
        "Intermediate"
    ),
    analysis_format = c(
        "Script",
        "R Markdown",
        "R Markdown (Structured)",
        "Shiny"
    )
) {
    project_level <- match.arg(project_level)
    analysis_format <- match.arg(analysis_format)

    fs::dir_create(project_path, recurse = TRUE)

    copy_files(project_path, project_level, analysis_format)
    fill_files(project_path, project_level, analysis_format)
    clean_files(project_path)
}
