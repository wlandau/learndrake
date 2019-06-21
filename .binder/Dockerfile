FROM rocker/tensorflow:3.6.0
LABEL maintainer='Will Landau'
USER root
COPY . ${HOME}
R -e "options(repos = list(CRAN = 'http://cran.rstudio.com')); remotes::install_github('wlandau/learndrake')"
