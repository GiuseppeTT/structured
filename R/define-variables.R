define_variables <- function(
    project_path,
    project_level,
    analysis_format
) {
    variables <- list(
        project_slug = get_project_slug(project_path),
        project_name = get_project_name(project_path),
        how_to_run = get_how_to_run(analysis_format)
    )

    return(variables)
}

get_project_slug <- function(
    project_path
) {
    project_slug <- fs::path_file(project_path)

    return(project_slug)
}

get_project_name <- function(
    project_path
) {
    project_slug <- get_project_slug(project_path)
    project_name <- gsub("[-_]", " ", project_slug)

    return(project_name)
}

get_how_to_run <- function(
    analysis_format
) {
    how_to_run <- switch(
        analysis_format,
        "Script" = "run script `analysis.R`",
        "R Markdown (Simplified)" = "knit document `analysis.Rmd`",
        "R Markdown" = "run script `render.R`",
        "Shiny" = "run script `app.R`",
        stop("Invalid analysis format")
    )

    return(how_to_run)
}
