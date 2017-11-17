get_values <- function(obj) UseMethod('get_values')

get_values.sampled_randomwalk <- function(obj){
  print('sampled_randomwalk')
}

get_values.sampled_brownianmotion <- function(obj){
  print('sampled_brownianmotion')
}

get_values.theoretical_randomwalk <- function(obj){
  print('theoretical_randomwalk')
}

