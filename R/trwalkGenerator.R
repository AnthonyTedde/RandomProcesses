#' trwalkGenerator compute all the sets of the values taken by a random walk
#' along with the associated probabilities.
#' @param time_to_maturity - Time at which the random walk process stops
#' @param prob - Probability of occurence of head and tail for each step
#' @param scale - Divider of the time step and multiplier of the increments
#' @examples
#' # Generate the theoretical distribution and value for a symmetric random walk
#' process up to time_to_maturity = 4 and scale = 100:
#' trwalkGenerator(time_to_maturity = 4, scale = 100)
#' @references
#' [1] Symmetric Random Walk, Stochastic Calculus for Finance, Steven e. Shreve, 2004, pp 83-84
#' @export
trwalkGenerator <- function(time_to_maturity = 100,
                            prob = c('head' = 1/2,
                                     'tail' = 1/2),
                            scale = 1){

  # One unit is added to time_to_maturity because the first step of the
  # theoretical random walk is not random and in was indexed with 0 in theory.
  dim_x <- dim_y <- 1:(time_to_maturity * scale + 1)
  anonymous <- function (row, col){
    ifelse(col>=row,
           (1/sqrt(scale) * ((col-row) - (row-1))),
           NA_integer_)
  }
  Mt <- outer(dim_x,
              dim_y,
              anonymous)

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

  lapply(1:(time_to_maturity +1), anonymous)
}
