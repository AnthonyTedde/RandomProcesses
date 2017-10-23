#' Generator of symmetric random walk sampled only one time along with its time periods.
#' The time period goes from 0 up to T (0: steps)
#' It corresponds to a single random walk's path with each of its associated time period.
#' @param steps - Number of steps of the random walk
#' @param prob - Probability of occurence of head and tail for each step
#' @examples
#' # Generate a 150 steps symmetric random walk
#' adaptedSampledSymmetricRandomWalk(steps = 150)
#' @references
#' [1] Symmetric Random Walk, Stochastic Calculus for Finance, Steven e. Shreve, 2004, pp 83-84
#' @export
srwalk <- function(steps = 3000,
                   prob = c('head' = 0.5,
                            'tail' = 0.5)){
  srwalkGenerator(steps, prob, 1)[[1]]
}
