# Load packages ----------------------------------------------------------------
library(tidyverse)
library(targets)
library(tarchetypes)


# Source auxiliary R files -----------------------------------------------------
source("R/functions.R")


# Define analysis targets ------------------------------------------------------
list(
  tar_target(
      complex_algebra,
      1 + 1
  )
)
