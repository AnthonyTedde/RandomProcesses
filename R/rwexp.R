#' Expectation of random walk.
#' The expectation of the random walk as described in "stochastic calculus
#' for finance" equal 0.
#' Therefore the calculation made by this function is only a verification
#' of the Expected zero growth for random walk.
#' More details and calculation will come later.
rwexp <- function(Mk){
  sapply(Mk, function(x){sum(x[, 1] * x[, 2])})
}
