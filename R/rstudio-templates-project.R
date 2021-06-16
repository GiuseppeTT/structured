.structure_basic_project <- function(
    path,
    ...
) {
    dots <- list(...)

    structure_project(
        path,
        level = "Basic",
        type = dots$type
    )
}

.structure_intermediate_project <- function(
    path,
    ...
) {
    dots <- list(...)

    structure_project(
        path,
        level = "Intermediate",
        type = dots$type
    )
}
