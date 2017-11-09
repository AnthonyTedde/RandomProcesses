library(testthat)
library(RandomWalk)

test_that("The generator provides the good classes for its generated sampled Brownian Motion", {
  expect_equal(class(sbmotionGenerator()), c('sampled_brownianmotion',
                                             class(list())))
  expect_equal(class(sbmotionGenerator(n = 1)), c('sampled_brownianmotion',
                                                  class(data.frame())))
  sapply(sbmotionGenerator(n = 5),
         FUN = function(bmotion) expect_equal(class(bmotion),
                                              c('sampled_brownianmotion',
                                                class(data.frame()))))
})

test_that("With same seed, sampled generated brownian motion must be reproducible", {
  expect_equal(sbmotionGenerator(seed = 4),
               sbmotionGenerator(seed = 4))
  expect_equal(sbmotionGenerator(seed = 4, n = 4),
               sbmotionGenerator(seed = 4, n = 4))
})
