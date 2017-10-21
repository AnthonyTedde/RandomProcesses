#' Computation of the quadratic variation of random walk.
#' If random walk is symmetric and thus probability of obtain head equal the probabilty
#' of getting tail, the quadatric variation of this symmetric random walk
#' equal the variance of the random walk.
#' @param steps - Number of steps of the random walk
#' @examples
#'
#' @references
#' [1] Symmetric Random Walk, Stochastic Calculus for Finance, Steven e. Shreve, 2004, pp 85
#' @export
quadraticVariation <- function(W, to) UseMethod('quadraticVariation')
quadraticVariation.symmetricRandomWalk <- function(W, to) {
  quadV <- sapply(1:(length(W[, 2]) - 1), function(i) W[i + 1, 2] - W[i, 2])
  sum(quadV^2)
}
