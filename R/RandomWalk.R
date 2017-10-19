# load('R/RandomWalkGenerator.R')
randomWalk <- function(steps = 3000,
                       prob = c('head' = 0.5, 'tail' = 0.5)){
  randomWalkGenerator(steps, prob, 1)
}
