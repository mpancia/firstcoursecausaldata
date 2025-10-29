library(haven)
library(dplyr)

if (!file.exists("data-raw/angrist2009.dta")) {
  download.file(
    "https://dataverse.harvard.edu/api/access/datafile/7440219",
    "data-raw/angrist2009.dta"
  )
}

angrist2009 <- read_dta("data-raw/angrist2009.dta") |>
  mutate(
    # Convert binary variables to logical
    chooseUTM = as.logical(chooseUTM),
    compsurv = as.logical(compsurv),
    control = as.logical(control),
    dad1 = as.logical(dad1),
    dad2 = as.logical(dad2),
    english = as.logical(english),
    female = as.logical(female),
    finish4 = as.logical(finish4),
    goodstanding_year1 = as.logical(goodstanding_year1),
    goodstanding_year2 = as.logical(goodstanding_year2),
    graddeg = as.logical(graddeg),
    hcom = as.logical(hcom),
    lm_never = as.logical(lm_never),
    lm_rarely = as.logical(lm_rarely),
    mom1 = as.logical(mom1),
    mom2 = as.logical(mom2),
    noshow = as.logical(noshow),
    prob_year1 = as.logical(prob_year1),
    prob_year2 = as.logical(prob_year2),
    sfp = as.logical(sfp),
    sfp_p = as.logical(sfp_p),
    sfpany = as.logical(sfpany),
    sfpany_p = as.logical(sfpany_p),
    sfsp = as.logical(sfsp),
    sfsp_p = as.logical(sfsp_p),
    signup = as.logical(signup),
    ssp = as.logical(ssp),
    ssp_p = as.logical(ssp_p),
    used_adv = as.logical(used_adv),
    used_fsg = as.logical(used_fsg),
    used_ssp = as.logical(used_ssp),
    work1 = as.logical(work1)
  )

usethis::use_data(angrist2009, overwrite = TRUE)
