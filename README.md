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
│   ├── raw/              # Raw source data (only for full rebuild)
│   ├── processed/        # Cleaned and processed datasets (in case of full rebuild)
│   ├── reproducible/     # Cleaned and processed datasets (for reproduction, recommended)
├── output/
│   ├── reports/          # Rendered HTML reports
│   ├── figures/          # Figures and plots
├── R/
│   ├── Scripts and RMarkdown files, ordered by execution (00_, 01_, 02_, 03_)
├── doc/
│   ├── Documentation and supplementary files
├── README.md
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

### Optional: Full Rebuild from Raw Data

If you have access to raw data and wish to reproduce every step from scratch:

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
