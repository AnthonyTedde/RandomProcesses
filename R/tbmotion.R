# In order to get the distribution of the brownian motion, use:
# pnorm() for the cumulative
# dnorm() for the density
# qnorm() for the erf.


#' @param t vector of time
#' @param x Vector of dummy variables
#' @export
joint_density <- function(time){

  # In order to use the jointly normally distribution formula, the computation
  # of the covariance matrices:
  # Stochastic Calculus for Finance ii p.95
  # t <- 1:4
  # x <- 2:5
  # outer(t, t, FUN = function(row, col){paste(row, col, sep = ',')})

  anonymous <- function(row, col){ifelse(row < col, row, col)}
  cov_mat <- outer(time, time, FUN = anonymous)
  # Inverse covariance matrix:
  cov_mat_inv <- matrixcalc::matrix.inverse(cov_mat)

  n <- length(time)
  d <- det(cov_mat)

  # Joint distribution equation
  function(x){
    multiplier <- (1/ (sqrt(((2 * pi) ^ n) * d)))
    X <-  ((-1/2) %*% rbind(x)) %*% cov_mat_inv %*% cbind(x)
    multiplier * exp(X)
  }
}

# vector_of_time <- seq(0.01, 5, by = 0.01)
# vector_of_time <- seq(0.01, 5, length.out = 2)
# time <- vector_of_time
# anonymous <- function(row, col){ifelse(row < col, row, col)}
# cov_mat <- outer(time, time, FUN = anonymous)
# det(cov_mat)
#
# f <- joint_density(vector_of_time)
# R2Cuba::cuhre(2,
#               1,
#               f,
#               lower = rep(-Inf, 2),
#               upper = rep(Inf, 2),
#               flags = list(verbose = 0))

