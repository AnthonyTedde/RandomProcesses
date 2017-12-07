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

get_sbmotion_point <- function(time_to_maturity = 4,
                               prob = c('head' = .5,
                                        'tail' = .5),
                               seed = 1){

  function(time){
    set.seed(1 * time_to_maturity * time)
    .Random.seed[round(runif(1, min = 1, max = length(.Random.seed)))]
    # Define the predecessor:
    # In a first version time will be divided by 2.
    anscestor <- time / 2
    rnorm(1, mean = 0, sd = sqrt(time))
  }
}
