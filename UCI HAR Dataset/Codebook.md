## Project Description

The raw data in this project comprises volunteer(subject_train.txt, subject_test.txt), activity (y_train.txt, y_test.txt) and movement(X-train.txt, X-test.txt)datasets which are separated into train and test folders. Activity(activity_labels.txt)and feature(features.txt)labels are to be found in the UCI HAR Dataset folder. The goal of this project is to merge and label raw movement data so as to create a tidy data set with the average of each variable for each activity and each volunteer. 

## Collection of the raw data

Data for the project were collected from the Coursera website:

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

Separated files are read and appended into three data frames. Column names are added. ID columns are added to allow merging between data frames. The resultant data frame is then converted to a tbl and the required columns are selected. The activity labels are matched with the tbl activity ids and replaced. The activity and volunteer columns are then grouped and the mean is then calculated for the remaining columns. Write tidy data frame. For more detailed information, please go to the [README]() for this project.

## Description of the variables in the tidytable.txt file

### Dimensions of the dataset :	
180 obs. of  68 variables

### Summary of the data
  Volunteer_ID                Activity  tBodyAcc.mean...X tBodyAcc.mean...Y  
 Min.   : 1.0   LAYING            :30   Min.   :0.2216    Min.   :-0.040514  
 1st Qu.: 8.0   SITTING           :30   1st Qu.:0.2712    1st Qu.:-0.020022  
 Median :15.5   STANDING          :30   Median :0.2770    Median :-0.017262  
 Mean   :15.5   WALKING           :30   Mean   :0.2743    Mean   :-0.017876  
 3rd Qu.:23.0   WALKING_DOWNSTAIRS:30   3rd Qu.:0.2800    3rd Qu.:-0.014936  
 Max.   :30.0   WALKING_UPSTAIRS  :30   Max.   :0.3015    Max.   :-0.001308  
 tBodyAcc.mean...Z  tGravityAcc.mean...X tGravityAcc.mean...Y tGravityAcc.mean...Z
 Min.   :-0.15251   Min.   :-0.6800      Min.   :-0.47989     Min.   :-0.49509    
 1st Qu.:-0.11207   1st Qu.: 0.8376      1st Qu.:-0.23319     1st Qu.:-0.11726    
 Median :-0.10819   Median : 0.9208      Median :-0.12782     Median : 0.02384    
 Mean   :-0.10916   Mean   : 0.6975      Mean   :-0.01621     Mean   : 0.07413    
 3rd Qu.:-0.10443   3rd Qu.: 0.9425      3rd Qu.: 0.08773     3rd Qu.: 0.14946    
 Max.   :-0.07538   Max.   : 0.9745      Max.   : 0.95659     Max.   : 0.95787    
 tBodyAccJerk.mean...X tBodyAccJerk.mean...Y tBodyAccJerk.mean...Z tBodyGyro.mean...X
 Min.   :0.04269       Min.   :-0.0386872    Min.   :-0.067458     Min.   :-0.20578  
 1st Qu.:0.07396       1st Qu.: 0.0004664    1st Qu.:-0.010601     1st Qu.:-0.04712  
 Median :0.07640       Median : 0.0094698    Median :-0.003861     Median :-0.02871  
 Mean   :0.07947       Mean   : 0.0075652    Mean   :-0.004953     Mean   :-0.03244  
 3rd Qu.:0.08330       3rd Qu.: 0.0134008    3rd Qu.: 0.001958     3rd Qu.:-0.01676  
 Max.   :0.13019       Max.   : 0.0568186    Max.   : 0.038053     Max.   : 0.19270  
 tBodyGyro.mean...Y tBodyGyro.mean...Z tBodyGyroJerk.mean...X tBodyGyroJerk.mean...Y
 Min.   :-0.20421   Min.   :-0.07245   Min.   :-0.15721       Min.   :-0.07681      
 1st Qu.:-0.08955   1st Qu.: 0.07475   1st Qu.:-0.10322       1st Qu.:-0.04552      
 Median :-0.07318   Median : 0.08512   Median :-0.09868       Median :-0.04112      
 Mean   :-0.07426   Mean   : 0.08744   Mean   :-0.09606       Mean   :-0.04269      
 3rd Qu.:-0.06113   3rd Qu.: 0.10177   3rd Qu.:-0.09110       3rd Qu.:-0.03842      
 Max.   : 0.02747   Max.   : 0.17910   Max.   :-0.02209       Max.   :-0.01320      
 tBodyGyroJerk.mean...Z tBodyAccMag.mean.. tGravityAccMag.mean.. tBodyAccJerkMag.mean..
 Min.   :-0.092500      Min.   :-0.9865    Min.   :-0.9865       Min.   :-0.9928       
 1st Qu.:-0.061725      1st Qu.:-0.9573    1st Qu.:-0.9573       1st Qu.:-0.9807       
 Median :-0.053430      Median :-0.4829    Median :-0.4829       Median :-0.8168       
 Mean   :-0.054802      Mean   :-0.4973    Mean   :-0.4973       Mean   :-0.6079       
 3rd Qu.:-0.048985      3rd Qu.:-0.0919    3rd Qu.:-0.0919       3rd Qu.:-0.2456       
 Max.   :-0.006941      Max.   : 0.6446    Max.   : 0.6446       Max.   : 0.4345       
 tBodyGyroMag.mean.. tBodyGyroJerkMag.mean.. fBodyAcc.mean...X fBodyAcc.mean...Y 
 Min.   :-0.9807     Min.   :-0.99732        Min.   :-0.9952   Min.   :-0.98903  
 1st Qu.:-0.9461     1st Qu.:-0.98515        1st Qu.:-0.9787   1st Qu.:-0.95361  
 Median :-0.6551     Median :-0.86479        Median :-0.7691   Median :-0.59498  
 Mean   :-0.5652     Mean   :-0.73637        Mean   :-0.5758   Mean   :-0.48873  
 3rd Qu.:-0.2159     3rd Qu.:-0.51186        3rd Qu.:-0.2174   3rd Qu.:-0.06341  
 Max.   : 0.4180     Max.   : 0.08758        Max.   : 0.5370   Max.   : 0.52419  
 fBodyAcc.mean...Z fBodyAccJerk.mean...X fBodyAccJerk.mean...Y fBodyAccJerk.mean...Z
 Min.   :-0.9895   Min.   :-0.9946       Min.   :-0.9894       Min.   :-0.9920      
 1st Qu.:-0.9619   1st Qu.:-0.9828       1st Qu.:-0.9725       1st Qu.:-0.9796      
 Median :-0.7236   Median :-0.8126       Median :-0.7817       Median :-0.8707      
 Mean   :-0.6297   Mean   :-0.6139       Mean   :-0.5882       Mean   :-0.7144      
 3rd Qu.:-0.3183   3rd Qu.:-0.2820       3rd Qu.:-0.1963       3rd Qu.:-0.4697      
 Max.   : 0.2807   Max.   : 0.4743       Max.   : 0.2767       Max.   : 0.1578      
 fBodyGyro.mean...X fBodyGyro.mean...Y fBodyGyro.mean...Z fBodyAccMag.mean..
 Min.   :-0.9931    Min.   :-0.9940    Min.   :-0.9860    Min.   :-0.9868   
 1st Qu.:-0.9697    1st Qu.:-0.9700    1st Qu.:-0.9624    1st Qu.:-0.9560   
 Median :-0.7300    Median :-0.8141    Median :-0.7909    Median :-0.6703   
 Mean   :-0.6367    Mean   :-0.6767    Mean   :-0.6044    Mean   :-0.5365   
 3rd Qu.:-0.3387    3rd Qu.:-0.4458    3rd Qu.:-0.2635    3rd Qu.:-0.1622   
 Max.   : 0.4750    Max.   : 0.3288    Max.   : 0.4924    Max.   : 0.5866   
 fBodyBodyAccJerkMag.mean.. fBodyBodyGyroMag.mean.. fBodyBodyGyroJerkMag.mean..
 Min.   :-0.9940            Min.   :-0.9865         Min.   :-0.9976            
 1st Qu.:-0.9770            1st Qu.:-0.9616         1st Qu.:-0.9813            
 Median :-0.7940            Median :-0.7657         Median :-0.8779            
 Mean   :-0.5756            Mean   :-0.6671         Mean   :-0.7564            
 3rd Qu.:-0.1872            3rd Qu.:-0.4087         3rd Qu.:-0.5831            
 Max.   : 0.5384            Max.   : 0.2040         Max.   : 0.1466            
 tBodyAcc.std...X  tBodyAcc.std...Y   tBodyAcc.std...Z  tGravityAcc.std...X
 Min.   :-0.9961   Min.   :-0.99024   Min.   :-0.9877   Min.   :-0.9968    
 1st Qu.:-0.9799   1st Qu.:-0.94205   1st Qu.:-0.9498   1st Qu.:-0.9825    
 Median :-0.7526   Median :-0.50897   Median :-0.6518   Median :-0.9695    
 Mean   :-0.5577   Mean   :-0.46046   Mean   :-0.5756   Mean   :-0.9638    
 3rd Qu.:-0.1984   3rd Qu.:-0.03077   3rd Qu.:-0.2306   3rd Qu.:-0.9509    
 Max.   : 0.6269   Max.   : 0.61694   Max.   : 0.6090   Max.   :-0.8296    
 tGravityAcc.std...Y tGravityAcc.std...Z tBodyAccJerk.std...X tBodyAccJerk.std...Y
 Min.   :-0.9942     Min.   :-0.9910     Min.   :-0.9946      Min.   :-0.9895     
 1st Qu.:-0.9711     1st Qu.:-0.9605     1st Qu.:-0.9832      1st Qu.:-0.9724     
 Median :-0.9590     Median :-0.9450     Median :-0.8104      Median :-0.7756     
 Mean   :-0.9524     Mean   :-0.9364     Mean   :-0.5949      Mean   :-0.5654     
 3rd Qu.:-0.9370     3rd Qu.:-0.9180     3rd Qu.:-0.2233      3rd Qu.:-0.1483     
 Max.   :-0.6436     Max.   :-0.6102     Max.   : 0.5443      Max.   : 0.3553     
 tBodyAccJerk.std...Z tBodyGyro.std...X tBodyGyro.std...Y tBodyGyro.std...Z
 Min.   :-0.99329     Min.   :-0.9943   Min.   :-0.9942   Min.   :-0.9855  
 1st Qu.:-0.98266     1st Qu.:-0.9735   1st Qu.:-0.9629   1st Qu.:-0.9609  
 Median :-0.88366     Median :-0.7890   Median :-0.8017   Median :-0.8010  
 Mean   :-0.73596     Mean   :-0.6916   Mean   :-0.6533   Mean   :-0.6164  
 3rd Qu.:-0.51212     3rd Qu.:-0.4414   3rd Qu.:-0.4196   3rd Qu.:-0.3106  
 Max.   : 0.03102     Max.   : 0.2677   Max.   : 0.4765   Max.   : 0.5649  
 tBodyGyroJerk.std...X tBodyGyroJerk.std...Y tBodyGyroJerk.std...Z tBodyAccMag.std..
 Min.   :-0.9965       Min.   :-0.9971       Min.   :-0.9954       Min.   :-0.9865  
 1st Qu.:-0.9800       1st Qu.:-0.9832       1st Qu.:-0.9848       1st Qu.:-0.9430  
 Median :-0.8396       Median :-0.8942       Median :-0.8610       Median :-0.6074  
 Mean   :-0.7036       Mean   :-0.7636       Mean   :-0.7096       Mean   :-0.5439  
 3rd Qu.:-0.4629       3rd Qu.:-0.5861       3rd Qu.:-0.4741       3rd Qu.:-0.2090  
 Max.   : 0.1791       Max.   : 0.2959       Max.   : 0.1932       Max.   : 0.4284  
 tGravityAccMag.std.. tBodyAccJerkMag.std.. tBodyGyroMag.std.. tBodyGyroJerkMag.std..
 Min.   :-0.9865      Min.   :-0.9946       Min.   :-0.9814    Min.   :-0.9977       
 1st Qu.:-0.9430      1st Qu.:-0.9765       1st Qu.:-0.9476    1st Qu.:-0.9805       
 Median :-0.6074      Median :-0.8014       Median :-0.7420    Median :-0.8809       
 Mean   :-0.5439      Mean   :-0.5842       Mean   :-0.6304    Mean   :-0.7550       
 3rd Qu.:-0.2090      3rd Qu.:-0.2173       3rd Qu.:-0.3602    3rd Qu.:-0.5767       
 Max.   : 0.4284      Max.   : 0.4506       Max.   : 0.3000    Max.   : 0.2502       
 fBodyAcc.std...X  fBodyAcc.std...Y   fBodyAcc.std...Z  fBodyAccJerk.std...X
 Min.   :-0.9966   Min.   :-0.99068   Min.   :-0.9872   Min.   :-0.9951     
 1st Qu.:-0.9820   1st Qu.:-0.94042   1st Qu.:-0.9459   1st Qu.:-0.9847     
 Median :-0.7470   Median :-0.51338   Median :-0.6441   Median :-0.8254     
 Mean   :-0.5522   Mean   :-0.48148   Mean   :-0.5824   Mean   :-0.6121     
 3rd Qu.:-0.1966   3rd Qu.:-0.07913   3rd Qu.:-0.2655   3rd Qu.:-0.2475     
 Max.   : 0.6585   Max.   : 0.56019   Max.   : 0.6871   Max.   : 0.4768     
 fBodyAccJerk.std...Y fBodyAccJerk.std...Z fBodyGyro.std...X fBodyGyro.std...Y
 Min.   :-0.9905      Min.   :-0.993108    Min.   :-0.9947   Min.   :-0.9944  
 1st Qu.:-0.9737      1st Qu.:-0.983747    1st Qu.:-0.9750   1st Qu.:-0.9602  
 Median :-0.7852      Median :-0.895121    Median :-0.8086   Median :-0.7964  
 Mean   :-0.5707      Mean   :-0.756489    Mean   :-0.7110   Mean   :-0.6454  
 3rd Qu.:-0.1685      3rd Qu.:-0.543787    3rd Qu.:-0.4813   3rd Qu.:-0.4154  
 Max.   : 0.3498      Max.   :-0.006236    Max.   : 0.1966   Max.   : 0.6462  
 fBodyGyro.std...Z fBodyAccMag.std.. fBodyBodyAccJerkMag.std.. fBodyBodyGyroMag.std..
 Min.   :-0.9867   Min.   :-0.9876   Min.   :-0.9944           Min.   :-0.9815       
 1st Qu.:-0.9643   1st Qu.:-0.9452   1st Qu.:-0.9752           1st Qu.:-0.9488       
 Median :-0.8224   Median :-0.6513   Median :-0.8126           Median :-0.7727       
 Mean   :-0.6577   Mean   :-0.6210   Mean   :-0.5992           Mean   :-0.6723       
 3rd Qu.:-0.3916   3rd Qu.:-0.3654   3rd Qu.:-0.2668           3rd Qu.:-0.4277       
 Max.   : 0.5225   Max.   : 0.1787   Max.   : 0.3163           Max.   : 0.2367       
 fBodyBodyGyroJerkMag.std..
 Min.   :-0.9976           
 1st Qu.:-0.9802           
 Median :-0.8941           
 Mean   :-0.7715           
 3rd Qu.:-0.6081           
 Max.   : 0.2878   
