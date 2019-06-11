#' @title View the introductory slides
#' @description Open the slides in a web browser.
#' @export
#' @seealso [save_notebooks()], [launch_app()]
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
