#' Generator of symmetric random walk sampled only one time.
#' It means it corresponds to a single random walk's path.
#' @param steps - Number of steps of the random walk
#' @param prob - Probability of occurence of head and tail for each step
#' @examples
#' # Generate a 150 steps symmetric random walk
#' sampledSymmetricRandomWalk(steps = 150)
#' @references
#' [1] Symmetric Random Walk, Stochastic Calculus for Finance, Steven e. Shreve, 2004, pp 83-84
#' @export
sampledSymmetricRandomWalk <- function(steps = 3000,
                       prob = c('head' = 0.5, 'tail' = 0.5)){
  (sampledSymmetricRandomWalkGenerator(steps, prob, 1))
}
