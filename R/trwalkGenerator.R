trwalkGenerator <- function(steps = 100,
                            prob = c('head' = 1/2,
                                     'tail' = 1/2)){

  # One unit is added to steps because the first step of the theoretical random
  # walk is not random and in was indexed with 0 in theory.
  dim_x <- dim_y <- 1:(steps + 1)
  Mt <- outer(dim_x,
              dim_y,
              FUN=function(r,c){ifelse(c>=r, (c-r) - (r-1), NA_integer_)})

  #
  # Mt contains all the values the random variables could take
  # it remains to derive all the probabilities associated to that values:
  #
  #   * [fi]: Dataframe which has same dimension than Mt and which gives the probability associated.
  #
  fi <- outer(dim_x,
              dim_y,
              FUN = function(i, j){choose((j-1), (j-i)) * prob['head']^(j-1)})

  # Function used in the following lapply function to help to construc a list of
  # data.frame. Each item of the list contains a random walk up to a certain time
  # and the corresponding pairwise probability
  anonymous <- function(i){
    rw <- Mt[!is.na(Mt[, i]),i]
    pr <- fi[1:length(rw),i]
    data.frame(Mt = rw,
               Pr = pr)
  }

  lapply(1:(steps +1), anonymous)
}
