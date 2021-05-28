.structure_basic_project <- function(
    path,
    ...
) {
    dots <- list(...)

    structure_project(
        path,
        project_level = "Basic",
        analysis_format = dots$analysis_format
    )
}

.structure_intermediate_project <- function(
    path,
    ...
) {
    dots <- list(...)

    structure_project(
        path,
        project_level = "Intermediate",
        analysis_format = dots$analysis_format
    )
}

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

    copy_base_structure(project_path)
    copy_project_level_structure(project_path, project_level)
    copy_analysis_format_structure(project_path, analysis_format)

    delete_gitkeeps(project_path)
}

copy_base_structure <- function(
    project_path
) {
    copy_structure(project_path, "base")
    rename_rproj(project_path)
}

rename_rproj <- function(
    project_path
) {
    project_slug <- fs::path_file(project_path)
    old_rproj <- fs::path(project_path, "{{project_slug}}.Rproj")
    new_rproj <- fs::path(project_path, paste0(project_slug, ".Rproj"))

    fs::file_move(old_rproj, new_rproj)
}

copy_project_level_structure <- function(
    project_path,
    project_level
) {
    project_level_path <- switch(
        project_level,
        "Basic" = "basic",
        "Intermediate" = "intermediate",
        stop("Invalid project level")
    )
    project_level_path <- fs::path("project-level", project_level_path)

    copy_structure(project_path, project_level_path)
}

copy_analysis_format_structure <- function(
    project_path,
    analysis_format
) {
    analysis_format_path <- switch(
        analysis_format,
        "Script" = "script",
        "R Markdown" = "r-markdown",
        "R Markdown (Structured)" =  "r-markdown-structured",
        "Shiny" = "shiny",
        stop("Invalid analysis format")
    )
    analysis_format_path <- fs::path("analysis-format", analysis_format_path)

    copy_structure(project_path, analysis_format_path)
}

copy_structure <- function(
    project_path,
    structure_name
) {
    structure_root <- fs::path_package("structured", "structure")
    structure_path <- fs::path(structure_root, structure_name, "/.")

    fs::dir_copy(structure_path, project_path)
}

delete_gitkeeps <- function(
    project_path
) {
    gitkeep_paths <- fs::dir_ls(
        project_path,
        all = TRUE,
        recurse = TRUE,
        type = "file",
        regexp = ".gitkeep$"
    )

    fs::file_delete(gitkeep_paths)
}
