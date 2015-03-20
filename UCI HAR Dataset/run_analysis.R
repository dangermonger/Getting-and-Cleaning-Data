##HOME -- setwd("C:/Users/Dangermonger/Documents/GitHub/Getting-and-Cleaning-Data/UCI HAR Dataset")
setwd("C:/Users/KOLeary/Documents/GitHub/Getting and Cleaning Data/UCI HAR Dataset")

library(plyr)
library(dplyr)

trainact = read.table("./train/y_train.txt") ##types of activities - train

testact = read.table("./test/y_test.txt") ##types of activities - test

trainvol = read.table("./train/subject_train.txt") ##volunteers - train

testvol = read.table("./test/subject_test.txt") ##volunteers - test
 
traindata = read.table("./train/X_train.txt") ##data - train

testdata = read.table("./test/X_test.txt") ##data - test

appendact <- rbind(trainact, testact) ##appended activity dataframes
appendvol <- rbind(trainvol, testvol) ##appended volunteer dataframes
appendata <- rbind(traindata, testdata) ##appended data dataframes

features = read.table("./features.txt", colClasses=c("NULL",NA)) ##reads only the second column of features
transpdata = t(features) ##transpose features into a character list
datacols <- make.names(datacols, unique = TRUE, allow_ = TRUE) ##coerces list into valid column names

colnames(appendata) <- datacols ##changes colnames of appendata to  datacols list
colnames(appendvol) <- "Volunteer_ID" ##change column name
colnames(appendact) <- "Activity_ID" ##change column name

actid = mutate(appendact, id=1:10299) ##add id column
volid = mutate(appendvol, id=1:10299) ##add id column
dataid = mutate(appendata, id=1:10299) ##add id column

merge1 = merge(actid, volid,by.x="id",by.y="id",all=TRUE) ##merge activity and volunteer dataframes
merge2 = merge(merge1, dataid,by.x="id",by.y="id",all=TRUE) ##merge data and merged dataframes

convertbl <- tbl_df(merge2) ## convert table to tbl
rm("merge2") ## remove other handle
meanstdtbl <- select(convertbl, Volunteer_ID, Activity_ID, contains("mean"), contains("std")) ##Extracts only the measurements on the mean and standard deviation for each measurement. 


Uses descriptive activity names to name the activities in the data set
From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.



bob <- data.frame(bob = c(1,2,3,4,5), id = 1:5)
tom <- data.frame(tom = c(5,6,7,8,9), id = 1:5)

merge1 <- merge(bob, tom, by.x = "id", by.y ="id", all = TRUE) ##merge side by side

bob <- data.frame(V1 = c(1,2,3,4,5))
tom <- data.frame(V1 = c(5,6,7,8,9))

rbindtest <- rbind(bob, tom) ##append end to end

headernames = c("first", "second")
headernames = data.frame(X1 = c("first", "second"))


colnames(rbindtest) <- headernames ## changes colnames to list



