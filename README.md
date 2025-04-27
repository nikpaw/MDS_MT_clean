# Impact of Hospital Closures on Regional Employment

This repository contains the full reproducible code and data for the project analyzing the impact of hospital closures between 2010 and 2020 on local employment levels in Germany.

The analysis applies Difference-in-Differences methods with multiple time periods and staggered treatment adoption as developed by Callaway & Sant'Anna.

---

## Table of Contents

- [Project Overview](#project-overview)
- [Folder Structure](#folder-structure)
- [How to Reproduce the Results](#how-to-reproduce-the-results)
- [Data Sources](#data-sources)
- [Software Requirements](#software-requirements)
- [License](#license)

---

## Project Overview

The study estimates causal effects of hospital closures at the municipality level on employment levels.

Robustness checks include:
- Placebo tests
- Subgroup analyses (urban vs rural areas, gender)
- Spillover effects
- Anticipation effects

---

## Folder Structure

```
├── data/
│   ├── raw/                  # Raw source data (only for full rebuild, work in progress)
│   ├── processed/            # Cleaned and processed datasets (created if running from raw, work in progress)
│   ├── reproducible/         # Final datasets for reproduction (recommended default)
│   ├── supplementary_files/  # Manually added research or matching files
├── output/
│   ├── reports/              # Rendered HTML reports
│   ├── figures/              # Figures and plots
├── R/                        # Scripts and RMarkdown files
├── 00_master/             # Scripts controlling project execution (master scripts)
│   ├── 00_master_run_from_raw.R           # Master script for full rebuild from raw data (optional, work in progress)
│   └── 00_master_run_reproducible.R        # Master script for reproducible setup (recommended default)
│
├── 00_setup/              # Scripts setting up the environment (packages, paths, functions)
│   ├── 00_setup_download_raw_data.R       # Download raw data from external sources (optional, work in progress)
│   └── 00_setup_packages_paths_functions.R# Install/load packages, define paths and helper functions (recommended default)
│
├── 01_cleaning/           # RMarkdown scripts cleaning and preparing raw datasets
│   ├── 01_geodata_load_and_clean.Rmd       # Load and clean geospatial data
│   ├── 01_hospital_reports_load_and_clean.Rmd # Load and clean hospital report data (work in progress)
│   ├── 01_khv_load_and_clean.Rmd           # Load and clean KHV dataset
│   └── 01_wk_download_and_clean.Rmd        # Download and clean Wegweiser Kommune data
│
├── 02_loading/            # RMarkdown scripts loading processed datasets for analysis
│   ├── 02_geodata_load_processed_data.Rmd  # Load pre-cleaned geospatial data
│   ├── 02_hospital_reports_load_processed_data.Rmd # Load pre-cleaned hospital report data
│   ├── 02_khv_load_processed_data.Rmd      # Load pre-cleaned KHV data
│   └── 02_wk_load_processed_data.Rmd       # Load pre-cleaned Wegweiser Kommune data
│
├── 03_analysis/           # Main data merging, modeling, estimation, and robustness tests
│   ├── 03_1_merge_and_prepare_data.Rmd     # Merge datasets, define samples and variables
│   ├── 03_2_estimate_main_models.Rmd       # Main model estimation
│   └── 03_3_conduct_robustness_tests.Rmd   # Robustness checks and additional analyses
│
├── doc/                       # Final paper
├── .gitignore                 # Git version control ignore file
├── LICENSE                    # Project license
├── README.md                  # Project overview and instructions
├── MDS_MT_clean.Rproj         # RStudio project file

```

---

## How to Reproduce the Results

1. Clone or download the repository.
2. Open R or RStudio in the project folder.
3. Run the master script for the reproducible analysis:

```r
source("R/00_1_master_run_reproducible.R")
```

This script will:
- Install and load required R packages
- Load processed datasets
- Merge and prepare datasets
- Run estimations and robustness checks
- Generate outputs (reports, figures, tables)

### Optional: Full Rebuild from Raw Data (under construction)

If you wish to reproduce every step from scratch starting from raw data:

```r
source("R/00_2_alternative_master_run_from_raw.R")
```

(Note: This process is considerably more time-intensive and not recommended.)

---

## Data Sources

- German Federal Statistical Office (Statistisches Bundesamt)
- Krankenhausverzeichnis (Hospital Directory)
- Hospital Quality Reports (Krankenhausqualitätsberichte)
- Regional classification system (RegioStaR)
- Employment statistics

---

## Software Requirements

- R version 4.2.0 or higher
- see R/00_load_packages.R for full list of all required packages, packages are installed automatically.

---

## License

Licensed under the MIT License
