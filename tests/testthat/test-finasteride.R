test_that("finasteride dataset has correct dimensions", {
  expect_equal(nrow(finasteride), 29)
  expect_equal(ncol(finasteride), 10)
})

test_that("finasteride dataset has correct column types", {
  expect_type(finasteride$center, "integer")
  expect_type(finasteride$n0, "integer")
  expect_type(finasteride$mean0, "double")
  expect_type(finasteride$sd0, "double")
  expect_type(finasteride$n1, "integer")
  expect_type(finasteride$mean1, "double")
  expect_type(finasteride$sd1, "double")
  expect_type(finasteride$n5, "integer")
  expect_type(finasteride$mean5, "double")
  expect_type(finasteride$sd5, "double")
})

test_that("finasteride center IDs are sequential", {
  expect_equal(min(finasteride$center), 1)
  expect_equal(max(finasteride$center), 29)
  expect_equal(length(unique(finasteride$center)), 29)
  expect_true(all(finasteride$center == 1:29))
})

test_that("finasteride sample sizes are reasonable", {
  # Each center should have reasonable sample sizes (minimum 5 based on our analysis)
  expect_true(all(finasteride$n0 >= 5))
  expect_true(all(finasteride$n1 >= 5))
  expect_true(all(finasteride$n5 >= 5))

  # Sample sizes should be reasonable maximum (not too large for a clinical trial)
  expect_true(all(finasteride$n0 <= 50))
  expect_true(all(finasteride$n1 <= 50))
  expect_true(all(finasteride$n5 <= 50))
})

test_that("finasteride standard deviations are reasonable", {
  # Standard deviations should be positive
  expect_true(all(finasteride$sd0 > 0))
  expect_true(all(finasteride$sd1 > 0))
  expect_true(all(finasteride$sd5 > 0))

  # For symptom scores ranging 0-36, SD shouldn't be ridiculously large
  expect_true(all(finasteride$sd0 < 20))
  expect_true(all(finasteride$sd1 < 20))
  expect_true(all(finasteride$sd5 < 20))
})

test_that("finasteride means are within plausible symptom score range", {
  # Total symptom score ranges 0-36, so changes should be within reasonable bounds
  expect_true(all(finasteride$mean0 >= -10 & finasteride$mean0 <= 10))
  expect_true(all(finasteride$mean1 >= -10 & finasteride$mean1 <= 10))
  expect_true(all(finasteride$mean5 >= -10 & finasteride$mean5 <= 10))
})

test_that("finasteride has no missing values", {
  expect_equal(sum(is.na(finasteride)), 0)
})

test_that("finasteride treatment arms have consistent data", {
  # Each center should have data for all three arms
  expect_true(all(finasteride$n0 > 0 & finasteride$n1 > 0 & finasteride$n5 > 0))
  expect_true(all(!is.na(finasteride$mean0) & !is.na(finasteride$mean1) & !is.na(finasteride$mean5)))
  expect_true(all(!is.na(finasteride$sd0) & !is.na(finasteride$sd1) & !is.na(finasteride$sd5)))
})