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
  col_types = cols(
    treat = col_logical(),
    age = col_integer(),
    educ = col_integer(),
    black = col_logical(),
    hispan = col_logical(),
    married = col_logical(),
    nodegree = col_logical(),
    re74 = col_double(),
    re75 = col_double(),
    re78 = col_double()
  )
)
usethis::use_data(lalonde, overwrite = TRUE)
