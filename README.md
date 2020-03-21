
[![Launch RStudio
Cloud](https://img.shields.io/badge/RStudio-Cloud-blue)](https://rstudio.cloud/project/627076)
[![Launch RStudio
Binder](http://mybinder.org/badge_logo.svg)](https://mybinder.org/v2/gh/wlandau/learndrake/binder?urlpath=rstudio)
[![Travis build
status](https://travis-ci.org/wlandau/learndrake.svg?branch=master)](https://travis-ci.org/wlandau/learndrake)
[![Codecov test
coverage](https://codecov.io/gh/wlandau/learndrake/branch/master/graph/badge.svg)](https://codecov.io/gh/wlandau/learndrake?branch=master)

# The drake short course

`learndrake` is a free online short course on the [`drake` R
package](https://github.com/ropensci/drake). With guided web-based
hands-on exercises, you will gradually build up a
[`drake`](https://github.com/ropensci/drake)-powered [machine learning
project](https://blogs.rstudio.com/tensorflow/posts/2018-01-11-keras-customer-churn/)
and practice the fundamentals of
[`drake`](https://github.com/ropensci/drake). If you run into trouble or
have questions along the way, please post an issue at
<https://github.com/wlandau/learndrake> to ask for help.

## How to take the course

1.  Read the intro slides at <https://wlandau.github.io/learndrake> and
    watch the video recording at
    <https://ropensci.org/commcalls/2019-09-24>.
2.  Sign up for a free RStudio Cloud account at <https://rstudio.cloud>.
3.  Log into the public RStudio Cloud workspace at
    <https://rstudio.cloud/project/627076>. You are now running an
    instance of RStudio Server with everything you need.
4.  In the “Files” pane of the IDE, locate the numbered folders with
    `*.Rmd` notebooks inside. Work through the notebooks in order.

| Topic                | Notebook                      |
| -------------------- | ----------------------------- |
| Custom functions     | `1-functions/1-functions.Rmd` |
| `drake` plans        | `2-plans/2-plans.Rmd`         |
| Changing workflows   | `3-changes/3-changes.Rmd`     |
| Static branching     | `4-static/4-static.Rmd`       |
| Dynamic branching    | `5-dynamic/5-dynamic.Rmd`     |
| Files and R Markdown | `6-files/6-files.Rmd`         |

# The `learndrake` package

The [`learndrake`](https://github.com/wlandau/learndrake) R package
contains the materials of the short course.

## Installation

You can install [`learndrake`](https://github.com/wlandau/learndrake)
from GitHub.

``` r
install.packages("remotes")
remotes::install_github("wlandau/learndrake")
```

To run the exercises locally, you will also need
[TensorFlow](https://www.tensorflow.org) and [Keras](https://keras.io/).

``` r
keras::install_keras()
# Check if the installation succeeded.
tensorflow::tf_config()
```

If you are using RStudio version 1.2.5003 and encounter [this fatal
error](https://github.com/rstudio/rstudio/issues/6049), consider
downgrading TensorFlow to version 1.13.1. Note: `install_keras()`
silently tries to upgrade TensorFlow to version \>= 2, so you will need
to run it with `tensorflow = "1.13.1`.

## Local usage

The functions in `learndrake` help navigate and deploy the workshop
materials. If you installed the package and dependencies as above, you
can take the workshop locally without an internet connection. Start with
the introductory slides, then move on to the notebooks. Launch apps
along the way as directed.

| Function           | Purpose                                                                                                                                                  |
| ------------------ | -------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `launch_app()`     | Launch a Shiny app that accompanies a tutorial.                                                                                                          |
| `save_app()`       | Save the app files so you can deploy to [shinyapps.io](https://www.shinyapps.io) or [Shiny Server](https://www.rstudio.com/products/shiny/shiny-server). |
| `save_notebooks()` | Save the tutorials to your computer: R notebooks and supporting files.                                                                                   |
| `save_slides()`    | Save the introductory slides to your computer.                                                                                                           |
| `view_slides()`    | Open the introductory slides in a web browser.                                                                                                           |

# Introductory presentation

The workshop begins with an introductory presentation on
[`drake`](https://github.com/ropensci/drake). You can find a video
recording [here](https://ropensci.org/commcalls/2019-09-24/).
Alternatively, you can view the slides at
<https://wlandau.github.io/learndrake/index.html> or open them yourself
in a browser with `view_slides()`.

<center>

<a href="https://ropensci.org/commcalls/2019-09-24/">
<img src="https://docs.ropensci.org/drake/reference/figures/commcall.png" alt="commcall" align="center" style = "border: none; float: center;">
</a>

</center>

<br> <br>

# Tutorials

After the introductory presentation, students work through a sequence of
R notebooks in order. Use `save_notebooks()` to save the notebooks and
supporting files to your computer.

| Topic                | Notebook                                                                                                                      |
| -------------------- | ----------------------------------------------------------------------------------------------------------------------------- |
| Custom functions     | [`1-functions/1-functions.Rmd`](https://github.com/wlandau/learndrake/blob/master/inst/notebooks/1-functions/1-functions.Rmd) |
| `drake` plans        | [`2-plans/2-plans.Rmd`](https://github.com/wlandau/learndrake/blob/master/inst/notebooks/2-plans/2-plans.Rmd)                 |
| Changing workflows   | [`3-changes/3-changes.Rmd`](https://github.com/wlandau/learndrake/blob/master/inst/notebooks/3-changes/3-changes.Rmd)         |
| Static branching     | [`4-static/4-static.Rmd`](https://github.com/wlandau/learndrake/blob/master/inst/notebooks/4-static/4-static.Rmd)             |
| Dynamic branching    | [`5-dynamic/5-dynamic.Rmd`](https://github.com/wlandau/learndrake/blob/master/inst/notebooks/5-dynamic/5-dynamic.Rmd)         |
| Files and R Markdown | [`6-files/6-files.Rmd`](https://github.com/wlandau/learndrake/blob/master/inst/notebooks/6-files/6-files.Rmd)                 |

# Apps

Notebooks `3-changes.Rmd` and `4-static.Rmd` come with supporting Shiny
apps to conduct the learning exercises. Use `launch_app()` to run any of
these apps locally.

| App                                             | Notebook                                                                                                              |
| ----------------------------------------------- | --------------------------------------------------------------------------------------------------------------------- |
| <http://wlandau.shinyapps.io/learndrakechanges> | [`3-changes/3-changes.Rmd`](https://github.com/wlandau/learndrake/blob/master/inst/notebooks/3-changes/3-changes.Rmd) |
| <http://wlandau.shinyapps.io/learndrakestatic>  | [`4-static/4-static.Rmd`](https://github.com/wlandau/learndrake/blob/master/inst/notebooks/4-static/4-static.Rmd)     |
| <http://wlandau.shinyapps.io/drakeplanner>      | [`4-static/4-static.Rmd`](https://github.com/wlandau/learndrake/blob/master/inst/notebooks/4-static/4-static.Rmd)     |

# Thanks

| Thanks to                                   | For                                                                                                                                                         |
| ------------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------- |
| [Edgar Ruiz](https://github.com/edgararuiz) | Uniting `drake` and `keras` at <https://github.com/sol-eng/tensorflow-w-r> and providing valuable advice on the construction of the workshop.               |
| [Matt Dancho](https://github.com/mdancho84) | Publishing the original [blog post](https://blogs.rstudio.com/tensorflow/posts/2018-01-11-keras-customer-churn/) with the workshop’s underlying case study. |
| [Eric Nantz](https://github.com/rpodcast)   | Reviewing and providing feedback on this workshop.                                                                                                          |
