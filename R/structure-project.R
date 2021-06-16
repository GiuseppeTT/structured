#' @title
#' Create a structured project
#'
#' @description
#' Create a structured project from a given template.
#'
#' @param path
#' Path to the new project.
#'
#' @param level
#' Project level. One of "Basic" or "Intermediate".
#'
#' @param type
#' Project type. One of "Script", "R Markdown (Simplified)", "R Markdown",
#' "Targets" or "Shiny".
#'
#' @export
structure_project <- function(
    path,
    level = c(
        "Basic",
        "Intermediate"
    ),
    type = c(
        "Script",
        "R Markdown (Simplified)",
        "R Markdown",
        "Targets",
        "Shiny"
    )
) {
    level <- match.arg(level)
    type <- match.arg(type)

    fs::dir_create(path, recurse = TRUE)

    copy_files(path, level, type)
    rename_gitignores(path)
    fill_files(path, level, type)
    clean_files(path)
}
