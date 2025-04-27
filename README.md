# Impact of Hospital Closures on Local Employment

This repository accompanies the study **Hospital Closures and Their Local Labor Market Fallout: Estimating the Causal Impact on Employment in German Municipalities**, which examines the effects of hospital closures on local labor market outcomes in Germany between 2010 and 2020.

The analysis applies state-of-the-art Difference-in-Differences (DiD) methodologies for staggered treatment timing [Callaway & Sant’Anna (2021)](https://doi.org/10.1016/j.jeconom.2020.12.001) and leverages a manually validated dataset of hospital closures.

It contains the full reproducible codebase, processed datasets, and output files necessary to replicate the results presented in the paper.

## Table of Contents

-   [Project Overview](https://github.com/nikpaw/MDS_MT_clean/edit/main/README.md#project-overview)

-   [Folder Structure](https://github.com/nikpaw/MDS_MT_clean/edit/main/README.md#project-overview)

-   [How to Reproduce the Results](https://github.com/nikpaw/MDS_MT_clean/edit/main/README.md#project-overview)

-   [Data Sources](https://github.com/nikpaw/MDS_MT_clean/edit/main/README.md#project-overview)

-   [Software Requirements](https://github.com/nikpaw/MDS_MT_clean/edit/main/README.md#project-overview)

-   [License](https://github.com/nikpaw/MDS_MT_clean/edit/main/README.md#project-overview)

## Project Overview

This study investigates the causal effect of hospital closures on local labor market outcomes in Germany. The empirical strategy isolates the treatment effect of hospital closures at the municipality level using a Difference-in-Differences design with multiple periods and staggered treatment adoption.

Key features include:

-   Construction of a manually validated closure event database.

-   Robustness checks through placebo tests, subgroup analyses (by rurality and by gender), spillover assessments, and anticipation effect modeling.

-   Analysis of dynamic effects over extended post-closure periods.

Findings indicate persistent and statistically significant reductions in local employment following hospital closures, with no evidence of labor market recovery over the observed period.

## Folder Structure

```         
├── data/
│   ├── raw/                  # Raw source data (internal use, created for running from raw data)
│   ├── processed/            # Cleaned and processed datasets (internal use, created for running from raw data)
│   ├── reproducible/         # Final datasets for reproduction
│   └── supplementary_files/  # Manually added research or matching files
├── output/
│   ├── reports/              # Rendered HTML reports
│   └── figures/              # Figures and plots
├── R/                        # Scripts and RMarkdown files
├── 00_master/                # Scripts controlling project execution (master scripts)
│   └── 00_master_run_reproducible.R        # Master script for reproducible setup 
├── 00_setup/                 # Scripts setting up the environment (packages, paths, functions)
│   ├── 00_setup_download_raw_data.R       # Download raw data from external sources (internal use, created for running from raw data)
│   └── 00_setup_packages_paths_functions.R# Install/load packages, define paths and helper functions for  raw data (internal use, created for running from raw data)
│   └── 00_setup_packages_paths_functions.R# Install/load packages, define paths and helper functions
├── 01_cleaning/              # RMarkdown scripts cleaning and preparing raw datasets  (internal use, created for running from raw data)
│   ├── 01_geodata_load_and_clean.Rmd       # Load and clean geospatial data
│   ├── 01_hospital_reports_load_and_clean.Rmd # Load and clean hospital report data
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

1.  Clone or download the repository.

2.  Open the RStudio project (`MDS_MT_clean.Rproj`).

3.  Execute the master script for reproducibility:

```         
source("00_master/00_master_run_reproducible.R") 
```

This script will:

-   Install and load required R packages.

-   Load validated, processed datasets.

-   Merge data sources and define estimation samples.

-   Conduct DiD estimation and robustness checks.

-   Generate outputs (reports, figures, tables).

## Data Sources

-   German Federal Statistical Office (Statistisches Bundesamt)

-   Krankenhausqualitätsberichte (Hospital Quality Reports)

-   Krankenhausverzeichnis (Hospital Directory)

-   RegioStaR Municipality Classification System

-   Wegweiser Kommune Employment Statistics

Closure events were cross-validated using multiple independent administrative registries, media sources, and institutional records to ensure data reliability.

## Software Requirements

-   R version 4.2.0 or higher.

-   All required R packages are automatically installed via the setup script (`00_setup/00_setup_packages_paths_functions.R`).

## License

Licensed under the MIT License.
