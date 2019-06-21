FROM rocker/binder:3.6.0
LABEL maintainer='Will Landau'
USER root
COPY . ${HOME}
RUN chown -R ${NB_USER} ${HOME}
USER ${NB_USER}
RUN apt-get update
RUN apt-get install python3
RUN pip install --upgrade --ignore-installed --user travis virtualenv
RUN wget https://github.com/wlandau/learndrake/raw/master/DESCRIPTION && R -e "options(repos = list(CRAN = 'http://mran.revolutionanalytics.com/snapshot/2019-06-21/')); devtools::install_deps()"
RUN R -e 'tensorflow::install_tensorflow(version = Sys.getenv("TENSORFLOW_VERSION"))'
RUN R -e 'tensorflow::tf_config()'
RUN R -e 'keras::install_keras()'
