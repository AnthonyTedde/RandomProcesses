library(testthat)
library(RandomWalk)

test_that("joint density has 1 as full density", {
  # Lower and upper bound of the integral to be calculated
  #
  # The package R2Cuba is used to compute the multiple integrals.
  # Another package should be investigated: cubature with the function
  # hcubature
  lower_bound <- rep(-200, 2)
  upper_bound <- rep(200, 2)
  joint_density_closure <- joint_density(time = c(0.1,0.2))
  integral <- R2Cuba::cuhre(ndim = 2,
                            ncomp = 1,
                            joint_density_closure,
                            lower = lower_bound,
                            upper = upper_bound,
                            flags = list(verbose = 0))
  # test case, integral must be one:
  expect_equal(integral$value, 1, tolerance = integral$abs.error)
})

test_that("Random ", {
  # Stochastic Calculus For Finance ii, p65:
  # Linear combinations of jointly normal random variables [...] are jointly
  # normal.
  #
  # Stochastic Calculus For Finance ii, p95:
  # Because the increment [of a Brownian Motion] are independent and Normally
  # distributed, the random variables W(t1), W(t2), ..., W(tm) are jointly
  # normally distributed.
  #
  # Stochastic Calculus For Finance ii, p65:
  # Since independent normal random variables are jointly normal
})
