context("materials")

test_that("slides", {
  expect_silent(view_slides(browse = FALSE))
  # view_slides() # nolint
})

test_that("notebooks", {
  path <- tempfile()
  save_notebooks(path)
  out <- list.files(path)
  exp <- c(
    "1-churn",
    "2-setup",
    "3-flow",
    "4-plans",
    "5-files",
    "6-reports",
    "7-hpc",
    "config",
    "data",
    "README.md"
  )
  expect_true(all(exp %in% out))
})

test_that("apps", {
  for (app in c("flow", "plans")) {
    path <- tempfile()
    save_app("flow", path)
    out <- list.files(path)
    exp <- c("index.html", "index.Rmd", "R")
    expect_true(all(exp %in% out))
  }
  path <- tempfile()
  save_app("drakeplanner", path)
  out <- list.files(path)
  exp <- c("app.R")
  expect_true(all(exp %in% out))
})
