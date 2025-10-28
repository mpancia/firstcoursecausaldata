library(readr)

# Load STAR experiment data from Imbens and Rubin (2015)
# The Student/Teacher Achievement Ratio (STAR) experiment was conducted in 1985-1986 in Tennessee
# Strata correspond to schools, unit of analysis is the teacher or class
# Treatment: 1 = small classes (13-17 students), 0 = regular classes (22-25 students)
# Outcome: standardized average mathematics score

imbens2015star <- read_csv(
  "data-raw/imbens2015star_data.csv",
  col_types = cols(
    school = col_integer(),
    classroom = col_integer(),
    treatment = col_integer(),
    outcome = col_double()
  )
)

usethis::use_data(imbens2015star, overwrite = TRUE)
