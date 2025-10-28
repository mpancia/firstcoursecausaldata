test_that("resumecallback dataset has correct dimensions", {
  expect_equal(nrow(resumecallback), 4870)
  expect_equal(ncol(resumecallback), 4)
})

test_that("resumecallback dataset has correct column types", {
  expect_type(resumecallback$firstname, "character")
  expect_type(resumecallback$call, "logical")
})

test_that("resumecallback data values are within expected ranges", {
  expect_true(all(resumecallback$call %in% c(TRUE, FALSE)))
  expect_true(all(resumecallback$sex %in% c("male", "female")))
  expect_true(all(resumecallback$race %in% c("black", "white")))
  expect_true(min(nchar(resumecallback$firstname)) >= 2) # Names should be at least 2 characters
})

test_that("resumecallback callback rates are reasonable", {
  callback_rates <- tapply(resumecallback$call, resumecallback$race, mean)

  # Both groups should have some callbacks
  expect_true(callback_rates["black"] > 0)
  expect_true(callback_rates["white"] > 0)

  # But not 100% callbacks
  expect_true(callback_rates["black"] < 1)
  expect_true(callback_rates["white"] < 1)

  # White-sounding names should have higher callback rate (based on study findings)
  expect_true(callback_rates["white"] > callback_rates["black"])
})

test_that("resumecallback has no missing values", {
  expect_equal(sum(is.na(resumecallback)), 0)
})
