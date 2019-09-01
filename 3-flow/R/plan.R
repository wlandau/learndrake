plan <- drake_plan(
  metrics = compare_models(conf),
  rec = prepare_recipe(data),
  model = target(
    train_model(rec),
    format = "keras"
  ),
  conf = confusion_matrix(data, rec, model),
  data = read_csv(
    file_in("../data/customer_churn.csv"),
    col_types = cols()
  ) %>%
    initial_split(prop = 0.3)
)
