#practical exercises

# 1. Check Cholesterol level (using if)

cholesterol <- 230
if(cholesterol > 240){
  print("High Cholesterol")
}

# 2. Blood Pressure Status (using if...else)

Systolic_bp <- 130
if(Systolic_bp < 120){
  print("Blood Pressure is normal")
} else {
  print("Blood Pressure is high")
}

# 3. Automating Data Type Conversion with for loop
patient_info <- read.csv(file.choose())
MetaData <- read.csv(file.choose())

str(patient_info)

# gender,smoker and diagnosis columns should be converted to factor type.
#patient_info
clean_data <- patient_info
clean_data
factor_cols <- c("gender","diagnosis","smoker")

for (col in factor_cols) {
  if(is.character(clean_data[[col]])){
     clean_data[[col]] <- as.factor(clean_data[[col]])  
  }
}
str(clean_data)
str(patient_info)

# 4. Converting Factors to Numeric Codes

binary_cols <- c("smoker") 
for (col in binary_cols) {
     clean_data[[col]] <- ifelse(clean_data[[col]] == "Yes", 1,0)
}
str(clean_data)
View(clean_data)
str(patient_info)

class(clean_data$smoker)  #change numeric into factor
clean_data$smoker <- as.factor(clean_data$smoker)
class(clean_data$smoker)  #Re-check data type
#MetaData
# gender and height columns should be converted to factor type.
clean_metaData <- MetaData
factor_meta <- c("gender","height")

for (col in factor_meta) {
  if(is.character(clean_metaData[[col]])){
    clean_metaData[[col]] <- as.factor(clean_metaData[[col]])  
  }
}
str(clean_metaData)
str(MetaData)

#re-level height column
clean_metaData$height <- factor(clean_metaData$height,
                                levels = c("Tall", "Medium", "Short"))
levels(clean_metaData$height)