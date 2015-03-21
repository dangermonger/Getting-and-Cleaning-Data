## Project Description

The raw data in this project comprises volunteer(subject_train.txt, subject_test.txt), activity (y_train.txt, y_test.txt) and movement(X-train.txt, X-test.txt)datasets which are separated into train and test folders. Activity(activity_labels.txt)and feature(features.txt)labels are to be found in the UCI HAR Dataset folder. The goal of this project is to merge and label raw movement data so as to create a tidy data set with the average of each variable for each activity and each volunteer. 

## Collection of the raw data

Data for the project were collected from the Coursera website

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

## Guide to create the tidy data file

1. Download data
2. Load dplyr package
3. Read files into R
4. Append test files to train files
5. Transpose feature labels list into a valid list of column names
6. Change data column labels to features list
7. Change volunteer and activity column labels
8. Add id columns to activity, volunteer and data datasets
9. Merge activity and volunteer data frames
10. Merge data and merged data frames
11. Convert merged data frame to tbl
12. Subset data by column headers that contain ".mean." and "std".
13. Convert activity ids in data frame to activity labels
14. Group resultant table by chosen columns then apply mean function to remaining columns
15. Write table to txt file.

## Cleaning of the data

THIS WILL ACTUALLY GO IN THE README AS A DETAILED DESCRIPTION OF WHAT THE SCRIPT DOES
The required data, column and row names for the proposed data frame are in three separate folders. Setting the working directory to the containing UCI HAR Dataset folder allows sub-directory files to be read using the "./" syntax. 
The observations are horizontally split between the 'train' and 'test' folders so the files in each must be appended, using rbind, to create three complete data frames. 
The second column of the "features.txt file" contains the header labels for the movement data and this column needs to be isolated and transposed. Transposing converts the column into a character vector which prepares it for use in the colnames function. The header labels must first be coerced by the make.names function into syntactically valid column names. The colnames function then renames the movement, volunteer and activity data frames. 
ID columns are then added to each data frame to allow vertical merging by the id column. The volunteer and activity columns are first merged and the result is then merged with the movement data. 
The merged data is then converted to a tbl to select the volunteer, activity columns along with columns headers containing ".mean." and standard deviation("std"). The mean columns are differentiated from meanFreq, tBodyAccMean and similar by the addition of dots in the contains function. These dots were introduced by the make.names function earlier. 
The activity_labels.txt file contains the activity types along with a key column. The integers in the activity column of the tbl are then converted to text by matching the key in both data frames and replacing the id with the matched text. 
The data frame is now ready to find the average of each variable for each activity and each volunteer. First group the data frame by volunteer and activity columns then apply the mean function to the remaining columns. Grouping variables are always excluded from the summarise_each modification. 
Write table without row names.

[link to the readme document that describes the code in greater detail]()

## Description of the variables in the tidytable.txt file

General description of the file including:

Dimensions of the dataset
Summary of the data
Variables present in the dataset
(you can easily use Rcode for this, just load the dataset and provide the information directly form the tidy data file)

Variable 1 (repeat this section for all variables in the dataset)

Short description of what the variable describes.

tablecheck = read.table("./tidytable.txt", header=TRUE)


Some information on the variable including:

Class of the variable
Unique values/levels of the variable
Unit of measurement (if no unit of measurement list this as well)
In case names follow some schema, describe how entries were constructed (for example time-body-gyroscope-z has 4 levels of descriptors. Describe these 4 levels).
(you can easily use Rcode for this, just load the dataset and provide the information directly form the tidy data file)


