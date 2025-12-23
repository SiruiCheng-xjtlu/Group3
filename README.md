Group3: Heart Disease Prediction Toolkit
1. Overview
Group3 is a specialized R package developed by Sirui Cheng (XJTLU). It provides a robust, automated interface for predicting heart disease risk using a pre-trained Random Forest model.

The package is engineered to handle common data inconsistencies, making it a reliable tool for both developers and clinical researchers.

2. Key Technical Features
Smart Data Alignment: Automatically detects and harmonizes input types. It converts raw data into the specific Numeric or Factor formats required by the underlying model.

Zero-Config Prediction: Users can input categorical variables as simple text strings (e.g., "M", "Flat") without manually managing factor levels or encoding.

Validation Engine: Ensures all 11 critical clinical parameters are present before execution to prevent runtime errors.


3. Installation
You can install the development version of Group3 from your local directory using devtools:

# Install dependency if missing
if (!require("devtools")) install.packages("devtools")

# Install the package
devtools::install("path/to/your/Group3")


4. Quick Start Guide
The primary function predict_heart_disease() manages the entire pipeline—from data cleaning to final risk assessment.

Usage Example

library(Group3)

# 1. Define patient data (Strings are handled automatically)
test_patient <- data.frame(
    Age            = 50, 
    Sex            = "M",      # Options: "F", "M"
    ChestPainType  = "ATA",    # Options: "ASY", "ATA", "NAP", "TA"
    RestingBP      = 140,
    Cholesterol    = 230, 
    FastingBS      = "0",      # Options: "0", "1"
    RestingECG     = "Normal", # Options: "LVH", "Normal", "ST"
    MaxHR          = 150, 
    ExerciseAngina = "N",      # Options: "N", "Y"
    Oldpeak        = 1.0, 
    ST_Slope       = "Up"      # Options: "Down", "Flat", "Up"
)

# 2. Generate Prediction
# Result: 0 (Low Risk / Healthy) or 1 (Heart Disease Risk)
prediction <- predict_heart_disease(test_patient)
print(prediction)

5. Required Clinical Features

Variable	             Description	                Type
Age	                 Age of the patient	            Numeric
Sex	                   Gender (F/M)	                Factor
ChestPainType        Type of chest pain	            Factor
RestingBP	           Resting blood pressure	        Numeric
Cholesterol	         Serum cholesterol	            Numeric
FastingBS	      Fasting blood sugar > 120 mg/dl	    Factor
RestingECG	   Resting electrocardiogram results	  Factor
MaxHR	Maximum       heart rate achieved	            Numeric
ExerciseAngina	    Exercise-induced angina	        Factor
Oldpeak        ST depression induced by exercise	  Numeric
ST_Slope	The slope of the peak exercise ST segment	Factor


6. Author & Contact
Author: Sirui Cheng

Affiliation: Xi'an Jiaotong-Liverpool University (XJTLU)

Email: Sirui.Cheng23@student.xjtlu.edu.cn

7. License
This project is licensed under the MIT License.

