library(RandomWalk)
# Define random walk object ----------------------------

timeT <- 10
divider <- 4

#' @name rw - Theoretical distribution of a symmetric random walk.
#' The time period goes from 0 (with index 1) up to timeT (with index timeT + 1)
#' Each time period is isolated as a uniq element of a list.
#' Each element of the list is a data.frame with 2 column:
#'  * @name Mt - The description of the whole range of values taken by
#'               the symmetric random walk.
#'  * @name Pr - The probability associated to the value Mt taken by the R.W.
#'
#'  @example rw[[1]] take the value 0 for Mt and 1 for Pr. That means it is the
#'  begining of the period where there is actually not probability taken into
#'  account and where the only value taken by the R.W. is its initial value: 0
rw <- RandomWalk::trwalkGenerator(time_to_maturity = timeT, full = T)
rw_fullT <- RandomWalk::trwalkGenerator(time_to_maturity = timeT, full = T)
rw_fullF <- RandomWalk::trwalkGenerator(time_to_maturity = timeT)
