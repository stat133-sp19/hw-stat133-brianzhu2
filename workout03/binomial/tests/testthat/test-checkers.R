context("checkers")

test_that("check_prob allows correct values", {
  expect_true(check_prob(0.5))
  expect_true(check_prob(0))
  expect_true(check_prob(1))
})

test_that("check_prob prevents invalid values", {
  expect_error(check_prob("a"))
  expect_error(check_prob(c(1, 2)))
  expect_error(check_prob(-1))
  expect_error(check_prob(1.01))
})

test_that("check_trials allows correct values", {
  expect_true(check_trials(0))
  expect_true(check_trials(1))
  expect_true(check_trials(10))
})

test_that("check_trials prevents invalid values", {
  expect_error(check_trials("a"))
  expect_error(check_trials(c(5, 10)))
  expect_error(check_trials(-1))
  expect_error(check_trials(5.5))
})

test_that("check_success allows correct values", {
  expect_true(check_success(0, 5))
  expect_true(check_success(2, 5))
  expect_true(check_success(5, 5))
})

test_that("check_success prevents invalid values", {
  expect_error(check_success("a", 5))
  expect_error(check_success(-1, 5))
  expect_error(check_success(c(1.5, 2), 5))
  expect_error(check_success(c(3, NA), 5))
})
