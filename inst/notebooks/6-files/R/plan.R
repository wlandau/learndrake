plan <- drake_plan(
  data = read_csv(
    file_in("../data/customer_churn.csv"),
    col_types = cols()
  ) %>%
    initial_split(prop = 0.3),
  rec = prepare_recipe(data),
  # Name this target `progression` instead of `model`:
  model = target(
    # Set `model_file = file_out("model.h5")` in the call to train_model().
    train_model(rec),
    # The target value is no longer a model, so remove `format = "keras"`.
    format = "keras"
  ),
  # Replace `model` with `file_in("model.h5")`:
  conf = confusion_matrix(data, rec, model),
  metrics = compare_models(conf)
)
