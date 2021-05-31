test_that("read_file works", {
    local_test_directory()
    path <- copy_test_file("{{test}}.txt")

    content <- read_file(path)

    expect_equal(content, "123\n{{test}}\n")
})

test_that("read(write(read(path))) works", {
    local_test_directory()
    path <- copy_test_file("{{test}}.txt")

    first_content <- read_file(path)
    write_file(path, first_content)
    second_content <- read_file(path)

    expect_equal(second_content, first_content)
})

test_that("write_file works", {
    local_test_directory()
    path <- fs::file_touch("{{123}}.txt")

    true_content <- "test\n123\n"
    write_file(path, true_content)
    read_content <- read_file(path)

    expect_equal(read_content, true_content)
})
