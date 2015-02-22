# CourseProjectWork
This repository is created to share the Course Project work for the Getting and Cleaning Data course  

# 1.0 Introduction

This course project work is prepared based on the following Human Activity Recognition Using Samrtphones Dataset. Please refer to the following details referenced here to provide the appropriate credit and information.

==============================================================
Human Activity Recognition Using Smartphones Dataset
Version 1.0
==============================================================
Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.
Smartlab - Non Linear Complex Systems Laboratory
DITEN - Università degli Studi di Genova.
Via Opera Pia 11A, I-16145, Genoa, Italy.
activityrecognition@smartlab.ws

http://www.smartlab.ws

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.

# 2.0 The Coure project work :
================================

The purpose of this project is to demonstrate the ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis.

The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained: 

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

Here are the data for the project: 

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

# 3.0 The Given INPUT :
========================

The given dataset includes the following files:

- 'README.txt'

- 'features_info.txt': Shows information about the variables used on the feature vector.

- 'features.txt': List of all features.

- 'activity_labels.txt': Links the class labels with their activity name.

- 'train/X_train.txt': Training set.

- 'train/y_train.txt': Training labels.

- 'test/X_test.txt': Test set.

- 'test/y_test.txt': Test labels.

The following files are available for the train and test data. Their descriptions are equivalent. 

- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 

# 4.0 The work done:
====================

Need create one R script called run_analysis.R that does the following. 
1 Merges the training and the test sets to create one data set.
2 Extracts only the measurements on the mean and standard deviation for each measurement
3 Uses descriptive activity names to name the activities in the data set
4 Appropriately labels the data set with descriptive variable names. 
5 From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject

The work is done with the following steps:

As requested a R script called run_analysis.R file is created and for this course work and the script is developed for the Windows machine.

The zip file is downloaded to the local working directory from the web site. and Un-zipped the file in the local directory.

From the local directory and sub-directory "UCI HAR Dataset" for all folders. 

Then the test and train data is read into local tables from the files first the test data read from "./test/X_test.txt" file has been merged with the test subjects ids from the file "./test/subject_test.txt" and also with the activity that each subject carried out from "./test/y_test.txt"

Similarly the train data is read into local tables from the files first the train data read from "./train/X_train.txt" file has been merged with the train subjects ids from the file "./train/subject_train.txt" and also with the activity that each subject carried out from "./train/y_train.txt" 

Once the test data and train data sets are created then those two sets of the data are merged using the rbind logic. That provides the combine data set for all subject ids 1 to 30. 

From this combined data specific measurements related to the mean and standard deviation for each measurement have been selected using the grep operation for "-mean()" or "-std()" from the following measurements. Which provides overall 66 measurements data as specified in the "features_info.txt":

 These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

tBodyAcc-XYZ
tGravityAcc-XYZ
tBodyAccJerk-XYZ
tBodyGyro-XYZ
tBodyGyroJerk-XYZ
tBodyAccMag
tGravityAccMag
tBodyAccJerkMag
tBodyGyroMag
tBodyGyroJerkMag
fBodyAcc-XYZ
fBodyAccJerk-XYZ
fBodyGyro-XYZ
fBodyAccMag
fBodyAccJerkMag
fBodyGyroMag
fBodyGyroJerkMag

The set of variables that were estimated from these signals are: 
mean(): Mean value
std(): Standard deviation 

Once the selected activities are done to a tidy data set then the data set is ordered by the Subject id and the activitiy which provides overall 68 variable data with the right order data per each subject id and the activity. 

Then the activity values (1 to 6) are replaced with six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING). 

Then after that the selected variable/Columns list has been modified the Appropriately labels the data set with descriptions.

From this table the final Tidy data set has been generated by average value for each variable per activity per subject id and this table data is written into a text file using the write.table with row.names = FALSE.

please note that for the final Tidy data the data is organised vertically and also when the values of activiy are replaced wih the corresponding activity lables then the data organisation will be ordered based on the character value of the activity and hence to keep the order consitent for the final tidy data the data set-recreated instead of re-using the data set created as step 4 of the project work instructions. 

Also please note that run_analysis.R code contains step by step instructions and uses different variable for each step. This is done only to keep track of the variables to do the debug and close the corrections/bug-fixes easiy.

Also please refer to the code book document available in the same repository to get more details.  



Notes: 
======
- Features are normalized and bounded within [-1,1].
- Each feature vector is a row on the text file.

For more information about this dataset contact: activityrecognition@smartlab.ws

License:
========
Use of this dataset in publications must be acknowledged by referencing the following publication [1] 

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse. Any commercial use is prohibited.

Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita. November 2012. 
