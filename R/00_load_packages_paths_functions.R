#### Loading Required Packages ####
if (!requireNamespace("rmarkdown", quietly = TRUE)) install.packages("rmarkdown")

required_packages <- c(
  "tidyverse", "sf", "giscoR", "rmapshaper", "rnaturalearth", "rnaturalearthhires",
  "maps", "tidygeocoder", "spdep", "GGally", "scales", "RColorBrewer", "viridis",
  "cols4all", "did", "synthdid", "fixest", "plm", "sandwich", "lmtest",
  "eurostat", "httr", "xml2", "knitr", "kableExtra", "zoo", "readxl", "here"
)

# Install missing packages
missing_packages <- setdiff(required_packages, rownames(installed.packages()))
if (length(missing_packages) > 0) {
  install.packages(missing_packages)
}

# Load all packages
invisible(lapply(required_packages, library, character.only = TRUE))

cat("All required packages loaded.\n\n")


#### Defining Useful Paths ####
path_base_geodata_reproducible <- here::here("data", "reproducible", "geodata")
path_base_hospital_reports_data_reproducible <- here::here("data", "reproducible", "hospital_reports_data")
path_base_khv_data_reproducible <- here::here("data", "reproducible", "khv_data")
path_base_wk_data_reproducible <- here::here("data", "reproducible", "wk_data")


path_output_figures <- here::here("output", "figures")
path_output_reports <- here::here("output", "reports")

# Optionally, create folders if they don't exist
dir.create(path_output_figures, recursive = TRUE, showWarnings = FALSE)
dir.create(path_output_reports, recursive = TRUE, showWarnings = FALSE)

cat("Output paths set and ensured.\n\n")


#### Defining Helper Functions ####


cat("Helper functions ready.\n\n")
