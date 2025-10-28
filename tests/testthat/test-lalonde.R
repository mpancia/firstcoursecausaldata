test_that("lalonde dataset has correct dimensions", {
  expect_equal(nrow(lalonde), 16177)
  expect_equal(ncol(lalonde), 10)
})

test_that("lalonde dataset has correct column types", {
  expect_type(lalonde$treat, "logical")
  expect_type(lalonde$age, "integer")
  expect_type(lalonde$educ, "integer")
  expect_type(lalonde$black, "logical")
  expect_type(lalonde$hispan, "logical")
  expect_type(lalonde$married, "logical")
  expect_type(lalonde$nodegree, "logical")
  expect_type(lalonde$re74, "double")
  expect_type(lalonde$re75, "double")
  expect_type(lalonde$re78, "double")
})

test_that("lalonde data values are within expected ranges", {
  expect_true(all(lalonde$age >= 16 & lalonde$age <= 100))
  expect_true(all(lalonde$educ >= 0 & lalonde$educ <= 30))
  expect_true(all(lalonde$re74 >= 0))
  expect_true(all(lalonde$re75 >= 0))
  expect_true(all(lalonde$re78 >= 0))
})

test_that("lalonde treatment groups are reasonable", {
  expect_true(sum(lalonde$treat) > 0) # Should have some treated units
  expect_true(sum(!lalonde$treat) > 0) # Should have some control units
  expect_equal(sum(lalonde$treat), 185) # Based on our earlier analysis
})

test_that("lalonde demographic variables are consistent", {
  expect_true(all(lalonde$black %in% c(TRUE, FALSE)))
  expect_true(all(lalonde$hispan %in% c(TRUE, FALSE)))
  expect_true(all(lalonde$married %in% c(TRUE, FALSE)))
  expect_true(all(lalonde$nodegree %in% c(TRUE, FALSE)))
})
