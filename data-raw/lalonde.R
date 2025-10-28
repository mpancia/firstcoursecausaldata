library(readr)

if (!file.exists("data-raw/lalonde.txt")) {
  download.file(
    "https://dataverse.harvard.edu/api/access/datafile/7440281",
    "data-raw/lalonde.txt"
  )
}

lalonde <- read_delim(
  "data-raw/lalonde.txt",
  delim = " ",
  col_types = "liillllnnn"
)
usethis::use_data(lalonde, overwrite = TRUE)
