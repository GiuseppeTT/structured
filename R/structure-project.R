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
#' Project level. One of "Basic" or "Intermediate". Default to "Basic".
#'
#' @param type
#' Project type. One of "Script", "R Markdown (Simplified)", "R Markdown",
#' "Targets", "Shiny" or "None". Default to "Script".
#'
#' @param open
#' Open option. If `TRUE` and on RStudio, open the project in a new session. If
#' `TRUE` and not on RStudio, just set the working directory to the new project
#' directory. If `FALSE` (default), do nothing.
#'
#' @return
#' Return the project path invisibly.
#'
#' @examples
#' \dontrun{
#' structure_project("cool-project", level = "Basic", type = "Script")
#' }
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
        "Shiny",
        "None"
    ),
    open = FALSE
) {
    level <- match.arg(level)
    type <- match.arg(type)

    fs::dir_create(path, recurse = TRUE)

    copy_files(path, level, type)
    rename_gitignores(path)
    fill_files(path, level, type)
    clean_files(path)

    if (open)
        open_project(path)

    return(invisible(path))
}
