# structured

<!-- badges: start -->
![lifecycle](https://img.shields.io/badge/lifecycle-experimental-orange.svg)
![R-CMD-check](https://github.com/GiuseppeTT/structured/workflows/R-CMD-check/badge.svg)
![lint](https://github.com/GiuseppeTT/structured/workflows/lint/badge.svg)
<!-- badges: end -->

The `structured` package is a tool to create structured R projects. You can check its documentation [here](https://giuseppett.github.io/structured).

## Installation
Paste these commands in your R console:

```r
install.packages("remotes")
remotes::install_github("GiuseppeTT/structured")
```

## Usage

### In RStudio

![usage-rstudio-gif](https://github.com/GiuseppeTT/structured/tree/main/man/figures/usage-rstudio.gif)

Follow these steps:

- In the top bar, click "File" and then "New Project..."
- Select "New Directory"
- Scroll down, select either "Basic Structure Project" or "Intermediate Structure Project"
- Type a name in "Directory name:" for your project folder and select one of the analysis formats in "Analysis Format:"
- Click "Create Project"

That's it! You can start coding now.

### In R console
**Modify** and paste these commands in your R console:

```r
library(structured)

structure_project(
    project_path = "my-cool-project",  # You can use either a realtive or an absolute path
    project_level = "Basic"
    analysis_format = "Script"
)
```

That's it! You can start coding now. For more information check `?structure_project()` documentation.
