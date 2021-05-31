glue_file_path <- function(
    .path,
    .variables,
    ...
) {
    new_path <- glue_file_base(.path, .variables, ...)

    fs::file_move(.path, new_path)
}

glue_file_content <- function(
    .path,
    .variables,
    ...
) {
    file_content <- read_file(.path)
    file_content <- glue_file_base(file_content, .variables, ...)

    write_file(.path, file_content)
}

glue_file_base <- function(
    .file,
    .variables,
    ...
) {
    glued_file <- glue::glue_data(
        .variables,
        .file,
        .open = "{{",
        .close = "}}",
        .trim = FALSE,
        ...
    )

    return(glued_file)
}
