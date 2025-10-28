library(readr)

if (!file.exists("data-raw/resumecallback.csv")) {
  download.file(
    "https://dataverse.harvard.edu/api/access/datafile/7440245",
    "data-raw/resumecallback.csv"
  )
}

resumecallback <- read_csv(
  "data-raw/resumecallback.csv",
  col_types = cols(
    firstname = col_character(),
    sex = col_factor(),
    race = col_factor(),
    call = col_logical()
  )
)
usethis::use_data(resumecallback, overwrite = TRUE)
