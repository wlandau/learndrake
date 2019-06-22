FROM rocker/binder:3.6.0
LABEL maintainer='Will Landau'
USER root

ENV WORKON_HOME /opt/virtualenvs
ENV PYTHON_VENV_PATH $WORKON_HOME/r-tensorflow

RUN apt-get update && apt-get install -y --no-install-recommends \
        libpython3-dev \
        python3-venv && \
    rm -rf /var/lib/apt/lists/*

RUN python3 -m venv ${PYTHON_VENV_PATH}

RUN chown -R ${NB_USER} ${WORKON_HOME}

ENV PATH ${PYTHON_VENV_PATH}/bin:${PATH}
## And set ENV for R! It doesn't read from the environment...
RUN echo "PATH=${PATH}" >> /usr/local/lib/R/etc/Renviron && \
    echo "WORKON_HOME=${WORKON_HOME}" >> /usr/local/lib/R/etc/Renviron && \
    echo "RETICULATE_PYTHON_ENV=${PYTHON_VENV_PATH}" >> /usr/local/lib/R/etc/Renviron

## Because reticulate hardwires these PATHs...
RUN ln -s ${PYTHON_VENV_PATH}/bin/pip /usr/local/bin/pip && \
    ln -s ${PYTHON_VENV_PATH}/bin/virtualenv /usr/local/bin/virtualenv

## install as user to avoid venv issues later
USER ${NB_USER}
RUN pip3 install \
    h5py==2.9.0 \
    pyyaml==3.13 \
    requests==2.21.0 \
    Pillow==5.4.1 \
    tensorflow==1.12.0 \
    tensorflow-probability==0.5.0 \
    keras==2.2.4 \
    --no-cache-dir

USER root
RUN install2.r reticulate tensorflow keras

COPY . ${HOME}
RUN chown -R ${NB_USER} ${HOME}
USER ${NB_USER}

RUN R -e 'options(repos = list(CRAN = "http://cran.rstudio.com")); remotes::install_github("wlandau/learndrake", dependencies = c("Depends", "Imports"))'
