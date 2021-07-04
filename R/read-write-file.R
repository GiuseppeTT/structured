read_file <- function(
    path
) {
    if (.Platform$OS.type == "windows")
        next_line <- "\r\n"
    else
        next_line <- "\n"

    lines <- readLines(path)
    content <- paste(lines, collapse = next_line)
    content <- paste(content, next_line, sep = "")

    return(content)
}

write_file <- function(
    path,
    content
) {
    writeLines(content, path, sep = "")
}
