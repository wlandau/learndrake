# nolint start
app <- ShinyDriver$new("../", seed = 0)
app$snapshotInit("open")

app$setInputs(table_rows_current = c(1, 2, 3, 4, 5, 6, 7, 8, 9, 10), allowInputNoBinding_ = TRUE)
app$setInputs(table_rows_all = c(1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14), allowInputNoBinding_ = TRUE)
app$snapshot()
# nolint end
