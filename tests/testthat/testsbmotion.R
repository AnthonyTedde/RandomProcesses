library(testthat)
library(RandomWalk)

# will be tested some cases on brownian motion and its properties.
timeT <- 4
p <- c('head' = 1/2, 'tail' = 1/2)
s <- 100
seed <- 1

bm <- sbmotion(time_to_maturity = timeT,
               prob = p,
               seed = seed,
               scale = s)
test_that("Brownian motion has belongs to correct class", {
  expect_equal(class(bm), c('data.frame', 'brownianmotion'))
})

test_that("Brownian motion has correct size", {
  expect_equal(nrow(bm), timeT * s + 1)
})


