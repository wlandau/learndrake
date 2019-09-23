plan <- drake_plan(
  data = read_csv(
    file_in("../data/customer_churn.csv"),
    col_types = cols()
  ) %>%
    initial_split(prop = 0.3),
  rec = prepare_recipe(data),
  model = target(
    train_model(rec, units1 = u1),
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
)
