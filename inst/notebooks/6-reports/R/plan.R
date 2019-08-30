plan <- drake_plan(
  data = read_csv(
    file_in("../data/customer_churn.csv"),
    col_types = cols()
  ) %>%
    initial_split(prop = 0.3),
  rec = prepare_recipe(data),
  model = target(
    train_model(data, rec, units1 = u1),
    format = "keras",
    transform = map(u1 = c(16, 32, 64))
  ),
  conf = target(
    confusion_matrix(data, rec, model),
    transform = map(model)
  ),
  metrics = target(
    compare_models(conf),
    transform = combine(conf)
  )
  # Exercise: insert a report_step target with a call to rmarkdown::render().
  # Use knitr_in() and file_out() to declare churn-results.Rmd
  # and the HTML output as a dependency file and an output file, respectively.
)
