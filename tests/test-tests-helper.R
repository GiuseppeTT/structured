# test_that("paths are compared correctly", {
#     local_test_directory()
#     fs::dir_create("foo")

#     expect_success(expect_equal_path(".", "."))
#     expect_success(expect_equal_path(getwd(), "."))
#     expect_success(expect_equal_path(fs::path_abs("foo"), "foo"))
#     expect_failure(expect_equal_path(1, 2), "has length 1, not length 2.")
#     expect_success(expect_equal_path(1:10, 10))
#     expect_success(expect_equal_path(letters[1:5], 5))
# })
