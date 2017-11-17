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

rw_uniq_path <- srwalkGenerator(time_to_maturity = timeT,
                      scale = divider,
                      seed = 4,
                      n = 1)

test_that("The generator returns the right number of sampled random walk", {
  expect_equal(length(rw), n)
})

test_that("With same seed, sampled generated random walk must be reproducible", {
  expect_equal(srwalkGenerator(seed = 5), srwalkGenerator(seed = 5))
  expect_equal(srwalkGenerator(seed = 5, n = 5), srwalkGenerator(seed = 5, n = 5))
})

test_that("The generator provides the good classes for its generated sampled random walk", {
  expect_equal(class(rw), c('sampled_randomwalk',
                            class(list())))
  expect_equal(class(srwalkGenerator(n = 1)), c('sampled_randomwalk',
                                                class(data.frame())))
  sapply(rw, FUN = function(rwalk) expect_equal(class(rwalk),
                                                c('sampled_randomwalk',
                                                  class(data.frame()))))
})

test_that("The generator return a data.frame when only one path is asked", {
  expect_equal(class(rw_uniq_path), c('sampled_randomwalk', class(data.frame())))
})

test_that("The generator return the correct attributes for a sym. random walk", {
  expect_equal(attributes(srwalkGenerator(time_to_maturity = 1,
                                          scale = 400))$scale, 400)
  expect_equal(attributes(srwalkGenerator(time_to_maturity = 1,
                                          scale = 3, n = 10))$scale, 3)
})
