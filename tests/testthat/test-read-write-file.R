test_that("read_file works", {
    local_test_directory()
    path <- copy_test_file("{{test}}.txt")

    content <- read_file(path)

    if (.Platform$OS.type == "windows")
        expect_equal(content, "123\r\n{{test}}\r\n")
    else
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

    write_file(path, "test\n123\n")
    read_content <- read_file(path)

    if (.Platform$OS.type == "windows")
        expect_equal(read_content, "test\r\n123\r\n")
    else
        expect_equal(read_content, "test\n123\n")
})
