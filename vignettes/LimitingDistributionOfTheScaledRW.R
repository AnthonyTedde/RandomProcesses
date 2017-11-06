## ------------------------------------------------------------------------
timeT <- 4
anonymous <- function(n){
  RandomWalk::trwalkGenerator(time_to_maturity = timeT,
                scale = n, 
                full = T)[[n * timeT + 1]]
}
rws <- lapply(1:100, anonymous)

interval <- (rws[[100]]$Mt[1] - rws[[100]]$Mt[length(rws[[100]]$Mt)]) / 
  (length(rws[[100]]$Mt) - 1)

## ------------------------------------------------------------------------
ggplot2::ggplot(rws[[100]], ggplot2::aes(Mt)) +
  ggplot2::geom_histogram(ggplot2::aes(weight = Pr / interval), binwidth = interval) +
  ggplot2::scale_x_continuous(limits = c(-7.5, 7.5)) + 
  ggplot2::stat_function(fun = dnorm,
                         color = "blue",
                         args = list(mean = 0, 
                                     sd = sqrt(timeT)))

