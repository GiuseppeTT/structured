# structured
<!-- badges: start -->
[![lifecycle](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://www.tidyverse.org/lifecycle)
[![R-CMD-check](https://github.com/GiuseppeTT/structured/workflows/R-CMD-check/badge.svg)](https://github.com/GiuseppeTT/structured/actions)
[![lint](https://github.com/GiuseppeTT/structured/workflows/lint/badge.svg)](https://github.com/GiuseppeTT/structured/actions)
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
<img src="man/figures/usage-rstudio.gif" />

Follow these steps:

1. In the top bar, click "File" and then "New Project..."
1. Select "New Directory"
1. Scroll down, select either "Basic Structured Project" or "Intermediate Structured Project"
1. Type a name in "Directory name:" for your project folder
1. Choose a folder in "Create project as subdirectory of:" to be the parent directory of your project folder
1. Select one of the project types in "Project Type:"
1. Click "Create Project"

That's it! You can start coding now.

### In R console
**Modify** and paste these commands in your R console:

```r
library(structured)

# path can be either a relative or an absolute path
#
# level must be one of:
# - "Basic"
# - "Intermediate"
#
# type must be one of:
# - "Script"
# - "R Markdown (Simplified)"
# - "R Markdown"
# - "Targets"
# - "Shiny"
# - "None"
#
# if open is TRUE, open the project (if on RStudio) or simply set the working
# directory (if not on RStudio). Else, do nothing.
structure_project(
    path = "my-cool-project",
    level = "Basic",
    type = "Script",
    open = TRUE
)
```

That's it! You can start coding now.
