#install libraries 
#library tidyverse
library("ggplot2")
#read the dataset
dataset <- read_csv("pima-data-orig.csv")

print(dataset)

qplot(dataset$glucose_conc, dataset$bmi)
qplot(glucose_conc, bmi, data = dataset, color = diastolic_bp)

qplot(dataset$glucose_conc, geom = "histogram", color = "red")