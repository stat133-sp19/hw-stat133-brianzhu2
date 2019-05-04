context("binomial")

test_that("bin_choose returns correct values and checks for valid input", {
  expect_equal(bin_choose(5, 2), 10)
  expect_equal(bin_choose(5, c(2, 3)), c(10, 10))

  expect_error(bin_choose(2, 5))
  expect_error(bin_choose(5, c(2, 6)))
  expect_error(bin_choose(c(5, 6), c(2, 3)))
})

test_that("bin_probability returns correct values", {
  expect_equal(bin_probability(0.5, 5, 2), 0.3125)

  expect_error(bin_probability(-1, 5, 2))
  expect_error(bin_probability(0.5, 5.5, 2))
  expect_error(bin_probability(0.5, 5, 7))
})

test_that("bin_distribution returns correct values", {
  pdf <- bin_distribution(0.5, 5)
  expect_equal(pdf$success, 0:5)
  expect_equal(pdf$probability, c(0.03125, 0.15625, 0.31250, 0.31250, 0.15625, 0.03125))

  expect_error(bin_distribution(1.5, 5))
  expect_error(bin_distribution(0.5, -3))
})

test_that("bin_cumulative returns correct values", {
  cdf <- bin_cumulative(0.5, 5)
  expect_equal(cdf$success, 0:5)
  expect_equal(cdf$probability, c(0.03125, 0.18750, 0.50000, 0.81250, 0.96875, 1.00000))

  expect_error(bin_cumulative(-1, 5))
  expect_error(bin_cumulative(0.5, 2.5))
})
