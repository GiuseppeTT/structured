read_file <- function(
    path
) {
    return(readChar(path, file.info(path)$size))
}

write_file <- function(
    path,
    content
) {
    cat(content, file = path)
}
