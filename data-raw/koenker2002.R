library(readr)

if (!file.exists("data-raw/koenker2002.txt")) {
  download.file(
    "https://dataverse.harvard.edu/api/access/datafile/7440282",
    "data-raw/koenker2002.txt"
  )
}

koenker2002 <- read_delim(
  "data-raw/koenker2002.txt",
  delim = " ",
  col_types = cols(
    duration = col_double(),
    treatment = col_logical(),
    female = col_logical(),
    black = col_logical(),
    hispanic = col_logical(),
    ndependents = col_integer(),
    recall = col_logical(),
    young = col_logical(),
    old = col_logical(),
    quarter = col_factor(),
    durable = col_logical(),
    lusd = col_logical()
  ),
  skip = 1,
  col_names = c(
    "id",
    "duration",
    "treatment",
    "female",
    "black",
    "hispanic",
    "ndependents",
    "recall",
    "young",
    "old",
    "quarter",
    "durable",
    "lusd"
  )
)

usethis::use_data(koenker2002, overwrite = TRUE)
