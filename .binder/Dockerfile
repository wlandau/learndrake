FROM rocker/tensorflow:3.6.0
LABEL maintainer='Will Landau'
USER root
COPY . ${HOME}
RUN wget https://github.com/wlandau/learndrake/raw/master/DESCRIPTION && R -e "options(repos = list(CRAN = 'http://mran.revolutionanalytics.com/snapshot/2019-06-21/')); devtools::install_deps()"
