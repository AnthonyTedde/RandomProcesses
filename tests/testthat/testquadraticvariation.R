library(testthat)
library(RandomWalk)
#source("randomwalk.R", chdir = T)

# Objects and variables declaration ----------------------------
timeT <- 10
rw <- srwalk(time_to_maturity = timeT)
Q <- quadraticVariation(rw, timeT)

# TEST CASE ----------------------------

test_that("Quadratic variation grow at rate 1 / unit of time dt", {
  expect_equal(Q, timeT)
})
