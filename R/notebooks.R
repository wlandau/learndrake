#' @title Save the tutorials to your computer
#' @description The tutorials are a sequence of R notebooks
#'   and supporting files.
#' @export
#' @seealso [view_slides()], [launch_app()]
#' @param path Character, where to write the files
#' @param overwrite Logical, whether to over
#' @examples
#' \dontrun{
#' save_notebooks()
#' }
save_notebooks <- function(path = "learndrake", overwrite = FALSE) {
  origin <- system.file("notebooks", package = "learndrake", mustWork = TRUE)
  fs::dir_copy(path = origin, new_path = path, overwrite = overwrite)
  invisible()
}
