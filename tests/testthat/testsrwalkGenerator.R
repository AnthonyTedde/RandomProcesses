library(testthat)
library(RandomWalk)

timeT <- 4
divider <- 100
n <- 5

rw <- srwalkGenerator(time_to_maturity = timeT,
                      scale = divider,
                      seed = 4,
                      n = n)

test_that("The generator returns the right number of sampled random walk")
test_that("The generator gives reproducible sampled random walks")
test_that("The generator provides the good classes for its generated sampled random walk")
