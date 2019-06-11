prepare_recipe <- function(data) {
  data %>%
    training() %>%
    recipe(Churn ~ .) %>%
    step_rm(customerID) %>%
    step_naomit(all_outcomes(), all_predictors()) %>%
    step_discretize(tenure, options = list(cuts = 6)) %>%
    step_log(TotalCharges) %>%
    step_mutate(Churn = ifelse(Churn == "Yes", 1, 0)) %>%
    step_dummy(all_nominal(), -all_outcomes()) %>%
    step_center(all_predictors(), -all_outcomes()) %>%
    step_scale(all_predictors(), -all_outcomes()) %>%
    prep()
}

define_model <- function(rec, units1, units2, act1, act2, act3) {
  input_shape <- ncol(
    juice(rec, all_predictors(), composition = "matrix")
  )
  keras_model_sequential() %>%
    layer_dense(
      units = units1,
      kernel_initializer = "uniform",
      activation = act1,
      input_shape = input_shape
    ) %>%
    layer_dropout(rate = 0.1) %>%
    layer_dense(
      units = units2,
      kernel_initializer = "uniform",
      activation = act2
    ) %>%
    layer_dropout(rate = 0.1) %>%
    layer_dense(
      units = 1,
      kernel_initializer = "uniform",
      activation = act3
    )
}

train_model <- function(
  data,
  rec,
  units1 = 16,
  units2 = 16,
  act1 = "relu",
  act2 = "relu",
  act3 = "sigmoid"
) {
  model <- define_model(
    rec = rec,
    units1 = units1,
    units2 = units2,
    act1 = act1,
    act2 = act2,
    act3 = act3
  )
  compile(
    model,
    optimizer = "adam",
    loss = "binary_crossentropy",
    metrics = c("accuracy")
  )
  x_train_tbl <- juice(
    rec,
    all_predictors(),
    composition = "matrix"
  )
  y_train_vec <- juice(rec, all_outcomes()) %>%
    pull()
  fit(
    object = model,
    x = x_train_tbl,
    y = y_train_vec,
    batch_size = 32,
    epochs = 32,
    validation_split = 0.3,
    verbose = 0
  )
  serialize_model(model)
}

confusion_matrix <- function(data, rec, serialized_model) {
  model <- unserialize_model(serialized_model)
  testing_data <- bake(rec, testing(data))
  x_test_tbl <- testing_data %>%
    select(-Churn) %>%
    as.matrix()
  y_test_vec <- testing_data %>%
    select(Churn) %>%
    pull()
  yhat_keras_class_vec <- model %>%
    predict_classes(x_test_tbl) %>%
    as.factor() %>%
    fct_recode(yes = "1", no = "0")
  yhat_keras_prob_vec <-
    model %>%
    predict_proba(x_test_tbl) %>%
    as.vector()
  test_truth <- y_test_vec %>%
    as.factor() %>%
    fct_recode(yes = "1", no = "0")
  estimates_keras_tbl <- tibble(
    truth = test_truth,
    estimate = yhat_keras_class_vec,
    class_prob = yhat_keras_prob_vec
  )
  estimates_keras_tbl %>%
    conf_mat(truth, estimate)
}

compare_models <- function(...) {
  name <- match.call()[-1] %>%
    as.character()
  df <- map_df(list(...), summary) %>%
    filter(.metric %in% c("accuracy", "sens", "spec")) %>%
    mutate(name = rep(name, each = n() / length(name))) %>%
    rename(metric = .metric, estimate = .estimate)
  ggplot(df) +
    geom_line(aes(x = metric, y = estimate, color = name, group = name)) +
    theme_gray(24)
}
