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
