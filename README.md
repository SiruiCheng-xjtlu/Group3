# Group3: Heart Disease Prediction Toolkit

[![R-CMD-check](https://img.shields.io/badge/R--CMD--check-passing-brightgreen)](https://github.com/SiruiCheng-xjtlu/Group3)

## Overview
**Group3** is a professional R package developed by **Sirui Cheng**. It provides a robust interface for predicting heart disease risk using a pre-trained Random Forest model. The package is specifically designed for clinical research, ensuring that physiological data is accurately processed and analyzed.

## Key Features
* **Automated Type Alignment**: The package automatically detects and converts input data into the exact Numeric or Factor formats required by the model.
* **High Tolerance**: Users can input categorical data as simple strings (e.g., "M", "Flat") without manually defining factor levels.
* **Clinical Precision**: Validates 11 core physiological features to ensure prediction consistency.

## Installation

To install the package from your local source directory:

# Ensure devtools is installed
if (!require("devtools")) install.packages("devtools")

# Install from local path
devtools::install("path/to/your/Group3")


# Quick Start
The primary function predict_heart_disease handles the entire pipeline from data validation to final prediction. Ensure your input data frame uses the correct feature names (PascalCase).
library(Group3)

# Prepare patient data (Strings are automatically handled)
test_patient <- data.frame(
    Age = 50, 
    Sex = "M",                 # Options: "F", "M"
    ChestPainType = "ATA",     # Options: "ASY", "ATA", "NAP", "TA"
    RestingBP = 140,
    Cholesterol = 230, 
    FastingBS = "0",           # Options: "0", "1"
    RestingECG = "Normal",     # Options: "LVH", "Normal", "ST"
    MaxHR = 150, 
    ExerciseAngina = "N",      # Options: "N", "Y"
    Oldpeak = 1.0, 
    ST_Slope = "Up"            # Options: "Down", "Flat", "Up"
)

# Execute prediction
# Result 0 = Healthy / Low Risk, 1 = Heart Disease Risk
prediction <- predict_heart_disease(test_patient)
print(prediction)

Required Features
To ensure successful prediction, the input data frame must contain the following 11 variables:

Age, Sex, ChestPainType, RestingBP, Cholesterol

FastingBS, RestingECG, MaxHR, ExerciseAngina, Oldpeak, ST_Slope

Author
Sirui Cheng Xi'an Jiaotong-Liverpool University (XJTLU)

Email: Sirui.Cheng23@student.xjtlu.edu.cn

License
This project is licensed under the MIT License.
