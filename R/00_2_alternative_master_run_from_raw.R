# 00_master_script.R
# Simple Master Script to Load Packages and Render First Rmd

# Define files to run
r_scripts <- list(
  here("R", "00_load_packages.R")
)

rmd_files <- list(
  here("R", "02_geodata_load_processed_data.Rmd"),
  here("R", "02_khv_load_processed_data.Rmd"),
  here("R", "02_wk_load_processed_data.Rmd"),
  here("R", "02_hospital_reports_load_processed_data.Rmd")
)


# --- 1. Source all R scripts ---
cat("==== Running R scripts ====\n")

for (file in r_scripts) {
  if (file.exists(file)) {
    cat("-> Sourcing:", file, "\n")
    source(file)
  } else {
    cat("!! File not found:", file, "\n")
  }
}

# --- 2. Render all RMarkdown files to output/reports/ ---
cat("\n==== Rendering RMarkdown files ====\n")

for (file in rmd_files) {
  if (file.exists(file)) {
    cat("-> Rendering:", file, "\n")
    rmarkdown::render(
      input = file,
      output_dir = here("output", "reports")
    )
  } else {
    cat("!! File not found:", file, "\n")
  }
}