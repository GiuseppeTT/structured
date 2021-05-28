copy_files <- function(
    project_path,
    project_level,
    analysis_format
) {
    copy_base_structure(project_path)
    copy_project_level_structure(project_path, project_level)
    copy_analysis_format_structure(project_path, analysis_format)
}

copy_base_structure <- function(
    project_path
) {
    copy_structure(project_path, "base")
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
        "R Markdown (Structured)" = "r-markdown-structured",
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
