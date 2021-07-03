read_file <- function(
    path
) {
    #return(readChar(path, file.info(path)$size))
    lines <- readLines(path)
    content <- paste(lines, collapse = "\n")
    content <- paste0(content, "\n")

    return (content)
}

write_file <- function(
    path,
    content
) {
    #cat(content, file = path)
    writeLines(content, path, sep = "")
}
