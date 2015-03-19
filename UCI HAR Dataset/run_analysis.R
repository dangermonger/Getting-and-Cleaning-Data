setwd("C:/Users/Dangermonger/Documents/GitHub/Getting-and-Cleaning-Data/UCI HAR Dataset/train")

library(plyr)
library(dplyr)

xtrain = read.table("X_train.txt") ##read training dataframe 
xtrainid = mutate(xtrain,id=1:7352) ##add an id column

voluncol = read.table("subject_train.txt") ##read volunteer identifying dataframe 
volunid = mutate(voluncol,id=1:7352) ##add an id column

typeact = read.table("y_train.txt") ##read activity type dataframe 
typeactid = mutate(typeact,id=1:7352) ##add an id column

merge1 = merge(typeactid, volunid,by.x="id",by.y="id",all=TRUE)

merge2 = merge(merge1, xtrainid, by.x = 'id', by.y="id", all=TRUE)


merge (concatenate) the activity datasets, merge the (concatenate) the measurement datasets

