## ------------------------------------------------------------------------
rw <- srwalkGenerator(n = 100)

## ------------------------------------------------------------------------
summary(rw[[1]])

## ------------------------------------------------------------------------
ggplot2::ggplot(rw[[1]], ggplot2::aes(x = time_periods, y = random_walk_path)) + 
  ggplot2::geom_line()

## ------------------------------------------------------------------------
ggplot2::ggplot(dplyr::bind_rows(rw, .id = "uniqueID"), 
                ggplot2::aes(x = time_periods, y = random_walk_path, colour=uniqueID)) + 
  ggplot2::geom_line() + 
  ggplot2::theme(legend.position = 'none')

