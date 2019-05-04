context("summary")

test_that("aux_mean returns correct values", {
  expect_equal(aux_mean(0, 5), 0)
  expect_equal(aux_mean(0.5, 5), 2.5)
  expect_equal(aux_mean(1, 5), 5)
})

test_that("aux_variance returns correct values", {
  expect_equal(aux_variance(0, 5), 0)
  expect_equal(aux_variance(0.5, 5), 1.25)
  expect_equal(aux_variance(1, 5), 0)
})

test_that("aux_mode returns correct values", {
  expect_equal(aux_mode(0, 5), 0)
  expect_equal(aux_mode(0.5, 5), 3)
  expect_equal(aux_mode(1, 5), 6)
})

test_that("aux_skewness returns correct values", {
  expect_true(is.infinite(aux_skewness(0, 5)))
  expect_true(is.infinite(aux_skewness(1, 5)))
  expect_equal(aux_skewness(0.5, 5), 0)
})

test_that("aux_kurtosis returns correct values", {
  expect_true(is.infinite(aux_kurtosis(0, 5)))
  expect_true(is.infinite(aux_kurtosis(1, 5)))
  expect_equal(aux_kurtosis(0.5, 5), -0.4)
})
