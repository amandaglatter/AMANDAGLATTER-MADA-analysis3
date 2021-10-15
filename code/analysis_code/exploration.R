

#Load libraries
library(tidyverse)
library(dplyr)

#Locate file
data_location <- here::here("data","processed_data","processeddata.rds")
data <- readRDS(data_location)

#Main continuous outcome: Body temperature (BodyTemp)
#Main categorical outcome: Nausea
#I am going to arbitrarily select other columns that may predict these outcomes.
#Fatigue
#SubjectiveFever
#Pharyngitis
#CoughYN (categorical)
#SwollenLymphNodes

#For each (important) variable, produce and print some numerical
#output (e.g. a table or some summary statistics numbers).









For each (important) continuous variable, create a histogram or density plot.
Create scatterplots or boxplots or similar such plots for the variable you decided is your main outcome of interest and the most important (or all depending on number of variables) independent variables/predictors. For this dataset, you can pick and choose a few predictor variables.
If applicable to your data, make some pairwise correlation plots. (Not applicable here)
If needed for your data, explore the pattern of missing values. (Not applicable here)
Any other exploration steps that might be useful.


data %>% glimpse(BodyTemp)
