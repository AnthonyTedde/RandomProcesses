library(testthat)
library(RandomWalk)

# Define preamble variables ----------------------------
t <- 10

# Define random walk object ----------------------------
rw <- RandomWalk::trwalkGenerator(time_to_maturity = t)
rw10 <- rw[[length(rw)]]

scaledrw <- RandomWalk::trwalkGenerator(time_to_maturity = t,
                                        scale = 4)

# Define expectation and STD var.----------------------------
 expectedX <- sum(rw10[, 'Mt'] * rw10[, 'Pr'])
expectedXSquared <- sum(rw10[, 'Mt'] ^ 2 * rw10[, 'Pr'])
variance <- expectedXSquared - expectedX ^2

test_that("Expected value is zero", {
  expect_equal(expected, 0)
})

test_that("Variance value is equal to time_to_maturity", {
  expect_equal(variance, t)
})

