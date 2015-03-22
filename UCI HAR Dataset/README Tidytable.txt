==================================================================
Tidying the Human Activity Recognition Using Smartphones Dataset
==================================================================
Kevin O'Leary
==================================================================

The goal of this project is to merge and label raw movement data so as to create a tidy data set with the average of each variable for each activity and each volunteer.

The raw data must first be downloaded from here -https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip and unzipped.
The required data, column and row names for the proposed tidy data frame are in three separate folders.

Setting the working directory to the containing UCI HAR Dataset folder allows sub-directory files to be read using the "./" syntax. 

The observations are horizontally split between the 'train' and 'test' folders so the files in each must be appended, using rbind, to create three complete data frames. 

The second column of the "features.txt file" contains the header labels for the movement data and this column needs to be isolated and transposed. Transposing converts the column into a character vector which prepares it for use in the colnames function. The header labels must first be coerced by the make.names function into syntactically valid column names. The colnames function then renames the movement, volunteer and activity data frames. 

ID columns are then added to each data frame to allow vertical merging by the id column. The volunteer and activity columns are first merged and the result is then merged with the movement data. 

The merged data is then converted to a tbl to select the volunteer, activity columns along with columns headers containing ".mean." and standard deviation("std"). The mean columns are differentiated from meanFreq, tBodyAccMean and similar by the addition of dots in the contains function. These dots were introduced by the make.names function earlier. 

The activity_labels.txt file contains the activity types along with a key column. The integers in the activity column of the tbl are then converted to text by matching the key in both data frames and replacing the id with the matched text. 

The data frame is now ready to find the average of each variable for each activity and each volunteer. The data frame is first grouped by volunteer and activity columns then the mean function is applied to the remaining columns. Grouping variables are always excluded from the summarise_each modification. 
Write table without row names. 

The table can be read by inputting the following code into R; tablecheck = read.table("./tidytable.txt", header=TRUE).

For each record it is provided:
======================================

- An identifier of the subject who carried out the experiment.
- Its activity label. 
- A 66-feature vector with the average of time and frequency domain variables. 

The dataset includes the following files:
=========================================

- 'README Tidytable.txt'

- 'Codebook.md': Shows information about the project, description of the variables, guide to create data

- 'run_analysis.R': Downloads data and produces tidy data frame