### Variables present in the dataset
 [1] "Volunteer_ID"                "Activity"                    "tBodyAcc.mean...X"          
 [4] "tBodyAcc.mean...Y"           "tBodyAcc.mean...Z"           "tGravityAcc.mean...X"       
 [7] "tGravityAcc.mean...Y"        "tGravityAcc.mean...Z"        "tBodyAccJerk.mean...X"      
[10] "tBodyAccJerk.mean...Y"       "tBodyAccJerk.mean...Z"       "tBodyGyro.mean...X"         
[13] "tBodyGyro.mean...Y"          "tBodyGyro.mean...Z"          "tBodyGyroJerk.mean...X"     
[16] "tBodyGyroJerk.mean...Y"      "tBodyGyroJerk.mean...Z"      "tBodyAccMag.mean.."         
[19] "tGravityAccMag.mean.."       "tBodyAccJerkMag.mean.."      "tBodyGyroMag.mean.."        
[22] "tBodyGyroJerkMag.mean.."     "fBodyAcc.mean...X"           "fBodyAcc.mean...Y"          
[25] "fBodyAcc.mean...Z"           "fBodyAccJerk.mean...X"       "fBodyAccJerk.mean...Y"      
[28] "fBodyAccJerk.mean...Z"       "fBodyGyro.mean...X"          "fBodyGyro.mean...Y"         
[31] "fBodyGyro.mean...Z"          "fBodyAccMag.mean.."          "fBodyBodyAccJerkMag.mean.." 
[34] "fBodyBodyGyroMag.mean.."     "fBodyBodyGyroJerkMag.mean.." "tBodyAcc.std...X"           
[37] "tBodyAcc.std...Y"            "tBodyAcc.std...Z"            "tGravityAcc.std...X"        
[40] "tGravityAcc.std...Y"         "tGravityAcc.std...Z"         "tBodyAccJerk.std...X"       
[43] "tBodyAccJerk.std...Y"        "tBodyAccJerk.std...Z"        "tBodyGyro.std...X"          
[46] "tBodyGyro.std...Y"           "tBodyGyro.std...Z"           "tBodyGyroJerk.std...X"      
[49] "tBodyGyroJerk.std...Y"       "tBodyGyroJerk.std...Z"       "tBodyAccMag.std.."          
[52] "tGravityAccMag.std.."        "tBodyAccJerkMag.std.."       "tBodyGyroMag.std.."         
[55] "tBodyGyroJerkMag.std.."      "fBodyAcc.std...X"            "fBodyAcc.std...Y"           
[58] "fBodyAcc.std...Z"            "fBodyAccJerk.std...X"        "fBodyAccJerk.std...Y"       
[61] "fBodyAccJerk.std...Z"        "fBodyGyro.std...X"           "fBodyGyro.std...Y"          
[64] "fBodyGyro.std...Z"           "fBodyAccMag.std.."           "fBodyBodyAccJerkMag.std.."  
[67] "fBodyBodyGyroMag.std.."      "fBodyBodyGyroJerkMag.std.." 

