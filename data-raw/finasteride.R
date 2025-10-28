library(readr)

if (!file.exists("data-raw/finasteride.csv")) {
  download.file(
    "https://dataverse.harvard.edu/api/access/datafile/7440246",
    "data-raw/finasteride.csv"
  )
}

finasteride <- read_csv(
  "data-raw/finasteride.csv",
  col_types = cols(
    center = col_integer(),
    n0 = col_integer(),
    mean0 = col_double(),
    sd0 = col_double(),
    n1 = col_integer(),
    mean1 = col_double(),
    sd1 = col_double(),
    n5 = col_integer(),
    mean5 = col_double(),
    sd5 = col_double()
  )
)
usethis::use_data(finasteride, overwrite = TRUE)
