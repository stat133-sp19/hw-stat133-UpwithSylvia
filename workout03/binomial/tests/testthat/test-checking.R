context('test for checkers')

test_that("check_prob with valid probability values", {
  expect_true(check_prob(0.7))
  expect_true(check_prob(0))
  expect_true(check_prob(1))
  expect_length(check_prob(1),1)
  expect_type(check_prob(1),"logical")
})

test_that("check_prob fails with invalid probability values", {
  expect_error(check_prob(-1))
  expect_error(check_prob(1.6))
  expect_error(check_prob(1.0001))
})


test_that("check_trials with valid values for number of trials", {
  expect_true(check_trials(1))
  expect_true(check_trials(0))
  expect_length(check_trials(1),1)
  expect_true(check_trials(100))
  expect_type(check_trials(1),"logical")
})

test_that("check_trials fails with invalid values for number of trials", {
  expect_error(check_trials(-1))
  expect_error(check_trials(-10))
  expect_error(check_trials(-4))
})


test_that("check_success with valid values for number of success", {
  expect_true(check_success(10,10))
  expect_true(check_success(7,8))
  expect_true(check_success(0,10))
  expect_length(check_success(7,8),1)
  expect_type(check_success(1,2),"logical")
})

test_that("check_success fails with invalid values for number of success", {
  expect_error(check_success(11,7))
  expect_error(check_success(-2,5))
  expect_error(check_success(3,2))
})
