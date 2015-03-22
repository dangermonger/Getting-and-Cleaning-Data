setwd("C:/Users/Dangermonger/Documents/GitHub/Getting-and-Cleaning-Data")

fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip" 

download.file(fileUrl, destfile = "./getdata-projectfiles-FUCHI-HAR-Dataset.zip")

unzip("./getdata-projectfiles-FUCHI-HAR-Dataset.zip")

setwd("C:/Users/Dangermonger/Documents/GitHub/Getting-and-Cleaning-Data/UCI HAR Dataset")

library(dplyr) ##load dplyr package

trainact = read.table("./train/y_train.txt") ##types of activities - train

testact = read.table("./test/y_test.txt") ##types of activities - test

trainvol = read.table("./train/subject_train.txt") ##volunteers - train

testvol = read.table("./test/subject_test.txt") ##volunteers - test
 
traindata = read.table("./train/X_train.txt") ##data - train

testdata = read.table("./test/X_test.txt") ##data - test

activities = read.table("./activity_labels.txt") ##activity labels

appendact <- rbind(trainact, testact) ##append activity data frames
appendvol <- rbind(trainvol, testvol) ##append volunteer data frames
appendata <- rbind(traindata, testdata) ##append data data frames

features = read.table("./features.txt", colClasses=c("NULL",NA)) ##read only the second column of features
transpdata = t(features) ##transpose features into a character list
datacols <- make.names(transpdata, unique = TRUE, allow_ = TRUE) ##coerce list into valid column names

colnames(appendata) <- datacols ##change column names of appendata to  datacols list
colnames(appendvol) <- "Volunteer_ID" ##change column name
colnames(appendact) <- "Activity" ##change column name

actid = mutate(appendact, id=1:nrow(appendact)) ##add id column
volid = mutate(appendvol, id=1:nrow(appendvol)) ##add id column
dataid = mutate(appendata, id=1:nrow(appendata)) ##add id column

merge1 = merge(actid, volid,by.x="id",by.y="id",all=TRUE) ##merge activity and volunteer data frames
merge2 = merge(merge1, dataid,by.x="id",by.y="id",all=TRUE) ##merge dataid and merged data frames

convertbl <- tbl_df(merge2) ## convert data frame to tbl
rm("merge2") ## remove other handle
meanstdtbl <- select(convertbl, Volunteer_ID, Activity, contains(".mean."), contains("std")) ##extract only mean and standard deviation, not meanFreq etc..  

meanstdtbl[["Activity"]] <- activities[ match(meanstdtbl[['Activity']], activities[['V1']] ) , 'V2'] ##convert activity ids to activity labels

tidytable <- meanstdtbl %>% group_by(Volunteer_ID, Activity) %>% summarise_each(funs(mean)) ##group meansstdtbl by chosen columns then apply mean function to remaining columns 
write.table(tidytable, "tidytable.txt", row.names = FALSE) ##write tidytable to txt file


