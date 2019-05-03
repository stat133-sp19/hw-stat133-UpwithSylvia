context('test for main functions')

test_that("bin_choose gets the correct number of combinations in which k successes can occur in n trials", {
  expect_equal(round(bin_choose(10, 0.5)), 4)
  expect_equal(bin_choose(10, 2:3), c(45,120))
  expect_type(bin_choose(7,0),"double")
  expect_length(bin_choose(7,0),1)
})

test_that("bin_probability gets the correct probability of certain successes in certain trials with certain probability", {
  expect_equal(bin_probability(3,6,0.5), 0.3125)
  expect_length(bin_probability(3,6,0.5), 1)
  expect_type(bin_probability(3,6,0.5),"double")
})


test_that("bin_distribution with the correct binomial distribution", {
  expect_is(bin_distribution(7, 0), c('bindis','data.frame'))
  expect_length(bin_distribution(10,0.5), 2)
  expect_equal(round(bin_distribution(7,0.5)[[2]][1],7),0.0078125)
})


test_that("bin_cumulative with the correct binomial cumulative distribution", {
  expect_is(bin_cumulative(10, 0.5), c('bincum','data.frame'))
  expect_length(bin_cumulative(10,0.5), 3)
  expect_equal(round(bin_cumulative(4, 0.7)[[3]][5]), 1)
})

