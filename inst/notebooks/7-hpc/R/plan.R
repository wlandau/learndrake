plan <- drake_plan(
  data = read_csv(
    file_in("../data/customer_churn.csv"),
    col_types = cols()
  ) %>%
    initial_split(prop = 0.3),
  rec = prepare_recipe(data),
  model = target(
    train_model(data, rec, batch_size = batch_size_, epochs = 32),
    format = "keras",
    transform = map(batch_size_ = c(16, 32))
  ),
  conf = target(
    confusion_matrix(data, rec, model),
    transform = map(model)
  ),
  metrics = target(
    compare_models(conf),
    transform = combine(conf)
  ),
  report_step = target(
    rmarkdown::render(
      input = knitr_in("churn-results.Rmd"),
      output_file = file_out("churn-results.html"),
      quiet = TRUE
    ),
    hpc = FALSE # Run the report locally instead of on a parallel worker.
  )
)
