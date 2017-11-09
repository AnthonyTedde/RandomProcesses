library(testthat)
library(RandomWalk)

# Create the randomwalk objct that will serve for testing ----------------------------
rw <- RandomWalk::srwalk(time_to_maturity = 100)
scaledrw <- RandomWalk::srwalk(time_to_maturity = 4,
                               scale = 100)
variableNames <- c('time_periods', 'random_walk_path')

test_that("Class of srwalk must belong to [data.frame, randomwalk]",{
  expect_equal(class(srwalk()), c("sampled_randomwalk",
                                  class(data.frame())))
})

test_that("random walk should always get time_to_maturity + 1 items", {
  expect_equal(nrow(srwalk(time_to_maturity = 100)), 101)
  expect_equal(ncol(srwalk()), 2)
})

test_that("name of the variable", {
  expect_equal(names(rw), variableNames)
})

test_that("minimal and maximal value of random value", {
  expect_lte(rw[nrow(rw), 'random_walk_path'], 100)
  expect_gte(rw[nrow(rw), 'random_walk_path'], -100)
})

test_that("scaled random variable (4 times, 100 scaled)", {
  expect_equal(nrow(scaledrw), (4 * 100) + 1)
  expect_equal(abs(scaledrw[2, 2]), 1 / 10)
})

test_that("With same seed, sampled generated random walk must be reproducible", {
  expect_equal(srwalk(seed = 5), srwalk(seed = 5))
})
