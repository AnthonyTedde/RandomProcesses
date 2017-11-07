#' Brownian motion generator
#' @param seed - Define the seed sequence to alway get the same sampled
#' randomly generated brownian motion.
sbmotion <- function(time_to_maturity = 4,
                     prob = c('head' = 1/2,
                              'tail' = 1/2),
                     seed = 1,
                     scale = 100){
  # In order to get reproducible result, the seed is previously set according
  # to the <<seed>> param
  set.seed(seed)
  time_upper_bound <- time_to_maturity * scale
  time_interval <- 1/scale

  # The time interval between each increment is needed in order to compute
  # the variance of these increments. According to the theory, the variance is
  # given by: var(W[t_i+1] - W[t_i]) = t_i+1 - t_i
  time_step <- seq(0, time_to_maturity, by = time_interval)
  deltaT <- time_step[-1] - time_step[-length(ti)]
  variance_increment <- deltaT
  sd_increment <- sqrt(variance_increment)

  # Each value taken by the brownian motion agrees with the following properties
  # of the increments of the brownian motion:
  # E[increment] = 0
  # var(increment) = delta(time)
  n <- rnorm(n = time_upper_bound,
             mean = 0,
             sd = sd_increment)

  bm <- sapply(1:time_upper_bound, FUN = function(time){
    sum(n[1:time])
  })

  # As theorical lecture state: the brownian motion initial value is 0.
  # An interesting case TODO will be to implement brownian motion with another
  # initial value than 0.
  brownianmotion <- data.frame('time_periods' = time_step,
                               'brownian_motion_path' = c(0,bm))
}
