#' @title A constructor of Sample Random Walk
#'
#'
#' @description  It generates a uniq Sampled Random Walks along with
#' the appropriate time period. The time period goes from 0 up to T
#' (0: time_to_maturity).
#'
#'
#' @param time_to_maturity  Number of time_to_maturity of the random walk
#' @param prob  Probability of occurence of head and tail for each step
#' @param scale  It defines the time partition between each unit of time.
#' For instance if the scale is 100, the time step [0,1] will be cut in 100 parts.
#' Furthermore this param defines the increment multiplier as well.
#' If the scale is 100, the multiplier which defines the next value will be
#' (+1 / -1) * 1/sqrt(100)
#' @param seed  With same seed, 2 exeriments will give the same output. It therefore
#' provides reproducibles experiments.
#'
#'
#' @examples
#' # Generate a 150 steps symmetric random walk
#' srwalk(steps = 150)
#'
#' @return \code{srwalk()} output a data.frame which contains each step of the
#' time value along with the associated Sampled Random Walk value.
#'
#' @references
#' [1] Symmetric Random Walk, Stochastic Calculus for Finance, Steven e. Shreve, 2004, pp 83-84
#' @export
srwalk <- function(time_to_maturity = 100,
                   prob = c('head' = 0.5,
                            'tail' = 0.5),
                   seed = 1,
                   scale = 1){
  # Call the generator ----------------------------
  # it will return a unique data.frame with the random walk

  set.seed(seed)

  srwalkGenerator(time_to_maturity,
                  prob,
                  scale,
                  n = 1)
}
