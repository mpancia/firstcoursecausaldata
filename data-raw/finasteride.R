library(readr)

if (!file.exists("data-raw/finasteride.csv")) {
  download.file(
    "https://dataverse.harvard.edu/api/access/datafile/7440246",
    "data-raw/finasteride.csv"
  )
}

finasteride <- read_csv("data-raw/finasteride.csv", col_types = "iiddiddidd")
usethis::use_data(finasteride, overwrite = TRUE)
