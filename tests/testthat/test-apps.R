context("apps")

if (FALSE) {

test_that("drakeplanner", {
  skip_on_cran()
  skip_if_not_installed("shinytest")
  shinytest::expect_pass(
    shinytest::testApp("../../inst/apps/drakeplanner/", compareImages = FALSE)
  )
})

test_that("flow", {
  skip_on_cran()
  skip_if_not_installed("shinytest")
  shinytest::expect_pass(
    shinytest::testApp("../../inst/tutorials/flow/", compareImages = FALSE)
  )
})

test_that("plans", {
  skip_on_cran()
  skip_if_not_installed("shinytest")
  shinytest::expect_pass(
    shinytest::testApp("../../inst/tutorials/plans/", compareImages = FALSE)
  )
})

}
