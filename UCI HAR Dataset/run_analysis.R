setwd("C:/Users/Dangermonger/Documents/GitHub/Getting-and-Cleaning-Data/UCI HAR Dataset/train")

mydata = read.table("X_train.txt")
dim(mydata)
class(mydata)

volcol = read.table("subject_train.txt")
dim(volcol)

typeact = read.table("y_train.txt")
dim(typeact)

read all data into r
examine files to find id columns

merge (concatenate) the activity datasets, merge the (concatenate) the measurement datasets

