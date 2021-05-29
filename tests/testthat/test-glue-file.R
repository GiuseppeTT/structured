test_that("glue_file_base works", {
    variables <- list(test = 123)
    template <- "{{test}}"
    glued_file <- as.character(glue_file_base(template, variables))

    expect_equal(glued_file, "123")
})

test_that("glue_file_path works", {
    variables <- list(test = "my-project")
    path_template <- fs::path("test/{{test}}.Rproj")
    glued_path <- as.character(glue_file_path(path_template, variables))

    expect_equal(glued_path, "test/my-project.Rproj")
})

test_that("glue_file_content works", {
    variables <- list(test = "my-variable")
    test_path <- fs::path_package("structured", "test/test.txt")
    path <- fs::file_temp()
    fs::file_copy(test_path, path)

    glue_file_content(path, variables)
    content <- read_file(path)

    expect_equal(content, "123\nmy-variable\n")
})
