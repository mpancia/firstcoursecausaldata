test_that("angrist2009 dataset has correct dimensions", {
  expect_equal(nrow(angrist2009), 1656)
  expect_equal(ncol(angrist2009), 48)
})

test_that("angrist2009 dataset has correct column types for key variables", {
  expect_type(angrist2009$GPA_year1, "double")
  expect_type(angrist2009$GPA_year2, "double")
  expect_type(angrist2009$age, "double")
  expect_type(angrist2009$gpa0, "double")
  expect_type(angrist2009$control, "logical")
  expect_type(angrist2009$female, "logical")
})

test_that("angrist2009 treatment groups are reasonable", {
  expect_true(sum(angrist2009$control) > 0) # Should have control units
  expect_true(sum(!angrist2009$control) > 0) # Should have treatment units
  expect_equal(sum(angrist2009$control), 1006) # Based on our analysis
  expect_equal(sum(!angrist2009$control), 650) # Based on our analysis
})

test_that("angrist2009 demographic variables are consistent", {
  expect_true(all(angrist2009$female %in% c(TRUE, FALSE)))
  expect_true(all(angrist2009$english %in% c(TRUE, FALSE)))

  # Age should be reasonable for college freshmen
  expect_true(all(angrist2009$age >= 15 & angrist2009$age <= 30))
})

test_that("angrist2009 binary variables are logical", {
  binary_vars <- c(
    "chooseUTM",
    "compsurv",
    "dad1",
    "dad2",
    "english",
    "female",
    "finish4",
    "goodstanding_year1",
    "goodstanding_year2",
    "graddeg",
    "hcom",
    "lm_never",
    "lm_rarely",
    "mom1",
    "mom2",
    "noshow",
    "prob_year1",
    "prob_year2",
    "sfp",
    "sfp_p",
    "sfpany",
    "sfpany_p",
    "sfsp",
    "sfsp_p",
    "signup",
    "ssp",
    "ssp_p",
    "used_adv",
    "used_fsg",
    "used_ssp",
    "work1"
  )

  for (var in binary_vars) {
    expect_type(angrist2009[[var]], "logical")
    expect_true(all(angrist2009[[var]] %in% c(TRUE, FALSE, NA)))
  }
})

test_that("angrist2009 academic standing indicators are consistent", {
  # Students on probation should not be in good standing
  prob1_good1_conflict <- sum(
    angrist2009$prob_year1 & angrist2009$goodstanding_year1,
    na.rm = TRUE
  )
  prob2_good2_conflict <- sum(
    angrist2009$prob_year2 & angrist2009$goodstanding_year2,
    na.rm = TRUE
  )

  expect_equal(prob1_good1_conflict, 0)
  expect_equal(prob2_good2_conflict, 0)
})

test_that("angrist2009 program participation variables are consistent", {
  # If signed up for a program, should have been offered it
  expect_true(sum(angrist2009$sfp_p & !angrist2009$sfp, na.rm = TRUE) == 0)
  expect_true(sum(angrist2009$ssp_p & !angrist2009$ssp, na.rm = TRUE) == 0)
  expect_true(sum(angrist2009$sfsp_p & !angrist2009$sfsp, na.rm = TRUE) == 0)
})
