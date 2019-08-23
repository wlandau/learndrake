app <- ShinyDriver$new("../index.Rmd", seed = 0)
app$snapshotInit("open")

app$snapshot()
