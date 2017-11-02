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

# The following declaration will serve to compute the martingale properties of
# the symmetric random walk.
# The expectation will be computed for time L at time k, with:  k < l.
# The following equality should be shown
# E[Ml | Fk] = Mk
# 1. Fix the time periods:
# TODO: Study the case in fixing the following time periods at random.
l <- 5 + 1 # +1 due to index that begin to 1 instead of 0 as in theory
k <- 2 + 1
p <- probOfHead <- 0.5


# 2. Define the expected value (Mk), The probability and the random values
# Expected value:
Mk <- rw[[k]]
Ml <- rw[[l]]
uptoValue <- l - k + 1
# Define the probability involved in the process:
fi <- outer(1:uptoValue,
            1:uptoValue,
            FUN = function(i, j){choose((j-1), (j-i)) * p^(j-1)})

# Compute the array of conditional expectation:
anonymous <- function(i){
  M <- Ml[i:(i + uptoValue -1), 'Mt']
  sum(M * fi[, 4])
}
EMk <- sapply(1:nrow(Mk), anonymous)

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

test_that("martingal property of the symmetric random walk", {
  expect_equal(EMk, Mk[, 'Mt'])
})
