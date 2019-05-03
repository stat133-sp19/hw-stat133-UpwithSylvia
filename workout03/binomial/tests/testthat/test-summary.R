context('test for summary measures')

test_that("aux_mean with correct values for the mean of the binomial distribution", {
  expect_equal(aux_mean(10, 0.5), 5)
  expect_length(aux_mean(10,0.5), 1)
  expect_equal(aux_mean(7, 0), 0)
  expect_type(aux_mean(7,0),"double")
  expect_equal(aux_mean(20, 1), 20)
})

test_that("aux_variance with correct values for the variance of the binomial distribution", {
  expect_equal(aux_variance(10, 0.5), 2.5)
  expect_equal(aux_variance(7, 0), 0)
  expect_length(aux_variance(10,0.5), 1)
  expect_type(aux_variance(7,0),"double")
  expect_equal(aux_variance(20, 1), 0)
})

test_that("aux_mode with correct values for the mode of the binomial distribution", {
  expect_equal(aux_mode(10, 0.5), 5)
  expect_equal(aux_mode(7, 0), 0)
  expect_length(aux_mode(10,0.5), 1)
  expect_type(aux_mode(7,0),"integer")
  expect_equal(aux_mode(20, 1), 21)
})


test_that("aux_skewness with correct values for the skewness of the binomial distribution", {
  expect_equal(aux_skewness(10, 0.5), 0)
  expect_equal(aux_skewness(7, 0), Inf)
  expect_length(aux_skewness(10,0.5), 1)
  expect_type(aux_skewness(10,0.5),"double")
  expect_equal(aux_skewness(20, 1), -Inf)
})


test_that("aux_kurtosis with correct values for the kurtosis of the binomial distribution", {
  expect_equal(aux_kurtosis(10, 0.5), -0.2)
  expect_length(aux_kurtosis(10,0.5), 1)
  expect_type(aux_kurtosis(10,0.5),"double")
  expect_equal(aux_kurtosis(7, 0), Inf)
  expect_equal(aux_kurtosis(20, 1), Inf)
})