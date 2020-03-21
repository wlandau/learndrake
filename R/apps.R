#' @title Launch a supporting Shiny app
#' @description The notebooks `3-changes.Rmd` and `4-plans.Rmd`
#'   (see [save_notebooks()]) come with supporting Shiny apps
#'   to conduct the exercises. Use `launch_app()` to run one of these
#'   apps on your local machine.
#' @details For `3-changes.Rmd`, `launch_app("learndrakechanges")` opens
#'   a collection of exercises for iterating on a `drake` workflow.
#'   For `4-plans.Rmd`, `launch_app("learndrakestatic")` opens guided exercises
#'   on constructing `drake` plans,
#'   and `launch_app("drakeplanner")` spins up an app
#'   for visualizing and understanding plans.
#' @export
#' @seealso [save_notebooks()], [view_slides()]
#' @param app Character, name of the app to launch. Must be one of
#'   `"learndrakechanges"`, `"learndrakestatic"`, or `"drakeplanner"`.
#' @examples
#' \dontrun{
#' launch_app("learndrakechanges")
#' launch_app("learndrakestatic")
#' launch_app("drakeplanner")
#' }
launch_app <- function(
  app = c("learndrakechanges", "learndrakestatic", "drakeplanner")
) {
  app <- match.arg(app)
  switch(
    app,
    learndrakechanges = learnr::run_tutorial(
      "learndrakechanges",
      package = "learndrake"
    ),
    learndrakestatic = learnr::run_tutorial(
      "learndrakestatic",
      package = "learndrake"
    ),
    drakeplanner = drakeplanner::drakeplanner(),
    stop("not an app in learndrake.", call. = FALSE)
  )
}

#' @title Save the files for a supporting Shiny app
#' @description The notebooks `3-changes.Rmd` and `4-plans.Rmd`
#'   (see [save_notebooks()]) come with supporting Shiny apps
#'   to conduct the exercises. Use `save_app()` to save the files
#'   for an so you can deploy it to Shiny Server.
#' @details For `3-changes.Rmd`, `save_app("learndrakechanges")` saves
#'   a collection of exercises for iterating on a `drake` workflow.
#'   For `4-plans.Rmd`, `save_app("learndrakestatic")` saves guided exercises
#'   on constructing `drake` plans,
#'   and `save_app("drakeplanner")` saves an app
#'   for visualizing and understanding plans.
#' @export
#' @seealso [save_notebooks()], [view_slides()]
#' @param app Character, name of the app to launch. Must be one of
#'   `"flow"`, `"plans"`, or `"drakeplanner"`.
#' @inheritParams save_notebooks
#' @examples
#' \dontrun{
#' save_app("learndrakechanges")
#' save_app("learndrakestatic")
#' save_app("drakeplanner")
#' }
save_app <- function(
  app = c("learndrakechanges", "learndrakestatic", "drakeplanner"),
  path = app,
  overwrite = FALSE
) {
  assert_fresh_dir(path = path, overwrite = overwrite)
  app <- match.arg(app)
  dir <- ifelse(app == "drakeplanner", "apps", "tutorials")
  origin <- file.path(dir, app)
  origin <- system.file(origin, package = "learndrake", mustWork = TRUE)
  fs::dir_copy(path = origin, new_path = path, overwrite = overwrite)
  invisible()
}
