library(testthat)
library(RandomWalk)

test_that("The generator provides the good classes for its generated sampled Brownian Motion", {
  expect_equal(class(sbmotionGenerator(n = 2)), c('sampled_brownianmotion',
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

# The following is unusable for the use of brownian motion because a brownian
# motion has not a defined time step.
# TODO To remove from the test.
test_that("The generator provides the good value for scale attribute", {
  expect_equal(attributes(sbmotionGenerator(scale = 100))$scale, 100)
  expect_equal(attributes(sbmotionGenerator(scale = 100, n = 4))$scale, 100)
})

test_that("Differents Brownian Motion with different seed must be different", {
  sampled <- sbmotionGenerator(n = 2)
  expect_false(identical(sampled[[1]], sampled[[2]]))
})
