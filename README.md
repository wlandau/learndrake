
[![Travis build status](https://travis-ci.org/wlandau/learndrake.svg?branch=master)](https://travis-ci.org/wlandau/learndrake) [![Codecov test coverage](https://codecov.io/gh/wlandau/learndrake/branch/master/graph/badge.svg)](https://codecov.io/gh/wlandau/learndrake?branch=master) [![Launch RStudio Binder](http://mybinder.org/badge_logo.svg)](https://mybinder.org/v2/gh/wlandau/learndrake/binder?urlpath=rstudio)

Reproducible workflows at scale with `drake`
============================================

Ambitious workflows in R, such as machine learning analyses, can be difficult to manage. A single round of computation can take several hours to complete, and routine updates to the code and data tend to invalidate hard-earned results. You can enhance the maintainability, hygiene, speed, scale, and reproducibility of such projects with the [`drake`](https://github.com/ropensci/drake) R package. [`drake`](https://github.com/ropensci/drake) resolves the dependency structure of your analysis pipeline, skips tasks that are already up to date, executes the rest with [optional distributed computing](https://ropenscilabs.github.io/drake-manual/hpc.html), and organizes the output so you rarely have to think about data files. This workshop will teach you how to create and maintain machine learning projects with [`drake`](https://github.com/ropensci/drake)-powered automation.

Installation
============

To obtain the workshop materials, install the [`learndrake`](https://github.com/wlandau/learndrake) package, [TensorFlow](https://www.tensorflow.org), and [Keras](https://keras.io/).

``` r
install.packages("remotes")
remotes::install_github("wlandau/learndrake")
tensorflow::install_tensorflow()
keras::install_keras()
```

Usage: browser
==============

Just click this badge: [![Launch RStudio Binder](http://mybinder.org/badge_logo.svg)](https://mybinder.org/v2/gh/wlandau/learndrake/binder?urlpath=rstudio). Your browser will open the materials in a free RStudio Server instance. The exercises are in the notebooks (`1-churn/1-churn.Rmd`, `2-setup/2-setup.Rmd`, etc.).

Usage: local
============

The functions in `learndrake` help navigate and deploy the workshop materials. If you installed the package and dependencies as above, you can take the workshop locally without an internet connection. Start with the introductory slides, then move on to the notebooks. Launch apps along the way as directed.

<table style="width:11%;">
<colgroup>
<col width="5%" />
<col width="5%" />
</colgroup>
<thead>
<tr class="header">
<th>Function</th>
<th>Purpose</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td><code>launch_app()</code></td>
<td>Launch a Shiny app that accompanies a tutorial.</td>
</tr>
<tr class="even">
<td><code>save_app()</code></td>
<td>Save the app files so you can deploy to <a href="https://www.shinyapps.io">shinyapps.io</a> or <a href="https://www.rstudio.com/products/shiny/shiny-server">Shiny Server</a>.</td>
</tr>
<tr class="odd">
<td><code>save_notebooks()</code></td>
<td>Save the tutorials to your computer: R notebooks and supporting files.</td>
</tr>
<tr class="even">
<td><code>save_slides()</code></td>
<td>Save the introductory slides to your computer.</td>
</tr>
<tr class="odd">
<td><code>view_slides()</code></td>
<td>Open the introductory slides in a web browser.</td>
</tr>
</tbody>
</table>

Introductory presentation
=========================

The workshop begins with an introductory presentation on [`drake`](https://github.com/ropensci/drake). You can find a video recording [here](https://ropensci.org/commcalls/2019-09-24/). Alternatively, you can view the slides at <https://wlandau.github.io/learndrake/index.html> or open them yourself in a browser with `view_slides()`.

<center>
<a href="https://ropensci.org/commcalls/2019-09-24/"> <img src="https://docs.ropensci.org/drake/reference/figures/commcall.png" alt="commcall" align="center" style = "border: none; float: center;"> </a>
</center>
<br> <br>

Tutorials
=========

After the introductory presentation, students work through a sequence of R notebooks in order. Use `save_notebooks()` to save the notebooks and supporting files to your computer.

| Notebook      | Topic                                                                                     |
|---------------|-------------------------------------------------------------------------------------------|
| `1-churn.Rmd` | Deep learning case study                                                                  |
| `2-setup.Rmd` | Convert the case study to a new [`drake`](https://github.com/ropensci/drake) project.     |
| `3-flow.Rmd`  | Develop, work, and iterate on the project.                                                |
| `4-plans`     | A deep dive into [`drake` plans](https://ropenscilabs.github.io/drake-manual/plans.html). |
| `5-files`     | Custom input and output data files.                                                       |
| `6-reports`   | Special considerations of `knitr` and R Markdown reports.                                 |
| `7-hpc`       | High-performance computing                                                                |

Apps
====

Notebooks `3-flow.Rmd` and `4-plans.Rmd` come with supporting Shiny apps to conduct the learning exercises.

<table style="width:22%;">
<colgroup>
<col width="5%" />
<col width="5%" />
<col width="5%" />
<col width="5%" />
</colgroup>
<thead>
<tr class="header">
<th>App</th>
<th>Notebook</th>
<th>Deploy locally</th>
<th>Public URL</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td>Iterate on a <a href="https://github.com/ropensci/drake"><code>drake</code></a> workflow</td>
<td><code>3-flow.Rmd</code></td>
<td><code>launch_app(&quot;flow&quot;)</code></td>
<td><a href="http://wlandau.shinyapps.io/learndrakeflow" class="uri">http://wlandau.shinyapps.io/learndrakeflow</a></td>
</tr>
<tr class="even">
<td>Exercises on <a href="https://ropenscilabs.github.io/drake-manual/plans.html"><code>drake</code> plans</a></td>
<td><code>4-plans.Rmd</code></td>
<td><code>launch_app(&quot;plans&quot;)</code></td>
<td><a href="http://wlandau.shinyapps.io/learndrakeplans" class="uri">http://wlandau.shinyapps.io/learndrakeplans</a></td>
</tr>
<tr class="odd">
<td>Visualize <a href="https://github.com/ropensci/drake"><code>drake</code></a> projects</td>
<td><code>4-plans.Rmd</code></td>
<td><code>launch_app(&quot;drakeplanner&quot;)</code></td>
<td><a href="http://wlandau.shinyapps.io/drakeplanner" class="uri">http://wlandau.shinyapps.io/drakeplanner</a></td>
</tr>
</tbody>
</table>

Thanks
======

<table style="width:11%;">
<colgroup>
<col width="5%" />
<col width="5%" />
</colgroup>
<thead>
<tr class="header">
<th>Thanks to</th>
<th>For</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td><a href="https://github.com/edgararuiz">Edgar Ruiz</a></td>
<td>Uniting <code>drake</code> and <code>keras</code> at <a href="https://github.com/sol-eng/tensorflow-w-r" class="uri">https://github.com/sol-eng/tensorflow-w-r</a> and providing valuable advice on the construction of the workshop.</td>
</tr>
<tr class="even">
<td><a href="https://github.com/mdancho84">Matt Dancho</a></td>
<td>Publishing the original <a href="https://blogs.rstudio.com/tensorflow/posts/2018-01-11-keras-customer-churn/">blog post</a> with the workshop's underlying case study.</td>
</tr>
<tr class="odd">
<td><a href="https://github.com/rpodcast">Eric Nantz</a></td>
<td>Reviewing and providing feedback on this workshop.</td>
</tr>
</tbody>
</table>
