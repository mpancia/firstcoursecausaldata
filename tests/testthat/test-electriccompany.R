test_that("electriccompany dataset has correct dimensions", {
  expect_equal(nrow(electriccompany), 96)
  expect_equal(ncol(electriccompany), 7)
})

test_that("electriccompany dataset has correct column types", {
  expect_type(electriccompany$grade, "integer")
  expect_type(electriccompany$treated_pre_test, "double")
  expect_type(electriccompany$treated_post_test, "double")
  expect_type(electriccompany$control_pre_test, "double")
  expect_type(electriccompany$control_post_test, "double")
})

test_that("electriccompany grade values are within expected range", {
  expect_equal(min(electriccompany$grade), 1)
  expect_equal(max(electriccompany$grade), 4)
  expect_true(all(electriccompany$grade %in% 1:4))
})

test_that("electriccompany test scores are reasonable", {
  # All test scores should be positive
  expect_true(all(electriccompany$treated_pre_test > 0))
  expect_true(all(electriccompany$treated_post_test > 0))
  expect_true(all(electriccompany$control_pre_test > 0))
  expect_true(all(electriccompany$control_post_test > 0))
})

test_that("electriccompany supplement values are consistent", {
  expect_true(all(electriccompany$supplement %in% c("S", "R", NA_character_)))
  expect_true(sum(!is.na(electriccompany$supplement)) > 0) # Should have some supplement values
})

test_that("electriccompany posttest scores are generally higher than pretest", {
  # On average, posttest scores should be higher than pretest scores (learning effect)
  treated_gain <- mean(electriccompany$treated_post_test, na.rm = TRUE) -
    mean(electriccompany$treated_pre_test, na.rm = TRUE)
  control_gain <- mean(electriccompany$control_post_test, na.rm = TRUE) -
    mean(electriccompany$control_pre_test, na.rm = TRUE)

  expect_true(treated_gain > 0)
  expect_true(control_gain > 0)
})

test_that("electriccompany has multiple grade levels represented", {
  expect_equal(length(unique(electriccompany$grade)), 4) # Should have grades 1,2,3,4
})

test_that("electriccompany paired design is reasonable", {
  # Each row represents a pair, so we should have balanced data
  # Check that we have reasonable variance in test scores
  expect_true(var(electriccompany$treated_pre_test) > 0)
  expect_true(var(electriccompany$control_pre_test) > 0)
  expect_true(var(electriccompany$treated_post_test) > 0)
  expect_true(var(electriccompany$control_post_test) > 0)
})
