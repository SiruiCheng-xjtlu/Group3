#' Predict Heart Disease Risk (Enhanced Version)
#' 
#' @description 
#' This function utilizes a pre-trained Random Forest model developed by Sirui Cheng 
#' to predict heart disease risk. It automatically handles data type conversions 
#' (Factors) to ensure compatibility with the internal model requirements.
#'
#' @param new_data A data frame containing clinical features. 
#' @param type Character. The type of prediction: "class" for category or "prob" for probability.
#'
#' @return A vector of predictions or a matrix of class probabilities.
#' 
#' @import randomForest
#' @importFrom stats predict
#' @export
#'
#' @examples
#' \dontrun{
#' # Example usage:
#' library(Group3)
#' # results <- predict_heart_disease(your_data)
#' }
predict_heart_disease <- function(new_data, type = "class") {
  
  # 1. Locate the model file within the package
  model_path <- system.file("extdata", "heart_rf_model.rds", package = "Group3")
  
  if (model_path == "") {
    stop("Error: 'heart_rf_model.rds' not found. Please reinstall the 'Group3' package.")
  }
  
  # 2. Load the model
  model <- readRDS(model_path)
  
  # 3. Robust Fix: Automatic Factor Level Alignment
  # Random Forest requires the factor levels of input data to match the training data exactly.
  # We extract the levels from the trained model and apply them to the new data.
  train_types <- model$forest$xlevels
  
  for (col_name in names(train_types)) {
    if (col_name %in% names(new_data)) {
      # Convert column to factor using the specific levels stored in the model
      new_data[[col_name]] <- factor(new_data[[col_name]], levels = train_types[[col_name]])
    }
  }

  # 4. Input Validation for non-factor columns
  if (!is.data.frame(new_data)) {
    stop("Invalid input: 'new_data' must be a data frame.")
  }

  # 5. Execute Prediction
  message("Executing prediction for Sirui Cheng's Group3 Project...")
  return(stats::predict(model, newdata = new_data, type = type))
}
