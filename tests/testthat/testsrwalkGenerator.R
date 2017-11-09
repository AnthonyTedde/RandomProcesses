library(testthat)
library(RandomWalk)

timeT <- 4
divider <- 100
n <- 5

rw <- srwalkGenerator(time_to_maturity = timeT,
                      scale = divider,
                      seed = 4,
                      n = n)

reproducible_rw <- srwalkGenerator(time_to_maturity = timeT,
                                   scale = divider,
                                   seed = 4,
                                   n = n)

test_that("The generator returns the right number of sampled random walk", {
  expect_equal(length(rw), n)
})
test_that("The generator gives reproducible sampled random walks", {
  expect_equal(rw, reproducible_rw)
})
test_that("The generator provides the good classes for its generated sampled random walk", {
  expect_equal(class(rw), c('sampled_randomwalk', 'list'))
  sapply(rw, FUN = function(rwalk) expect_equal(class(rwalk), c('sampled_randomwalk', 'data.frame')))
})
