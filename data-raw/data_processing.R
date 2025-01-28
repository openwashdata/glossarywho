# Description ------------------------------------------------------------------
# R script to process uploaded raw data into a tidy, analysis-ready data frame
# Load packages ----------------------------------------------------------------
## Run the following code in console if you don't have the packages
## install.packages(c("usethis", "fs", "here", "readr", "readxl", "openxlsx"))
library(usethis)
library(fs)
library(here)
library(readr)
library(readxl)
library(openxlsx)

# Read data --------------------------------------------------------------------
themes <- readr::read_csv(here::here("data-raw", "tidy_data_themes.csv"))

# Read definitions excel file
definitions <- readxl::read_xlsx(here::here("data-raw", "definitions.xlsx"))

# Export Data ------------------------------------------------------------------
usethis::use_data(themes, definitions, overwrite = TRUE)
fs::dir_create(here::here("inst", "extdata"))
readr::write_csv(themes,
                 here::here("inst", "extdata", paste0("themes", ".csv")))
openxlsx::write.xlsx(themes,
                     here::here("inst", "extdata", paste0("themes", ".xlsx")))
readr::write_csv(definitions,
                 here::here("inst", "extdata", paste0("definitions", ".csv")))
openxlsx::write.xlsx(definitions,
                 here::here("inst", "extdata", paste0("definitions", ".xlsx")))


