fill_files <- function(
    project_path,
    project_level,
    analysis_format
) {
    project_slug <- fs::path_file(project_path)
    project_name <- toupper(gsub("[-_]", " ", project_slug))
    how_to_run <- get_how_to_run(analysis_format)

    variables <- list(
        project_slug = project_slug,
        project_name = project_name,
        how_to_run = how_to_run
    )

    fill_file_names(project_path, variables)
    fill_file_contents(project_path, variables)
}

get_how_to_run <- function(
    analysis_format
) {
    how_to_run <- switch(
        analysis_format,
        "Script" = "run script `analysis.R`",
        "R Markdown" = "knit document `analysis.Rmd`",
        "R Markdown (Structured)" = "run script `render.R`",
        "Shiny" = "run script `app.R`",
        stop("Invalid analysis format")
    )

    return(how_to_run)
}

fill_file_names <- function(
    project_path,
    variables
) {
    old_paths <- fs::dir_ls(
        project_path,
        all = TRUE,
        recurse = TRUE,
        type = "file"
    )

    new_paths <- lapply(old_paths, glue_file_path, .variables = variables)
    new_paths <- unlist(new_paths, use.names = FALSE)
    new_paths <- fs::as_fs_path(new_paths)

    fs::file_move(old_paths, new_paths)
}

glue_file_path <- function(
    .path,
    .variables,
    ...
) {
    file_path <- glue::glue_data(
        .variables,
        .path,
        .open = "{{",
        .close = "}}",
        ...
    )

    return(file_path)
}

fill_file_contents <- function(
    project_path,
    variables
) {
    project_files <- fs::dir_ls(
        project_path,
        all = TRUE,
        recurse = TRUE,
        type = "file"
    )

    lapply(project_files, glue_file_content, .variables = variables)
}

glue_file_content <- function(
    .path,
    .variables,
    ...
) {
    file_content <- read_file(.path)
    file_content <- glue::glue_data(
        .variables,
        file_content,
        .open = "{{",
        .close = "}}",
        ...
    )

    write_file(.path, file_content)
}
