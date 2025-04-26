# 00_1_master_run_reproducible.R
# Master Script: Load Packages, Load Processed Data, Run Main Analysis

cat("\n==== Basic Setup ====\n")

# Load packages and basic setup
source(here::here("R", "00_load_packages.R"))


# === Load processed (pre-cleaned) data ===
cat("\n==== Loading Processed Data ====\n")

rmd_load_files <- list(
  here::here("R", "02_geodata_load_processed_data.Rmd"),
  here::here("R", "02_khv_load_processed_data.Rmd"),
  here::here("R", "02_wk_load_processed_data.Rmd"),
  here::here("R", "02_hospital_reports_load_processed_data.Rmd")
)

for (file in rmd_load_files) {
  if (file.exists(file)) {
    cat("-> Loading:", basename(file), "\n")
    rmarkdown::render(
      input = file,
      output_dir = here::here("output", "reports")
    )
  } else {
    cat("!! File not found:", file, "\n")
  }
}


# === Merge data and run analyses ===
cat("\n==== Merging Data and Running Analyses ====\n")

rmd_analysis_files <- list(
  here::here("R", "03_1_merge_and_prepare_data.Rmd"),
  here::here("R", "03_2_estimate_main_models.Rmd"),
  here::here("R", "03_3_conduct_robustness_tests.Rmd")
)

for (file in rmd_analysis_files) {
  if (file.exists(file)) {
    cat("-> Running:", basename(file), "\n")
    rmarkdown::render(
      input = file,
      output_dir = here::here("output", "reports")
    )
  } else {
    cat("!! File not found:", file, "\n")
  }
}


cat("\n==== Reproducible Project Setup Completed ====\n")
