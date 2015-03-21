## Project Description

The raw data in this project comprises volunteer, activity and movement datasets and is separated into train and test folders. Activity and feature labels are to be found in the UCI HAR Dataset folder. The goal of this project is to merge and label raw movement data so as to create a tidy data set with the average of each variable for each activity and each volunteer. 

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
9. Merge activity and volunteer dataframes
10. Merge data and merged dataframes
11. Convert merged dataframe to tbl
12. Subset columns that contain ".mean." and "std" text in names.
13. Convert activity ids to activity labels
14. Group resultant table by chosen columns then apply mean function to remaining columns
15. Write table to txt file.

## Cleaning of the data

Short, high-level description of what the cleaning script does. [link to the readme document that describes the code in greater detail]()

Description of the variables in the tiny_data.txt file

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

Notes on variable 1:

If available, some additional notes on the variable not covered elsewehere. If no notes are present leave this section out.

Sources

Sources you used if any, otherise leave out.

Annex

If you used any code in the codebook that had the echo=FALSE attribute post this here (make sure you set the results parameter to 'hide' as you do not want the results to show again)