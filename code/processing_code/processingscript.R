###############################
# processing script
#
#this script loads the raw data, processes and cleans it 
#and saves it as Rds file in the processed_data folder

#load needed packages. make sure they are installed.
library(dplyr) #for data processing
library(here) #to set paths
library(tidyverse)

#path to data
#note the use of the here() package and not absolute paths
data_location <- here::here("data","raw_data","SympAct_Any_Pos.Rda")
rawdata <- readRDS(data_location)
#load data. 


#take a look at the data
dplyr::glimpse(rawdata)

#dataset is so small, we can print it to the screen.
#that is often not possible.
print(rawdata)

#Remove all variables that have Score or Total or FluA or FluB or Dxname or 
#Activity in their name. 


cleandata <- rawdata %>% dplyr::select(
  -contains("Score"),
  -contains("Total"),
  -contains("FluA"),
  -contains("FluB"),
  -contains("Dxname"),
  -contains("Activity")
)

#Also remove the variable Unique.Visit. 
cleandata <- cleandata %>% subset(select = -c(Unique.Visit))

#You should be left with 32 variables coding for presence or absence of 
#some symptom. Only one, temperature, is continuous. 
#Let's check this to confirm.

summary(cleandata)
#This checks out with the statement that only Temperature is continuous.
ncol(cleandata)
#Yes, there are 32. 

#A few have multiple categories. Remove any NA observations, there aren't many.

cleandata <- cleandata %>% drop_na()

#At the end of your (fairly short) cleaning process, you should end up with
#730 observations and 32 variables.

ncol(cleandata)
nrow(cleandata)

#And that's it! All clean.

# location to save file
save_data_location <- here::here("data","processed_data","processeddata.rds")

saveRDS(cleandata, file = save_data_location)


