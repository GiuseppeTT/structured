copy_files <- function(
    path,
    level,
    type
) {
    copy_base_structure(path)
    copy_level_structure(path, level)
    copy_type_structure(path, type)
}

copy_base_structure <- function(
    path
) {
    copy_structure(path, "base")
}

copy_level_structure <- function(
    path,
    level
) {
    level_path <- switch(
        level,
        "Basic" = "basic",
        "Intermediate" = "intermediate",
        stop("Invalid project level")
    )
    level_path <- fs::path("project-level", level_path)

    copy_structure(path, level_path)
}

copy_type_structure <- function(
    path,
    type
) {
    type_path <- switch(
        type,
        "Script" = "script",
        "R Markdown (Simplified)" = "r-markdown-simplified",
        "R Markdown" = "r-markdown",
        "Targets" = "targets",
        "Shiny" = "shiny",
        stop("Invalid type")
    )
    type_path <- fs::path("analysis-format", type_path)

    copy_structure(path, type_path)
}

copy_structure <- function(
    path,
    structure_name
) {
    structure_root <- fs::path_package("structured", "structure")
    structure_path <- fs::path(structure_root, structure_name, "/.")

    fs::dir_copy(structure_path, path)
}
