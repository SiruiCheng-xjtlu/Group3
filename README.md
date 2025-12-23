# Group3: Heart Disease Prediction Toolkit

[![R-CMD-check](https://img.shields.io/badge/R--CMD--check-passing-brightgreen)](https://github.com/SiruiCheng/Group3)

## Overview
**Group3** is an R package designed for clinical heart disease risk assessment. It leverages a pre-trained Random Forest model to provide accurate predictions based on patient physiological data.

This package was developed and maintained by **Sirui Cheng**.

## Key Features
* **Ready-to-use Model**: Includes a serialized Random Forest model trained on clinical datasets.
* **Robust Prediction**: Built-in validation to ensure input data consistency.
* **Professional Documentation**: Full help files for all exported functions.

## Installation

You can install the development version of Group3 from your local directory:

# Quick Start
# Install devtools if you haven't already
install.packages("devtools")

# Install the package
devtools::install("path/to/your/Group3")

library(Group3)

# Load your clinical data (ensure column names match training features)
# Example patient data
patient_data <- data.frame(
  age = 58, sex = 1, cp = 2, trestbps = 130, 
  chol = 240, fbs = 0, restecg = 1, thalach = 155, 
  exang = 0, oldpeak = 1.5, slope = 1, ca = 0, thal = 2
)

# Execute prediction
prediction <- predict_heart_disease(patient_data, type = "class")
print(prediction)



Author
Sirui Cheng XJTLU (Xi'an Jiaotong-Liverpool University) Email: Sirui.Cheng23@student.xjtlu.edu.cn

License
This project is licensed under the MIT License - see the LICENSE file for details.
