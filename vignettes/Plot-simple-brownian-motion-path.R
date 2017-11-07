## ----fig.width = 6-------------------------------------------------------
brownianMotion <- sbmotion(scale = 1000)
ggplot2::ggplot(brownianMotion, ggplot2::aes(time_periods, brownian_motion_path)) +
  ggplot2::geom_point(alpha = 1/4, size = 0.5)

