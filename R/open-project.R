open_project <- function(
    path
) {
    # Based on usethis::proj_activate
    if (rstudioapi::isAvailable())
        rstudioapi::openProject(path, newSession = TRUE)
    else
        setwd(path)
}
