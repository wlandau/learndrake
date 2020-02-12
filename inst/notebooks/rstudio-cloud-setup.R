install.packages("remotes")
remotes::install_github("wlandau/learndrake")
setwd("/cloud")
learndrake::save_notebooks("project", overwrite = TRUE)
setwd("/cloud/project")
reticulate::install_miniconda("miniconda")
Sys.setenv(WORKON_HOME = "virtualenvs")
reticulate::virtualenv_create("r-reticulate", python = "miniconda/bin/python")
tensorflow::install_tensorflow(
  method = "virtualenv",
  conda = "miniconda/bin/conda",
  envname = "r-reticulate",
  restart_session = FALSE
)
keras::install_keras(
  method = "virtualenv",
  conda = "miniconda/bin/conda",
  envname = "r-reticulate",
  restart_session = FALSE
)
line <- "WORKON_HOME=/cloud/project/virtualenvs"
writeLines(line, ".Renviron")
dirs <- list.files(pattern = "^[0-9]")
for (dir in dirs) {
  writeLines(line, file.path(dir, ".Renviron"))
}
rstudioapi::restartSession()
