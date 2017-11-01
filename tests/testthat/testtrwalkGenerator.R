library(testthat)
library(RandomWalk)

# Define preamble variables ----------------------------
t <- 10
sc <- 4

# Define random walk object ----------------------------
rw <- RandomWalk::trwalkGenerator(time_to_maturity = t)
rw10 <- rw[[length(rw)]]

scaledrw <- RandomWalk::trwalkGenerator(time_to_maturity = t,
                                        scale = sc)
scaledrw1 <- scaledrw[[1 + 1]][, 'Mt']

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

test_that("scaled RW increment against good multiplier", {
  expect_equal(scaledrw1, c(1/sqrt(sc), (-1) * 1/sqrt(sc)))
})

test_that("# transaction period according to scale", {
  expect_equal(length(scaledrw), (sc * t) + 1)
})
