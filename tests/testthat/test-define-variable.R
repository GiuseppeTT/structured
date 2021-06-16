test_that("get_project_slug works", {
    path <- "long/path/my-project"

    expect_equal(get_project_slug(path), "my-project")
})

test_that("get_project_name works", {
    path <- "long/path/my-project"

    expect_equal(get_project_name(path), "my project")
})
