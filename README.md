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

# project_path can be either a relative or an absolute path
#
# project_level must be one of:
# - "Basic"
# - "Intermediate"
#
# analysis_format must be one of:
# - "Script"
# - "R Markdown (Simplified)"
# - "R Markdown"
# - "Targets"
# - "Shiny"
structure_project(
    project_path = "my-cool-project",
    project_level = "Basic",
    analysis_format = "Script"
)
```

That's it! You can start coding now.
