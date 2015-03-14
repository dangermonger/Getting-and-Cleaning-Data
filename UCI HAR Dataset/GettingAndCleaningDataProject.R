setwd("C:/Users/Dangermonger/Documents/GitHub/Getting-and-Cleaning-Data")

fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip" 

download.file(fileUrl, destfile = "./getdata-projectfiles-FUCHI-HAR-Dataset.zip")

unzip("./getdata-projectfiles-FUCHI-HAR-Dataset.zip")

setwd("C:/Users/Dangermonger/Documents/GitHub/Getting-and-Cleaning-Data/UCI HAR Dataset")

acs <- read.csv("getdata-data-06pid.csv")