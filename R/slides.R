#' @title Save the introductory slides
#' @description Save the slides to a folder.
#' @export
#' @seealso [view_slides()], [save_notebooks()], [launch_app()]
#' @param path Character, where to write the files.
#' @param overwrite Logical, whether to overwrite the files.
#' @examples
#' \dontrun{
#' save_slides()
#' }
save_slides <- function(path = "learndrake-slides", overwrite = FALSE) {
  assert_fresh_dir(path = path, overwrite = overwrite)
  origin <- system.file("slides", package = "learndrake", mustWork = TRUE)
  fs::dir_copy(path = origin, new_path = path, overwrite = overwrite)
  invisible()
}


#' @title View the introductory slides
#' @description Open the slides in a web browser.
#' @export
#' @seealso [save_slides()], [save_notebooks()], [launch_app()]
#' @param browse Logical, whether to actually view the slides.
#'   For testing purposes only.
#' @examples
#' \dontrun{
#' view_slides()
#' }
view_slides <- function(browse = TRUE) {
  path <- file.path("slides", "index.html")
  path <- system.file(path, package = "learndrake", mustWork = TRUE)
  if (browse) {
    utils::browseURL(path) # nocov
  }
  invisible()
}
