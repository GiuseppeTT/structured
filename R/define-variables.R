define_variables <- function(
    path,
    level,
    type
) {
    variables <- list(
        project_slug = get_project_slug(path),
        project_name = get_project_name(path),
        how_to_run = get_how_to_run(type),
        ignored_files = get_ignored_files(type)
    )

    return(variables)
}

get_project_slug <- function(
    path
) {
    project_slug <- fs::path_file(path)

    return(project_slug)
}

get_project_name <- function(
    path
) {
    project_slug <- get_project_slug(path)
    project_name <- gsub("[-_]", " ", project_slug)

    return(project_name)
}

get_how_to_run <- function(
    type
) {
    how_to_run <- switch(
        type,
        "Script" = "run script `analysis.R`",
        "R Markdown (Simplified)" = "knit document `analysis.Rmd`",
        "R Markdown" = "run script `render.R`",
        "Targets" = "execute command `targets::tar_make()`",
        "Shiny" = "run script `app.R`",
        stop("Invalid project type")
    )

    return(how_to_run)
}

get_ignored_files <- function(
    type
) {
    ignored_files <- switch(
        type,
        "Script" = "",
        "R Markdown (Simplified)" = "",
        "R Markdown" = "",
        "Targets" = "_targets/",
        "Shiny" = "",
        stop("Invalid project type")
    )

    return(ignored_files)
}
