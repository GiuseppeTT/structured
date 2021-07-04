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
    root <- fs::path_package("structured", "tests-file")
    test_file <- fs::path(root, file)

    path <- fs::file_copy(test_file, ".")
    path <- fs::path_rel(path)

    return(invisible(path))
}

expect_equal_path <- function(object, expected) {
    act <- testthat::quasi_label(rlang::enquo(object), arg = "object")
    exp <- testthat::quasi_label(rlang::enquo(expected), arg = "expected")

    act$true_path <- path_true(act$val)
    exp$true_path <- path_true(exp$val)
    testthat::expect(
        act$true_path == exp$true_path,
        glue::glue("{act$lab} has true path {act$true_path}, not {exp$true_path}.")
    )

    invisible(act$val)
}

path_true <- function(
    path
) {
    true_path <- fs::path_abs(path)

    if (fs::is_link(true_path))
        true_path <- fs::link_path(true_path)

    return(true_path)
}
