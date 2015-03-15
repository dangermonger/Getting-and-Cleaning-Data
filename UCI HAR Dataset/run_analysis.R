setwd("C:/Users/Dangermonger/Documents/GitHub/Getting-and-Cleaning-Data/UCI HAR Dataset/train")
scanX <- scan("X_train.txt", character(0))
readX <- readLines("X_train.txt")
dim(readX)

read all data into r
examine files to find id columns

merge (concatenate) the activity datasets, merge the (concatenate) the measurement datasets

- 'train/subject_train.txt': Each row identifies the subject who performed the activity  

- 'train/X_train.txt': Training set.

- 'train/y_train.txt': Training labels.


'train/subject_test.txt': Each row identifies the subject who performed the activity  

- 'test/X_test.txt': Test set.

- 'test/y_test.txt': Test labels.

30 voluteers 
6 activities WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING
3-axial linear acceleration and 3-axial angular velocity recorded
dataframe partioned into 