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
