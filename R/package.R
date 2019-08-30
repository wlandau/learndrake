#' learndrake: materials to learn
#' machine learning workflow management with drake
#' @docType package
#' @description Machine learning workflows can be difficult to manage.
#'   A single round of computation can take several hours to complete,
#'   and routine updates to the code and data tend to invalidate
#'   hard-earned results. You can enhance the maintainability, hygiene,
#'   speed, scale, and reproducibility of such projects with
#'   the drake R package. drake resolves the dependency structure
#'   of your analysis pipeline, skips tasks that are already up to date,
#'   executes the rest with optional distributed computing,
#'   and organizes the output so you rarely have to think about data files.
#'   The slides, notebooks, and Shiny apps in this package
#'   teach how to create and maintain machine
#'   learning projects with drake-powered automation.
#' @name learndrake-package
#' @aliases learndrake
#' @author William Michael Landau \email{will.landau@@gmail.com}
#' @examples
#' \dontrun{
#' view_slides()
#' write_tutorials()
#' launch_app("flow")
#' launch_app("plans")
#' launch_app("drakeplanner")
#' }
#' @references <https://github.com/wlandau/learndrake>
#' @importFrom clustermq Q
#' @importFrom drake drake_plan vis_drake_graph make
#' @importFrom drakeplanner drakeplanner
#' @importFrom future plan future
#' @importFrom future.callr callr
#' @importFrom fs dir_copy
#' @importFrom keras compile fit
#' @importFrom learnr run_tutorial
#' @importFrom lubridate duration dseconds
#' @importFrom recipes bake juice
#' @importFrom rmarkdown render run
#' @importFrom rsample initial_split testing training
#' @importFrom shiny shinyApp
#' @importFrom styler style_text
#' @importFrom tensorflow install_tensorflow
#' @importFrom tidyverse tidyverse_packages
#' @importFrom visNetwork visNetwork
#' @importFrom yardstick conf_mat
#' @importFrom utils browseURL
NULL
