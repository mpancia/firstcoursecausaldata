library(readr)
if (!file.exists("data-raw/electric.dat")) {
  temp_zip <- tempfile(fileext = ".zip")
  download.file(
    "https://sites.stat.columbia.edu/gelman/arm/examples/ARM_Data.zip",
    temp_zip,
    mode = "wb"
  )

  unzip(
    temp_zip,
    files = "ARM_Data/electric.company/electric.dat",
    exdir = "data-raw",
    junkpaths = TRUE
  )
}

electriccompany <- read_table(
  "data-raw/electric.dat",
  col_names = FALSE,
  skip = 1,
  col_types = cols(
    X1 = col_factor(),
    X2 = col_integer(),
    X3 = col_double(),
    X4 = col_double(),
    X5 = col_double(),
    X6 = col_double(),
    X7 = col_factor()
  )
) |>
  setNames(c(
    "city",
    "grade",
    "treated_pre_test",
    "treated_post_test",
    "control_pre_test",
    "control_post_test",
    "supplement"
  ))

usethis::use_data(electriccompany, overwrite = TRUE)
