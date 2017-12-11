#' Brownian motion generator
#' @param seed - Define the seed sequence to alway get the same sampled
#' randomly generated brownian motion.
sbmotion <- function(time_to_maturity = 4,
                     seed = 1,
                     scale = 100){
  sbmotionGenerator(time_to_maturity = time_to_maturity,
                    seed = seed,
                    scale = scale,
                    n = 1)
}
