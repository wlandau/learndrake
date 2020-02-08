test_that("slides", {
  expect_silent(view_slides(browse = FALSE))
  path <- tempfile()
  expect_silent(save_slides(path))
  expect_true("index.Rmd" %in% list.files(path))
})

test_that("notebooks", {
  path <- tempfile()
  save_notebooks(path)
  out <- list.files(path)
  exp <- c(
    "1-functions",
    "2-plans",
    "3-changes",
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
  for (app in c("learndrakeflow", "learndrakeplans")) {
    path <- tempfile()
    save_app(app, path)
    out <- list.files(path)
    exp <- c("index.html", "index.Rmd")
    expect_true(all(exp %in% out))
  }
  path <- tempfile()
  save_app("drakeplanner", path)
  out <- list.files(path)
  exp <- c("app.R")
  expect_true(all(exp %in% out))
})

test_that("save_app() idempotence (#19)", {
  dir <- tempfile()
  dir.create(dir)
  withr::local_dir(dir)
  path <- "learndrakeflow"
  dir.create(path)
  expect_error(
    save_app(app = path, path = path, overwrite = FALSE),
    regexp = "already exists"
  )
  expect_false(file.exists(file.path(path, path)))
})

test_that("save_notebooks() idempotence (#19)", {
  dir <- tempfile()
  dir.create(dir)
  withr::local_dir(dir)
  for (path in c("notebooks", "learndrake-notebooks")) {
    dir.create(path)
    expect_error(
      save_notebooks(path = path, overwrite = FALSE),
      regexp = "already exists"
    )
    expect_false(file.exists(file.path(path, path)))
  }
})

test_that("save_slides() idempotence (#19)", {
  dir <- tempfile()
  dir.create(dir)
  withr::local_dir(dir)
  for (path in c("slides", "learndrake-slides")) {
    dir.create(path)
    expect_error(
      save_slides(path = path, overwrite = FALSE),
      regexp = "already exists"
    )
    expect_false(file.exists(file.path(path, path)))
  }
})
