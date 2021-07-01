.structure_basic_project <- function(
    path,
    ...
) {
    dots <- list(...)

    # RStudio project template feature opens using another mechanism
    structure_project(
        path,
        level = "Basic",
        type = dots$type,
        open = FALSE
    )
}

.structure_intermediate_project <- function(
    path,
    ...
) {
    dots <- list(...)

    # RStudio project template feature opens using another mechanism
    structure_project(
        path,
        level = "Intermediate",
        type = dots$type,
        open = FALSE
    )
}
