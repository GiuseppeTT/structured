# structured
The `structured` package is a tool to create structured R projects. You can check its documentation [here](https://giuseppett.github.io/structured).

## Installation
Paste these commands in your R console:

```r
install.packages("remotes")
remotes::install_github("GiuseppeTT/structured")
```

## Usage

### In RStudio
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
    project_path = "my-cool-project",  # Choose your project directory name
    project_level = "Basic"  # One of "Basic" or "Intermediate",
    analysis_format = "Script"  # One of "Script", "R Markdown", "R Markdown (Structured)" or "Shiny"
)
```

That's it! You can start coding now.
