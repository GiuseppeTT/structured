test_that("paths are compared correctly", {
    local_test_directory()

    expect_success(expect_equal_path("foo", "foo"))
    expect_failure(expect_equal_path("foo", "bar"))
    expect_success(expect_equal_path(fs::path_abs("foo"), "foo"))
    expect_failure(
        expect_equal_path(fs::path_abs("/foo"), fs::path_abs("/bar")),
        'fs::path_abs\\("/foo"\\) has true path /foo, not /bar\\.'
    )
    expect_success(expect_equal_path(".", "."))
    expect_success(expect_equal_path(getwd(), "."))
})
