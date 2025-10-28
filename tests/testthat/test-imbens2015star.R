test_that("imbens2015star dataset has correct dimensions", {
  expect_equal(nrow(imbens2015star), 68)
  expect_equal(ncol(imbens2015star), 4)
})

test_that("imbens2015star dataset has correct column types", {
  expect_type(imbens2015star$school, "integer")
  expect_type(imbens2015star$classroom, "integer")
  expect_type(imbens2015star$treatment, "integer")
  expect_type(imbens2015star$outcome, "double")
})

test_that("imbens2015star school IDs are within expected range", {
  expect_equal(min(imbens2015star$school), 1)
  expect_equal(max(imbens2015star$school), 16)
  expect_equal(length(unique(imbens2015star$school)), 16)
})

test_that("imbens2015star treatment values are correct", {
  expect_true(all(imbens2015star$treatment %in% c(0, 1)))
  expect_true(sum(imbens2015star$treatment == 1) > 0) # Should have treated units
  expect_true(sum(imbens2015star$treatment == 0) > 0) # Should have control units
})

test_that("imbens2015star classroom IDs are reasonable", {
  # Classroom IDs should be positive integers
  expect_true(all(imbens2015star$classroom > 0))
  expect_true(all(
    imbens2015star$classroom == as.integer(imbens2015star$classroom)
  ))
})

test_that("imbens2015star outcome values are reasonable for standardized scores", {
  expect_true(all(imbens2015star$outcome >= -5 & imbens2015star$outcome <= 5))
  expect_true(sum(imbens2015star$outcome > 0) > 0)
  expect_true(sum(imbens2015star$outcome < 0) > 0)
})

test_that("imbens2015star has no missing values", {
  expect_equal(sum(is.na(imbens2015star)), 0)
})

test_that("imbens2015star schools have both treatment and control groups", {
  # Check that most schools have both treatment types (stratified design)
  schools_with_treatment <- tapply(
    imbens2015star$treatment,
    imbens2015star$school,
    function(x) all(c(0, 1) %in% x)
  )
  expect_true(sum(schools_with_treatment) >= 12) # At least 12 of 16 schools should have both groups
})

test_that("imbens2015star stratified design is reasonable", {
  # Each school should have reasonable number of classrooms
  classrooms_per_school <- table(imbens2015star$school)
  expect_true(all(classrooms_per_school >= 3)) # At least 3 classrooms per school
  expect_true(all(classrooms_per_school <= 8)) # Not too many classrooms per school
})
