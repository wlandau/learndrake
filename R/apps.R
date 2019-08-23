#' @title Launch a supporting Shiny app
#' @description The notebooks `3-flow.Rmd` and `4-plans.Rmd`
#'   (see [save_notebooks()]) come with supporting Shiny apps
#'   to conduct the exercises. Use `launch_app()` to run one of these
#'   apps on your local machine.
#' @details For `3-flow.Rmd`, `launch_app("learndrakeflow")` opens
#'   a collection of exercises for iterating on a `drake` workflow.
#'   For `4-plans.Rmd`, `launch_app("learndrakeplans")` opens guided exercises
#'   on constructing `drake` plans,
#'   and `launch_app("drakeplanner")` spins up an app
#'   for visualizing and understanding plans.
#' @export
#' @seealso [save_notebooks()], [view_slides()]
#' @param app Character, name of the app to launch. Must be one of
#'   `"flow"`, `"plans"`, or `"drakeplanner"`.
#' @examples
#' \dontrun{
#' launch_app("learndrakeflow")
#' launch_app("learndrakeplans")
#' launch_app("drakeplanner")
#' }
launch_app <- function(
  app = c("learndrakeflow", "learndrakeplans", "drakeplanner")
) {
  app <- match.arg(app)
  switch(
    app,
    learndrakeflow = learnr::run_tutorial(
      "learndrakeflow",
      package = "learndrake"
    ),
    learndrakeplans = learnr::run_tutorial(
      "learndrakeplans",
      package = "learndrake"
    ),
    drakeplanner = drakeplanner::drakeplanner(),
    stop("not an app in learndrake.", call. = FALSE)
  )
}

#' @title Save the files for a supporting Shiny app
#' @description The notebooks `3-flow.Rmd` and `4-plans.Rmd`
#'   (see [save_notebooks()]) come with supporting Shiny apps
#'   to conduct the exercises. Use `save_app()` to save the files
#'   for an so you can deploy it to Shiny Server.
#' @details For `3-flow.Rmd`, `save_app("learndrakeflow")` saves
#'   a collection of exercises for iterating on a `drake` workflow.
#'   For `4-plans.Rmd`, `save_app("learndrakeplans")` saves guided exercises
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
#' save_app("learndrakeflow")
#' save_app("learndrakeplans")
#' save_app("drakeplanner")
#' }
save_app <- function(
  app = c("learndrakeflow", "learndrakeplans", "drakeplanner"),
  path = app,
  overwrite = FALSE
) {
  app <- match.arg(app)
  dir <- ifelse(app == "drakeplanner", "apps", "tutorials")
  origin <- file.path(dir, app)
  origin <- system.file(origin, package = "learndrake", mustWork = TRUE)
  fs::dir_copy(path = origin, new_path = path, overwrite = overwrite)
  invisible()
}
