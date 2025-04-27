fs::dir_create(here::here("data", "raw"))

# Define Dropbox direct download URL for the ZIP file

zip_url <- "https://www.dropbox.com/scl/fi/ia32wnerdasw2bxmhe9lv/raw_data.zip?rlkey=yvim5mogztb5sqe0821rjanqh&st=gd86j19v&dl=1"

# Define local path to store the downloaded ZIP file
zip_path <- here::here("data", "raw_data.zip")

# Define directory to unzip contents
unzip_dir <- here::here("data")

# Download and unzip if not already present
if (!fs::file_exists(zip_path)) {
  httr::GET(zip_url, httr::write_disk(zip_path, overwrite = TRUE))
  utils::unzip(zipfile = zip_path, exdir = unzip_dir)
  fs::file_delete(zip_path)
}
