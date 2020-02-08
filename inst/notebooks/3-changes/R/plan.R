plan <- drake_plan(
  churn_data = split_data(file_in("../data/customer_churn.csv")),
  churn_recipe = prepare_recipe(churn_data), 
  run_relu = test_model(act1 = "relu", churn_data, churn_recipe),
  run_sigmoid = test_model(act1 = "sigmoid", churn_data, churn_recipe),
  run_softmax = test_model(act1 = "softmax", churn_data, churn_recipe),
  best_run = rbind(run_relu, run_sigmoid, run_softmax) %>%
    filter(accuracy == max(accuracy)),
  best_model = target(
    train_best_model(best_run, churn_recipe),
    format = "keras"
  )
)
