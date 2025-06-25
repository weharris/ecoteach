test_that("basic test", {
  expect_equal(1 + 1, 2)
})

test_that("shannon_diversity calculates correctly", {
  expect_equal(shannon_diversity(c(10, 10, 10)), -sum(rep(1/3, 3) * log(rep(1/3, 3))))
  expect_equal(shannon_diversity(c(0, 10, 0)), 0)
})

test_that("dormouse_hibernation dataset is available", {
  data(dormouse_hibernation)
  expect_s3_class(dormouse_hibernation, "data.frame")
  expect_gt(nrow(dormouse_hibernation), 0)
  expect_true("sex" %in% names(dormouse_hibernation))
})
