library(rsconnect)
remotes::install_github("wlandau/drakeplanner")
message("Setting account info.")
setAccountInfo(
  name   = Sys.getenv("shinyapps_name"),
  token  = Sys.getenv("shinyapps_token"),
  secret = Sys.getenv("shinyapps_secret")
)
message("Deploying to shinyapps.io.")
for (app in c("learndrakechanges", "learndrakestatic")) {
  message("Deploying ", app, " to shinyapps.io.")
  deployApp(
    appDir = file.path("inst", "tutorials", app),
    appName = app,
    forceUpdate = TRUE
  )
}
