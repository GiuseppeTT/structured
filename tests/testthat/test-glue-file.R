test_that("glue_file_base works", {
    template <- "{{test}}"
    variables <- list(test = 123)

    glued_file <- as.character(glue_file_base(template, variables))

    expect_equal(glued_file, "123")
})

test_that("glue_file_path works", {
    root_path <- fs::file_temp()
    fs::dir_create(root_path)
    template_path <- fs::path(root_path, "{{test}}.txt")
    fs::file_touch(template_path)
    variables <- list(test = "my-project")

    glued_path <- glue_file_path(template_path, variables)

    expect_equal(glued_path, fs::path(root_path, "my-project.txt"))
})

test_that("glue_file_content works", {
    test_path <- fs::path_package("structured", "test/{{test}}.txt")
    path <- fs::file_temp()
    fs::file_copy(test_path, path)
    variables <- list(test = "my-variable")

    glue_file_content(path, variables)
    content <- read_file(path)

    expect_equal(content, "123\nmy-variable\n")
})
