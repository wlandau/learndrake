assert_fresh_dir <- function(path, overwrite) {
  if (file.exists(path) && !overwrite) {
    stop("file ", path, " already exists.", call. = FALSE)
  }
}
