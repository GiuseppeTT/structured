test_that("glue_file_base works", {
    template <- "{{test}}test"
    variables <- list(test = 123)

    glued_file <- as.character(glue_file_base(template, variables))

    expect_equal(glued_file, "123test")
})

test_that("glue_file_path works", {
    local_test_directory()
    path <- copy_test_file("{{test}}.txt")

    variables <- list(test = "my-project")
    glued_path <- glue_file_path(path, variables)

    expect_equal(glued_path, fs::path("my-project.txt"))
})

test_that("glue_file_content works", {
    local_test_directory()
    path <- copy_test_file("{{test}}.txt")

    variables <- list(test = "my-variable")
    glue_file_content(path, variables)
    content <- read_file(path)

    if (.Platform$OS.type == "windows")
        expect_equal(content, "123\rznmy-variable\rzn")
    else
        expect_equal(content, "123\nmy-variable\n")
})
