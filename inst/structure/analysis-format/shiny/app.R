# Load packages ----------------------------------------------------------------
library(tidyverse)
library(shiny)


# Source auxiliary R files -----------------------------------------------------
source("R/functions.R")
source("R/global.R")
source("R/ui.R")
source("R/server.R")


# Define options ---------------------------------------------------------------
options(shiny.autoload.r = FALSE)


# Run app ----------------------------------------------------------------------
shinyApp(ui, server)
