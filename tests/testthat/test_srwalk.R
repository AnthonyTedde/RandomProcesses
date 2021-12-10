library(testthat)
library(randomProcess)


test_that("Class of srwalk must belong to zoo",{
  expect_equal(class(srwalk()), class(zoo::zoo()))
})

test_that("random walk should always get time_to_maturity + 1 items", {
  expect_equal(nrow(srwalk(len = 100)), 101)
  expect_equal(nrow(srwalk(len = 0)), 1)
})

test_that("name of the variable", {
  n <- 100
  name1 <- "P001"
  name10 <- "P010"
  name100 <- "P100"
  expect_equal(names(srwalk(n = n))[1], name1)
  expect_equal(names(srwalk(n = n))[10], name10)
  expect_equal(names(srwalk(n = n))[100], name100)
})

test_that("minimal and maximal value of random value", {
  rw <- srwalk(n=1000)
  rw_last <- unname(unlist(rw[nrow(rw), ]))
  #TODO Compare with theoretical distribution
  expect_true(F)
})

test_that("Random Walks are reproducible", {
  expect_equal(srwalk(seed = 5), srwalk(seed = 5))
})
