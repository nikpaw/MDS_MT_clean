required_packages <- c(
  "tidyverse",
  "sf", "giscoR", "rmapshaper", "rnaturalearth", "rnaturalearthhires",
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
