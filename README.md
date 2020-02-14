
[![Launch RStudio
Cloud](https://img.shields.io/badge/RStudio-Cloud-blue)](https://rstudio.cloud/project/627076)
[![Launch RStudio
Binder](http://mybinder.org/badge_logo.svg)](https://mybinder.org/v2/gh/wlandau/learndrake/binder?urlpath=rstudio)
[![Travis build
status](https://travis-ci.org/wlandau/learndrake.svg?branch=master)](https://travis-ci.org/wlandau/learndrake)
[![Codecov test
coverage](https://codecov.io/gh/wlandau/learndrake/branch/master/graph/badge.svg)](https://codecov.io/gh/wlandau/learndrake?branch=master)

# Reproducible workflows at scale with `drake`

Ambitious workflows in R, such as machine learning analyses, can be
difficult to manage. A single round of computation can take several
hours to complete, and routine updates to the code and data tend to
invalidate hard-earned results. You can enhance the maintainability,
hygiene, speed, scale, and reproducibility of such projects with the
[`drake`](https://github.com/ropensci/drake) R package.
[`drake`](https://github.com/ropensci/drake) resolves the dependency
structure of your analysis pipeline, skips tasks that are already up to
date, executes the rest with [optional distributed
computing](https://books.ropensci.org/drake/hpc.html), and organizes the
output so you rarely have to think about data files. This workshop will
teach you how to create and maintain machine learning projects with
[`drake`](https://github.com/ropensci/drake)-powered automation.

# Installation

To obtain the workshop materials, install the
[`learndrake`](https://github.com/wlandau/learndrake) package,
[TensorFlow](https://www.tensorflow.org), and
[Keras](https://keras.io/).

``` r
install.packages("remotes")
remotes::install_github("wlandau/learndrake")
keras::install_keras()
# Check if the installation succeeded.
tensorflow::tf_config()
```

If you are using RStudio version 1.2.5003 and encounter [this fatal
error](https://github.com/rstudio/rstudio/issues/6049), consider
downgrading TensorFlow to version 1.13.1. Note: `install_keras()`
silently tries to upgrade TensorFlow to version \>= 2, so you will need
to run it with `tensorflow = "1.13.1`.

# Usage

## RStudio Cloud

1.  Sign up for [RStudio Cloud](https://rstudio.cloud).
2.  Navigate to <https://rstudio.cloud/project/627076> to open a new
    copy of the workshop.
3.  Optional: save a permanent copy so you can come back to it later.
    Look for the red “temporary copy” text at the top and click the
    “save a permanent copy” option next to it.

## Binder

Just click this badge: [![Launch RStudio
Binder](http://mybinder.org/badge_logo.svg)](https://mybinder.org/v2/gh/wlandau/learndrake/binder?urlpath=rstudio).
Your browser will open the materials in a free RStudio Server instance.

  - Advantage: no need to sign up for RStudio Cloud.
  - Disadvantage: long load times and quick timeouts.

## Local

The functions in `learndrake` help navigate and deploy the workshop
materials. If you installed the package and dependencies as above, you
can take the workshop locally without an internet connection. Start with
the introductory slides, then move on to the notebooks. Launch apps
along the way as
directed.

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
supporting files to your
computer.

| Notebook          | Topic                                                                                      |
| ----------------- | ------------------------------------------------------------------------------------------ |
| `1-functions.Rmd` | Establish R functions the motivating example.                                              |
| `2-plans.Rmd`     | Build up a [`drake`](https://github.com/ropensci/drake) plan.                              |
| `3-changes.Rmd`   | Experience how [`drake`](https://github.com/ropensci/drake) responds to changes.           |
| `4-static`        | A tutorial of [static branching](https://books.ropensci.org/drake/static.html).            |
| `5-dynamic`       | A tutorial of [dynamic branching](https://books.ropensci.org/drake/dynamic.html).          |
| `6-files`         | [`drake`](https://github.com/ropensci/drake) workflows with external files and R Markdown. |

# Apps

Notebooks `3-changes.Rmd` and `4-static.Rmd` come with supporting Shiny
apps to conduct the learning
exercises.

| App                                                                       | Notebook        | Deploy locally                    | Public URL                                      |
| ------------------------------------------------------------------------- | --------------- | --------------------------------- | ----------------------------------------------- |
| Iterate on a [`drake`](https://github.com/ropensci/drake) workflow        | `3-changes.Rmd` | `launch_app("learndrakechanges")` | <http://wlandau.shinyapps.io/learndrakechanges> |
| Exercises on [`drake` plans](https://books.ropensci.org/drake/plans.html) | `4-static.Rmd`  | `launch_app("learndrakestatic")`  | <http://wlandau.shinyapps.io/learndrakestatic>  |
| Visualize [`drake`](https://github.com/ropensci/drake) projects           | `4-static.Rmd`  | `launch_app("drakeplanner")`      | <http://wlandau.shinyapps.io/drakeplanner>      |

# Thanks

| Thanks to                                   | For                                                                                                                                                         |
| ------------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------- |
| [Edgar Ruiz](https://github.com/edgararuiz) | Uniting `drake` and `keras` at <https://github.com/sol-eng/tensorflow-w-r> and providing valuable advice on the construction of the workshop.               |
| [Matt Dancho](https://github.com/mdancho84) | Publishing the original [blog post](https://blogs.rstudio.com/tensorflow/posts/2018-01-11-keras-customer-churn/) with the workshop’s underlying case study. |
| [Eric Nantz](https://github.com/rpodcast)   | Reviewing and providing feedback on this workshop.                                                                                                          |
