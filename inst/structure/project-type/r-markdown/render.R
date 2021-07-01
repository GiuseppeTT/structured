# Load packages ----------------------------------------------------------------
library(rmarkdown)


# Render R Markdown files ------------------------------------------------------
rmarkdown_files <- list.files("Rmd/", pattern = "*.Rmd$", full.names = TRUE)
output_directory <- "output/"
project_directory <- getwd()

render(
    input = rmarkdown_files,
    output_dir = output_directory,
    knit_root_dir = project_directory
)
