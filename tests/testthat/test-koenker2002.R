test_that("koenker2002 dataset has correct dimensions", {
  expect_equal(nrow(koenker2002), 6384)
  expect_equal(ncol(koenker2002), 13)
})

test_that("koenker2002 dataset has correct column types", {
  expect_type(koenker2002$duration, "double")
  expect_type(koenker2002$treatment, "logical")
  expect_type(koenker2002$female, "logical")
  expect_type(koenker2002$black, "logical")
  expect_type(koenker2002$hispanic, "logical")
  expect_type(koenker2002$ndependents, "integer")
  expect_type(koenker2002$recall, "logical")
  expect_type(koenker2002$young, "logical")
  expect_type(koenker2002$old, "logical")
  expect_type(koenker2002$quarter, "integer")
  expect_type(koenker2002$durable, "logical")
  expect_type(koenker2002$lusd, "logical")
})

test_that("koenker2002 treatment groups are reasonable", {
  expect_true(sum(koenker2002$treatment) > 0) # Should have treated units
  expect_true(sum(!koenker2002$treatment) > 0) # Should have control units
})

test_that("koenker2002 duration values are reasonable", {
  expect_true(all(koenker2002$duration > 0)) # Duration should be positive
  expect_true(all(koenker2002$duration < 100)) # Reasonable upper bound for duration
})

test_that("koenker2002 demographic variables are consistent", {
  expect_true(all(koenker2002$female %in% c(TRUE, FALSE)))
  expect_true(all(koenker2002$black %in% c(TRUE, FALSE)))
  expect_true(all(koenker2002$hispanic %in% c(TRUE, FALSE)))
  expect_true(all(koenker2002$recall %in% c(TRUE, FALSE)))
  expect_true(all(koenker2002$young %in% c(TRUE, FALSE)))
  expect_true(all(koenker2002$old %in% c(TRUE, FALSE)))
  expect_true(all(koenker2002$durable %in% c(TRUE, FALSE)))
  expect_true(all(koenker2002$lusd %in% c(TRUE, FALSE)))
})

test_that("koenker2002 ndependents are reasonable", {
  expect_true(all(koenker2002$ndependents >= 0)) # Non-negative
  expect_true(all(koenker2002$ndependents <= 20)) # Reasonable upper bound
})

test_that("koenker2002 has no missing values", {
  expect_equal(sum(is.na(koenker2002)), 0)
})

test_that("koenker2002 ID values are unique", {
  expect_equal(length(unique(koenker2002$id)), nrow(koenker2002))
})

test_that("koenker2002 stratified design is reasonable", {
  # Check that each quarter has both treatment and control groups (stratified design)
  quarters_with_treatment <- tapply(
    koenker2002$treatment,
    koenker2002$quarter,
    function(x) all(c(TRUE, FALSE) %in% x)
  )
  expect_true(all(quarters_with_treatment)) # All quarters should have both groups
})
