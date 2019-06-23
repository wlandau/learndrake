
# Testing `holepunch`

The goal of the `test-holepunch` branch is to try out
<https://github.com/karthik/holepunch/issues/20#issuecomment-504701582>.
If successful, this badge should launch an RStudio Server instance at
the package root: [![Launch Rstudio
Binder](http://mybinder.org/badge_logo.svg)](https://mybinder.org/v2/gh/wlandau/learndrake/test-holepunch?urlpath=rstudio)

``` r
library(holepunch)
unlink(".binder") # re https://github.com/karthik/holepunch/issues/20#issuecomment-504702370
# write_compendium_description() # learndrake already has a DESCRIPTION file.
write_apt(apt_input = "libpython3-dev python3-venv libzmq3-dev")
write_requirements(requirements = "
h5py==2.9.0
pyyaml==3.13
requests==2.21.0
Pillow==5.4.1
tensorflow==1.12.0
tensorflow-probability==0.5.0
keras==2.2.4
")
write_dockerfile()
```

    ## ✔ Setting active project to '/home/landau/projects/learndrake'
    ## [1] TRUE

    ## → Setting R version to 3.6.0

    ## ✔ Dockerfile generated at ./.binder/Dockerfile

Right now, the `apt.txt` and `requirements.txt` do not seem to make it
into the Dockerfile, but future work should ease configuration.

``` r
cat_lines <- function(file) {
    cat(readLines(file), sep = "\n")
}

cat_lines(".binder/apt.txt")
```

    ## libpython3-dev python3-venv libzmq3-dev

``` r
cat_lines(".binder/requirements.txt")
```

    ## 
    ## h5py==2.9.0
    ## pyyaml==3.13
    ## requests==2.21.0
    ## Pillow==5.4.1
    ## tensorflow==1.12.0
    ## tensorflow-probability==0.5.0
    ## keras==2.2.4

``` r
cat_lines(".binder/Dockerfile")
```

    ## FROM rocker/binder:3.6.0
    ## LABEL maintainer='Unknown'
    ## USER root
    ## COPY . ${HOME}
    ## RUN chown -R ${NB_USER} ${HOME}
    ## USER ${NB_USER}
    ## RUN wget https://github.com/wlandau/learndrake/raw/master/DESCRIPTION && R -e "options(repos = list(CRAN = 'http://mran.revolutionanalytics.com/snapshot/2019-06-23/')); devtools::install_deps()"
