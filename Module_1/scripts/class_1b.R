
#create working directory

getwd()

#organize project folder

dir.create("raw_data")
dir.create("clean_data")
dir.create("scripts")
dir.create("results")

#import csv file

data <- read.csv("C:/Users/dell/Downloads/Practice/patient_info.csv")
str(data)

#correct some data types in this dataset

#convert gender into factor first

data$gender_fac <- as.factor(data$gender)
str(data)

#convert into numeric factor using if conditionals 

data$gender_num <- ifelse(data$gender_fac == "Female", 1, 0)
class(data$gender_num)

#convert back into factor
data$gender_num <- as.factor(data$gender_num)
class(data$gender_num)

#we want to relevel diagnosis so that normal becomes our reference for upcoming analysis

data$diagnosis_fac <- as.factor(data$diagnosis)
str(data)
data$diagnosis_fac <- factor(data$diagnosis_fac, levels= c("Normal", "Cancer"))
levels(data$diagnosis_fac)

#we might also give smoker numeric factor 

data$smoker_fac <- as.factor(data$smoker)
str(data)
data$smoker_num <- ifelse(data$smoker_fac == "Yes", 1, 0)
class(data$smoker_num)
data$smoker_num <- as.factor(data$smoker_num)
class(data$smoker_num)

#save as CSV format

write.csv(data, file = "clean_data/patient_info_clean.csv")

