#' Predict Heart Disease Risk
#'
#' @description
#' This function utilizes a pre-trained Random Forest model to predict
#' heart disease risk. Developed by Sirui Cheng.
#'
#' @param new_data A data frame containing clinical features.
#' @param type Character. "class" for category or "prob" for probability.
#'
#' @return A vector or matrix of predictions.
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

  # 1. Locate the model
  model_path <- system.file("extdata", "heart_rf_model.rds", package = "Group3")

  if (model_path == "") {
    stop("Error: 'heart_rf_model.rds' not found. Please reinstall 'Group3'.")
  }

  # 2. Load model
  model <- readRDS(model_path)

  # 3. Input Validation
  if (!is.data.frame(new_data)) {
    stop("Input 'new_data' must be a data frame.")
  }

  # 4. Dependency Check
  if (!requireNamespace("randomForest", quietly = TRUE)) {
    stop("Package 'randomForest' is required. Please install it.")
  }

  # 5. Prediction
  message("Prediction running for Sirui Cheng's Group3 Project...")
  return(stats::predict(model, newdata = new_data, type = type))
}
