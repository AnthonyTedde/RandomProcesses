library(testthat)
library(RandomWalk)

# get_value ----------------------------
test_that("Getter function return the good value for the given time period", {
  # because index 1 is actually time 0:
  expect_equal(get_values(srwalk(), 5), srwalk()[6, 2])
  expect_equal(get_values(srwalk(time_to_maturity = 4, scale = 100),  0.2),
               srwalk(time_to_maturity = 4, scale = 100)[(0.2*100) + 1, 2] )
  expect_equal(get_values(sbmotion(time_to_maturity = 4, scale = 100), 0.4),
               sbmotion(time_to_maturity = 4, scale = 100)[(0.4 * 100) + 1, 2])
})
# time_to_maturity ----------------------------
# test_that("Getter function return the good upper bound period")
# scale ----------------------------
# test_that("Getter function return the good scale value for a given R.W.")

# test_that("The right value is returned from a call to the <<get>> function", {
#   expect_equal(get_theoricalValues(rw, time = 4), seq(4, -4, by = -2))
#   expect_equal(get_theoricalValues(scaledrw, time = 1 ), seq(4, -4, by = -2) * (1/sqrt(timeT)))
# })




