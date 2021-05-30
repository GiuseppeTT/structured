test_that("get_project_slug works", {
    project_path <- "long/path/my-project"

    expect_equal(get_project_slug(project_path), "my-project")
})

test_that("get_project_name works", {
    project_path <- "long/path/my-project"

    expect_equal(get_project_name(project_path), "my project")
})
