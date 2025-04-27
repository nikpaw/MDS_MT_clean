# Hospital Closures and Their Local Labour Market Fallout

This repository contains the full code, processed datasets, and output files for the empirical analysis examining the impact of hospital closures on municipal employment levels in Germany between 2010 and 2020. The analysis applies state-of-the-art Difference-in-Differences (DiD) methodologies for staggered treatment timing (Callaway & Sant’Anna, 2021) and leverages a manually validated dataset of hospital closures.

## Table of Contents

-    [Project Overview](https://chatgpt.com/c/680baebe-06b0-8011-b832-7f35c8428544#project-overview)

-    [Folder Structure](https://chatgpt.com/c/680baebe-06b0-8011-b832-7f35c8428544#folder-structure)

-    [How to Reproduce the Results](https://chatgpt.com/c/680baebe-06b0-8011-b832-7f35c8428544#how-to-reproduce-the-results)

-    [Data Sources](https://chatgpt.com/c/680baebe-06b0-8011-b832-7f35c8428544#data-sources)

-    [Software Requirements](https://chatgpt.com/c/680baebe-06b0-8011-b832-7f35c8428544#software-requirements)

-    [License](https://chatgpt.com/c/680baebe-06b0-8011-b832-7f35c8428544#license)

## Project Overview

This study investigates the causal effect of hospital closures on local labor market outcomes in Germany. The empirical strategy isolates the treatment effect of hospital closures at the municipality level using a Difference-in-Differences design with multiple periods and staggered treatment adoption.

Key features include:

-    Construction of a manually validated closure event database.

-    Robustness checks through placebo tests, subgroup analyses (by rurality and by gender), spillover assessments, and anticipation effect modeling.

-    Analysis of dynamic effects over extended post-closure periods.

Findings indicate persistent and statistically significant reductions in local employment following hospital closures, with no evidence of labor market recovery over the observed period.

## Folder Structure

```         
├── data/
│   ├── raw/                  # Raw source data (only for full rebuild, work in progress)
│   ├── processed/            # Cleaned and processed datasets (created if running from raw, work in progress)
│   ├── reproducible/         # Final datasets for reproduction (recommended default)
│   └── supplementary_files/  # Manually added research or matching files
├── output/
│   ├── reports/              # Rendered HTML reports
│   └── figures/              # Figures and plots
├── R/                        # Scripts and RMarkdown files
├── 00_master/                # Scripts controlling project execution (master scripts)
│   ├── 00_master_run_from_raw.R           # Master script for full rebuild from raw data (optional, work in progress)
│   └── 00_master_run_reproducible.R        # Master script for reproducible setup (recommended default)
├── 00_setup/                 # Scripts setting up the environment (packages, paths, functions)
│   ├── 00_setup_download_raw_data.R       # Download raw data from external sources (optional, work in progress)
│   └── 00_setup_packages_paths_functions.R# Install/load packages, define paths and helper functions (recommended default)
├── 01_cleaning/              # RMarkdown scripts cleaning and preparing raw datasets
│   ├── 01_geodata_load_and_clean.Rmd       # Load and clean geospatial data
│   ├── 01_hospital_reports_load_and_clean.Rmd # Load and clean hospital report data (work in progress)
│   ├── 01_khv_load_and_clean.Rmd           # Load and clean KHV dataset
│   └── 01_wk_download_and_clean.Rmd        # Download and clean Wegweiser Kommune data
├── 02_loading/               # RMarkdown scripts loading processed datasets for analysis
│   ├── 02_geodata_load_processed_data.Rmd  # Load pre-cleaned geospatial data
│   ├── 02_hospital_reports_load_processed_data.Rmd # Load pre-cleaned hospital report data
│   ├── 02_khv_load_processed_data.Rmd      # Load pre-cleaned KHV data
│   └── 02_wk_load_processed_data.Rmd       # Load pre-cleaned Wegweiser Kommune data
├── 03_analysis/              # Main data merging, modeling, estimation, and robustness tests
│   ├── 03_1_merge_and_prepare_data.Rmd     # Merge datasets, define samples and variables
│   ├── 03_2_estimate_main_models.Rmd       # Main model estimation
│   └── 03_3_conduct_robustness_tests.Rmd   # Robustness checks and additional analyses
├── doc/                      # Final paper
├── .gitignore                # Git version control ignore file
├── LICENSE                   # Project license
├── README.md                 # Project overview and instructions
├── MDS_MT_clean.Rproj        # RStudio project file

```

## How to Reproduce the Results

To reproduce the results, follow these steps:

1.   Clone or download the repository.

2.   Open the RStudio project (`MDS_MT_clean.Rproj`).

3.   Execute the master script for reproducibility:

```         
source("00_master/00_master_run_reproducible.R") 
```

This script will:

-    Install and load required R packages.

-    Load validated, processed datasets.

-    Merge data sources and define estimation samples.

-    Conduct DiD estimation and robustness checks.

-    Generate outputs (reports, figures, tables).

-   

### Full Rebuild from Raw Data (Under Development)

If preferred, the full rebuild path can be initiated with:

```         
source("00_master/00_master_run_from_raw.R") 
```

**Note:** This process is substantially more time-intensive and remains under development.

## Data Sources

-    German Federal Statistical Office (Statistisches Bundesamt)

-    Krankenhausqualitätsberichte (Hospital Quality Reports)

-   Krankenhausverzeichnis (Hospital Directory)

-    RegioStaR Municipality Classification System

-   Wegweiser Kommune Employment Statistics

Closure events were cross-validated using multiple independent administrative registries, media sources, and institutional records to ensure data reliability.

## Software Requirements

-    R version 4.2.0 or higher.

-    All required R packages are automatically installed via the setup script (`00_setup/00_setup_packages_paths_functions.R`).

## License

Licensed under the MIT License.
