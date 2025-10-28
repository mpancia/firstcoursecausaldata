test_that("all datasets can be loaded", {
  # Test that all datasets are available and can be loaded
  expect_true(exists("lalonde"))
  expect_true(exists("resumecallback"))
  expect_true(exists("finasteride"))
})

test_that("all datasets are data frames", {
  expect_s3_class(lalonde, "data.frame")
  expect_s3_class(resumecallback, "data.frame")
  expect_s3_class(finasteride, "data.frame")
})

test_that("all datasets have no missing values", {
  expect_equal(sum(is.na(lalonde)), 0)
  expect_equal(sum(is.na(resumecallback)), 0)
  expect_equal(sum(is.na(finasteride)), 0)
})

test_that("all datasets have reasonable row counts", {
  expect_true(nrow(lalonde) > 1000)  # Large observational study
  expect_true(nrow(resumecallback) > 1000)  # Resume audit study
  expect_true(nrow(finasteride) > 10 & nrow(finasteride) < 100)  # Summary data by center
})