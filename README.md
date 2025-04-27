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
│   ├── raw/                  # Raw source data (only for full rebuild)
│   ├── processed/            # Cleaned and processed datasets (created if running from raw)
│   ├── reproducible/         # Final datasets for reproduction (recommended default)
│   ├── supplementary_files/  # Manually added research or matching files
├── output/
│   ├── reports/              # Rendered HTML reports
│   ├── figures/              # Figures and plots
├── R/                        # Scripts and RMarkdown files
│   ├── 00_1_master_run_reproducible.R
│   ├── 00_2_alternative_master_run_from_raw.R
│   ├── 00_download_raw_data.R
│   ├── 00_load_packages_paths_functions.R
│   ├── 01_geodata_load_and_clean.Rmd
│   ├── 01_hospital_reports_load_and_clean_TBA.Rmd
│   ├── 01_khv_load_and_clean.Rmd
│   ├── 01_wk_download_and_clean.Rmd
│   ├── 02_geodata_load_processed_data.Rmd
│   ├── 02_hospital_reports_load_processed_data.Rmd
│   ├── 02_khv_load_processed_data.Rmd
│   ├── 02_wk_load_processed_data.Rmd
│   ├── 03_1_merge_and_prepare_data.Rmd
│   ├── 03_2_estimate_main_models.Rmd
│   ├── 03_3_conduct_robustness_tests.Rmd
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
