#' Brownian motion generator
#' @param seed - Define the seed sequence to alway get the same sampled
#' randomly generated brownian motion.
sbmotion <- function(time_to_maturity = 4,
                     prob = c('head' = 1/2,
                              'tail' = 1/2),
                     seed = 1,
                     scale = 100){
  sbmotionGenerator(time_to_maturity,
                    prob,
                    seed,
                    scale,
                    1)
}
