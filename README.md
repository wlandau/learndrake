
[![Launch RStudio
Cloud](https://img.shields.io/badge/RStudio-Cloud-blue)](https://rstudio.cloud/project/627076)
[![Launch RStudio
Binder](http://mybinder.org/badge_logo.svg)](https://mybinder.org/v2/gh/wlandau/learndrake/binder?urlpath=rstudio)

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

Notebooks `3-changes/3-changes.Rmd` and `4-static/4-static.Rmd` rely on
the following Shiny
apps.

| App                                             | Notebook                  |
| ----------------------------------------------- | ------------------------- |
| <http://wlandau.shinyapps.io/learndrakechanges> | `3-changes/3-changes.Rmd` |
| <http://wlandau.shinyapps.io/learndrakestatic>  | `4-static/4-static.Rmd`   |
| <http://wlandau.shinyapps.io/drakeplanner>      | `4-static/4-static.Rmd`   |

# The `learndrake` package

The [`learndrake`](https://github.com/wlandau/learndrake) R package
contains the materials of the short course. It helps students take the
workshop locally if they so choose, and it helps educators and
administrators host the workshop from alternative platforms.

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

## Usage

The functions in `learndrake` deploy and serve the course materials.

| Function           | Purpose                                        |
| ------------------ | ---------------------------------------------- |
| `save_notebooks()` | Save the `*.Rmd` notebooks to your computer.   |
| `view_slides()`    | Open the intro slides in a web browser.        |
| `save_slides()`    | Save the intro slides to your computer.        |
| `launch_app()`     | Launch a supporting Shiny app.                 |
| `save_app()`       | Save the code files of a supporting Shiny app. |

## Accompanying resources

This short course focuses mostly on `drake`’s mental model and core
concepts.

  - How to break up a project into functions.
  - How to think about and create `drake` plans.
  - How `drake` decides what is up to date and what is outdated.

The following resources cover important topics that did not make it into
the syllabus.

### In practice

  - [Miles McBain](https://github.com/MilesMcBain)’s [excellent blog
    post](https://milesmcbain.xyz/the-drake-post/) explains the
    motivating factors and practical issues {drake} addresses for most
    projects, how to set up a project as quickly and painlessly as
    possible, and how to overcome common obstacles.
  - Miles’ [`dflow`](https://github.com/MilesMcBain/dflow) package
    generates the file structure for a boilerplate `drake` project. It
    is a more thorough alternative to `drake::use_drake()`.
  - `drake` is heavily function-oriented by design, and Miles’
    [`fnmate`](https://github.com/MilesMcBain/fnmate) package
    automatically generates boilerplate code and docstrings for
    functions you mention in `drake` plans.

### High-performance computing

  - The [official manual](https://books.ropensci.org/drake) has a
    [chapter on `drake`’s high-performance
    computing](https://books.ropensci.org/drake/hpc.html) capabilities,
    which range from multicore computing on a local machine to
    large-scale deployment to a
cluster.

# Thanks

| Thanks to                                   | For                                                                                                                                                       |
| ------------------------------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------- |
| [Edgar Ruiz](https://github.com/edgararuiz) | Uniting `drake` and `keras` at <https://github.com/sol-eng/tensorflow-w-r> and providing valuable advice on the construction of the course.               |
| [Matt Dancho](https://github.com/mdancho84) | Publishing the original [blog post](https://blogs.rstudio.com/tensorflow/posts/2018-01-11-keras-customer-churn/) with the course’s underlying case study. |
| [Eric Nantz](https://github.com/rpodcast)   | Reviewing the materials and providing feedback.                                                                                                           |
