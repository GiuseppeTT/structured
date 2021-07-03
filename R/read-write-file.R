read_file <- function(
    path
) {
    #return(readChar(path, file.info(path)$size))

    if (.Platform$OS.type == "windows")
        next_line <- "\r\n"
    else
        next_line <- "\n"

    lines <- readLines(path)
    content <- paste(lines, collapse = next_line)
    content <- paste0(content, next_line)

    return (content)
}

write_file <- function(
    path,
    content
) {
    #cat(content, file = path)
    writeLines(content, path, sep = "")
}
