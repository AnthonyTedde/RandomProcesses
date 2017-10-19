#' Generator of Random Walk
#' @param steps - Number of steps of the random walk
#' @param prob - Probability of occurence of head and tails for each step
#' @examples
#' randomWalk(n = 100)
#' @references
#' [1] Symmetric Random Walk, Stochastic Calculus for Finance, Steven e. Shreve, 2004, pp 83-84
#' @export
sampledRandomWalk <- function(steps = 3000,
                       prob = c('head' = 0.5, 'tail' = 0.5)){
  (sampledRandomWalkGenerator(steps, prob, 1))
}
