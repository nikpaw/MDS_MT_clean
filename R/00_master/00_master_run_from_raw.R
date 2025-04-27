# 00_master/00_master_run_from_raw.R
# Master Script: Full Rebuild - Process Raw Data, Load, Analyze

cat("\n==== Full Rebuild: Caution Notice ====\n")

proceed <- readline(prompt = "Running this script from raw data will take several hours. Are you sure you want to proceed? (Yes/No): ")

if (tolower(proceed) != "yes") {
  cat("\nAborting script execution. No changes made.\n")
  stop("Script manually aborted by user.")
}

cat("\n==== Basic Setup ====\n")

# Load packages, paths, and helper functions
source(here::here("R", "00_setup", "00_setup_packages_paths_functions.R"))

# === Step 1: Clean Raw Data ===
cat("\n==== Processing Raw Data ====\n")

rmd_cleaning_files <- list(
  here::here("R", "01_cleaning", "01_geodata_load_and_clean.Rmd"),
  here::here("R", "01_cleaning", "01_khv_load_and_clean.Rmd"),
  here::here("R", "01_cleaning", "01_wk_download_and_clean.Rmd"),
  here::here("R", "01_cleaning", "01_hospital_reports_load_and_clean.Rmd")
)

for (file in rmd_cleaning_files) {
  if (file.exists(file)) {
    cat("-> Cleaning:", basename(file), "\n")
    rmarkdown::render(
      input = file,
      output_dir = here::here("output", "reports")
    )
  } else {
    cat("!! File not found:", file, "\n")
  }
}

# === Step 2: Load Processed Data ===
cat("\n==== Loading Processed Data ====\n")

rmd_load_files <- list(
  here::here("R", "02_loading", "02_geodata_load_processed_data.Rmd"),
  here::here("R", "02_loading", "02_khv_load_processed_data.Rmd"),
  here::here("R", "02_loading", "02_wk_load_processed_data.Rmd"),
  here::here("R", "02_loading", "02_hospital_reports_load_processed_data.Rmd")
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

# === Step 3: Merge Data and Run Analyses ===
cat("\n==== Merging Data and Running Analyses ====\n")

rmd_analysis_files <- list(
  here::here("R", "03_analysis", "03_1_merge_and_prepare_data.Rmd"),
  here::here("R", "03_analysis", "03_2_estimate_main_models.Rmd"),
  here::here("R", "03_analysis", "03_3_conduct_robustness_tests.Rmd")
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

cat("\n==== Full Project Rebuild Completed Successfully ====\n")
