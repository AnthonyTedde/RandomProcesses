library(testthat)
library(RandomWalk)
#source("randomwalk.R", chdir = T)

# Objects and variables declaration ----------------------------
timeT <- 4
divider <- 100
rw <- srwalk(time_to_maturity = timeT)
Q <- quadraticVariation(rw, timeT)

srw <- srwalk(time_to_maturity = timeT,
              scale = divider)
Qsrw <- quadraticVariation(srw, timeT)

# TEST CASE ----------------------------

# The following test case is performed for a symmetric random walk
# and for a scaled radom walk.
test_that("Quadratic variation grow at rate 1 / unit of time dt", {
  expect_equal(Q, timeT)
  expect_equal(Qsrw, timeT)
})