### Variable 1 (Volunteer_ID)

Volunteer ID is an integer variable that identifies each of the 30 volunteers in the study.

### Variable 2 (Activity)

Activity is a factor variable that names the various activities undertaken by the volunteers, including; LAYING, SITTING, STANDING, WALKING, WALKING_DOWNSTAIRS, WALKING_UPSTAIRS. 

### Variables 3:68

Each of the following numerical variables contain signals from an accelerometer and gyroscope in the X, Y and Z directions, with one variable per direction. The mean and standard deviation were also calculated for each direction, resulting in 6 variables for each of the items listed below.

tBodyAcc
tGravityAcc
tBodyAccJerk
tBodyGyro
tBodyGyroJerk
fBodyAcc
fBodyAccJerk
fBodyGyro

The prefix 't' denotes time, the suffixes 'Acc' stand for accelerometer and 'Gyro' for gyroscope. The acceleration signal was then separated into body and gravity acceleration signals, 'Body' and 'Gravity'. Subsequently, the body linear acceleration and angular velocity were derived in time to obtain 'Jerk' signals. The 'f' indicates frequency domain signals.

For the following items, the magnitude 'Mag' of these three-dimensional signals were calculated once each for the standard deviation and the mean, resulting in 2 variables per listed item.

tBodyAccMag
tGravityAccMag
tBodyAccJerkMag
tBodyGyroMag
tBodyGyroJerkMag
fBodyAccMag
fBodyBodyAccJerkMag
fBodyBodyGyroMag
fBodyBodyGyroJerkMag

### Units

The acceleration signal from the accelerometer is measured in standard gravity units 'g'. The angular velocity vector is measured by the gyroscope for each window sample. The units are radians/second. 



