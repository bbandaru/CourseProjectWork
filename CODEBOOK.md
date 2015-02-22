# Code Book
This repository is created to share the Course Project work Code Book for the Getting and Cleaning Data course  

# 1.0 Introduction

This course project work is prepared based on the following Human Activity Recognition Using Smartphones Dataset. Please refer to the following details referenced here to provide the appropriate credit and information.

==================================================================
Human Activity Recognition Using Smartphones Dataset
Version 1.0
==================================================================
Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.
Smartlab - Non Linear Complex Systems Laboratory
DITEN - Università degli Studi di Genova.
Via Opera Pia 11A, I-16145, Genoa, Italy.
activityrecognition@smartlab.ws
www.smartlab.ws
==================================================================
Feature Selection 
=================

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, the data captured 3-axial linear acceleration and 3-axial angular velocity. 
The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 



The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. 



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

The dataset INPUT includes the following files:
=========================================

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



The dataset OUTPUT includes the tidyData table :
=========================================
Output data contains 4 variables as: subjectid, activity , measurement and average. 
The output tidy data file contains the full set of the activities data carried out by both test and train subjects (1:30) for all the activities identified as (original value of 1: 6 as) :


- 'WALKING', 

- 'WALKING_UPSTAIRS'.

- 'WALKING-DOWNSTAIRS',

- 'SITTING', 

- 'STANDING'.

- 'LAYING',

Hence the out put data Tidy Data contains:

Columns 1 = 'subjectid' refers to the id of the subject and range is 1 to 30 and the column 2 is 'activity' and refers to the activity performed by each subject and the activity  variable provide the lable for each activity and the values are up to 6 activities :

- 'WALKING', 

- 'WALKING_UPSTAIRS'.

- 'WALKING-DOWNSTAIRS',

- 'SITTING', 

- 'STANDING'.

- 'LAYING',

the third column /variable refers to the measurement the variable of the measurement. The value has upto 66 values as provided below:

tBodyAcc-mean()-X          
 tBodyAcc-mean()-Y          
 tBodyAcc-mean()-Z           
 tBodyAcc-std()-X           
 tBodyAcc-std()-Y            
 tBodyAcc-std()-Z           
 tGravityAcc-mean()-X        
 tGravityAcc-mean()-Y       
 tGravityAcc-mean()-Z        
 tGravityAcc-std()-X        
 tGravityAcc-std()-Y         
 tGravityAcc-std()-Z        
 tBodyAccJerk-mean()-X       
 tBodyAccJerk-mean()-Y      
 tBodyAccJerk-mean()-Z       
 tBodyAccJerk-std()-X       
 tBodyAccJerk-std()-Y        
 tBodyAccJerk-std()-Z       
 tBodyGyro-mean()-X          
 tBodyGyro-mean()-Y         
 tBodyGyro-mean()-Z          
 tBodyGyro-std()-X          
 tBodyGyro-std()-Y           
 tBodyGyro-std()-Z          
 tBodyGyroJerk-mean()-X      
 tBodyGyroJerk-mean()-Y     
 tBodyGyroJerk-mean()-Z      
 tBodyGyroJerk-std()-X      
 tBodyGyroJerk-std()-Y       
 tBodyGyroJerk-std()-Z      
 tBodyAccMag-mean()          
 tBodyAccMag-std()          
 tGravityAccMag-mean()       
 tGravityAccMag-std()       
 tBodyAccJerkMag-mean()      
 tBodyAccJerkMag-std()      
 tBodyGyroMag-mean()         
 tBodyGyroMag-std()         
 tBodyGyroJerkMag-mean()     
 tBodyGyroJerkMag-std()     
 fBodyAcc-mean()-X           
 fBodyAcc-mean()-Y          
 fBodyAcc-mean()-Z           
 fBodyAcc-std()-X           
 fBodyAcc-std()-Y            
 fBodyAcc-std()-Z           
 fBodyAccJerk-mean()-X       
 fBodyAccJerk-mean()-Y      
 fBodyAccJerk-mean()-Z       
 fBodyAccJerk-std()-X       
 fBodyAccJerk-std()-Y        
 fBodyAccJerk-std()-Z       
 fBodyGyro-mean()-X          
 fBodyGyro-mean()-Y         
 fBodyGyro-mean()-Z          
 fBodyGyro-std()-X          
 fBodyGyro-std()-Y           
 fBodyGyro-std()-Z          
 fBodyAccMag-mean()          
 fBodyAccMag-std()          
 fBodyBodyAccJerkMag-mean()  
 fBodyBodyAccJerkMag-std()  
 fBodyBodyGyroMag-mean()     
 fBodyBodyGyroMag-std()     
 fBodyBodyGyroJerkMag-mean() 
and 
fBodyBodyGyroJerkMag-std() 

The fouth coulmn represents the average value of each measurement and the value is normalised and varry from -1 to +1 

All the data is separated by ",".

the out put tezxt file is called tidyData.txt.


Thanks for your time and support.


