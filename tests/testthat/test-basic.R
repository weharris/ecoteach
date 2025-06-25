test_that("basic test", {
  expect_equal(1 + 1, 2)
})

test_that("dormouse_hibernation dataset is available", {
  data(dormouse_hibernation)
  expect_s3_class(dormouse_hibernation, "data.frame")
  expect_gt(nrow(dormouse_hibernation), 0)
  expect_true("sex" %in% names(dormouse_hibernation))
})
