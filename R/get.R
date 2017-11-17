get_values <- function(obj, period) UseMethod('get_values')

get_values.sampled_randomwalk <- function(obj, period){
  scale <- attributes(obj)$scale
  obj[(period * scale) + 1, 2]
}

get_values.sampled_brownianmotion <- function(obj, period){
  scale <- attributes(obj)$scale
  obj[(period * scale) + 1, 2]
}

get_values.theoretical_randomwalk <- function(obj, period){
  print('theoretical_randomwalk')
}

