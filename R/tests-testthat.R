local_test_directory <- function(
    envir = parent.frame()
) {
    path <- withr::local_tempdir(.local_envir = envir)
    withr::local_dir(path, .local_envir = envir)

    return(invisible(path))
}

copy_test_file <- function(
    file
) {
    root <- fs::path_package("structured", "tests-auxiliar")
    test_file <- fs::path(root, file)

    path <- fs::file_copy(test_file, ".")
    path <- fs::path_rel(path)

    return(invisible(path))
}
