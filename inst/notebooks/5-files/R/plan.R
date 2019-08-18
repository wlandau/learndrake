plan <- drake_plan(
  data = read_csv(
    file_in("../data/customer_churn.csv"),
    col_types = cols()
  ) %>%
    initial_split(prop = 0.3),
  rec = prepare_recipe(data),
  model = target( # Name this target `progression` instead of `model`.
  	train_model(data, rec), # Set `model_file = file_out("model.h5")` in the call to train_model().
  	format = "keras" # The target value is no longer a model, so remove this line with the format.
  ),
  # Replace `model` with `file_in("model.h5")`:
  conf = confusion_matrix(data, rec, model),
  metrics = compare_models(conf)
)