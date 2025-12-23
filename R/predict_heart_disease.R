#' Predict Heart Disease Risk (Final Stable Version)
#' 
#' @description 
#' A high-precision prediction interface for Sirui Cheng's heart disease 
#' research. Aligns all input types and factor levels automatically.
#'
#' @param new_data A data frame containing patient clinical features.
#' @param type Character. "class" for category or "prob" for probability.
#'
#' @return Prediction result (0 or 1).
#' @import randomForest
#' @importFrom stats predict
#' @export
predict_heart_disease <- function(new_data, type = "class") {
  
  # 1. Locate model file
  model_path <- system.file("extdata", "heart_rf_model.rds", package = "Group3")
  
  if (model_path == "") {
    stop("Error: 'heart_rf_model.rds' not found. Please reinstall the 'Group3' package.")
  }
  
  model <- readRDS(model_path)
  
  # 2. Extract model metadata
  var_names <- attr(model$terms, "term.labels")
  train_types <- model$forest$xlevels

  # 3. Comprehensive Data Alignment
  for (name in var_names) {
    if (!is.null(train_types[[name]])) {
      # For Categorical Variables: Ensure it's a Factor with correct levels
      new_data[[name]] <- factor(as.character(new_data[[name]]), 
                                 levels = train_types[[name]])
    } else {
      # For Numerical Variables: Ensure it's Numeric
      new_data[[name]] <- as.numeric(as.character(new_data[[name]]))
    }
  }

  # 4. Filter and Reorder columns to match training set
  new_data <- new_data[, var_names, drop = FALSE]

  message("Executing validated prediction for Sirui Cheng's Project...")
  
  # 5. Perform Prediction
  res <- stats::predict(model, newdata = new_data, type = type)
  return(res)
}
