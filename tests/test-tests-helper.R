test_that("length computed correctly", {
    expect_success(expect_equal_path(1, 1))
    expect_failure(expect_equal_path(1, 2), "has length 1, not length 2.")
    expect_success(expect_equal_path(1:10, 10))
    expect_success(expect_equal_path(letters[1:5], 5))
})
