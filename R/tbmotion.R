# In order to get the distribution of the brownian motion, use:
# pnorm() for the cumulative
# dnorm() for the density
# qnorm() for the erf.


#' @param t vector of time
#' @param x Vector of dummy variables
#' @export
joint_density <- function( x, t){

  # In order to use the jointly normally distribution formula, the computation
  # of the covariance matrices:
  # Stochastic Calculus for Finance ii p.95
  # t <- 1:4
  # x <- 2:5
  # outer(t, t, FUN = function(row, col){paste(row, col, sep = ',')})

  cov_mat <- outer(t, t, FUN = function(row, col){ifelse(row < col, row, col)})


  n <- length(t)
  d <- det(cov_mat)

  # equation
  (1/ (sqrt(((2 * pi) ^ n) * d))) * exp( ((-1/2) %*% rbind(x)) %*% matrixcalc::matrix.inverse(cov_mat) %*% cbind(x) )

}


# Following code must be added to the test cases:
#
# x <- c(0, 0)
# t <- c(.1, .2)
#
# joint_density(t = c(.1, .2), x = c(0, 0))
# joint_density(t = c(.1, .2), x = c(1, 0))
#
# library(cubature)
# low <- rep(-100, 2)
# up <- rep(100, 2)
# hcubature(joint_density, low, up,  t = c(0.1, 0.2))
#
#
# library(R2Cuba)
# str(cuhre(ndim = 2, ncomp = 1, joint_density, t = c(0.1,0.2), lower = c(-100, -100), upper = rep(100, 2)))
# cuhre(ndim = 10, ncomp = 1, joint_density, t = 1:10, lower = rep(-10, 10), upper = rep(10, 10))
#
# a <- cuhre(ndim = 1, ncomp = 1, joint_density, t = 1:1, lower = rep(-1, 1), upper = rep(1, 1))$value
# b <- cuhre(ndim = 2, ncomp = 1, joint_density, t = c(0.1,0.2), lower = c(-100, -100), upper = rep(100, 2))$value
#
#
# low <- rep(-4, 2)
# up <- rep(4, 2)
# hcubature(joint_density, low, up, t = 1:2)
