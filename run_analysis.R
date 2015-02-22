## This the Project work assingment for 
## Getting and Cleaning Data 
## 
## Created by Bhaksar Bandaru
##
## Date: 21st Feb 2015
##
## ----------------------------------------------------------
##
## step 1 - create the code for the downloading the file and 
## unzip the file into the current working directory
##
## Assume that the required packages are already loaded
##
## 
## -----------------------------------------------------------
##

require (maptools)
require (plyr)
require (dplyr)
require (reshape2)

## assumption that the code is run on the windows OS computer and 
## internet2 value is set for the https usage

url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
file <- basename(url)

##file <- tempfile("dataForAnalysis", tmpdir = getwd(), fileext= ".zip")
## code has been tested with the Windows OS, if this need to be verified on MAC system
## then replace the following instructuin with proper method using curl for MAC computer
setInternet2(TRUE)
if (!file.exists(file))
  {download.file (url, file, method= "auto", quiet = TRUE)}
  ## download.file (url, file, method= "auto", quiet = TRUE)

##now unzip the file to the current working directory
unzip(file, exdir = ".",  overwrite=TRUE)

## the unzip should create the following directory structure in the working directory
## Also according to the PROJECT WORK instrcutions we need to assume that:
## files are available under the directory structure of "UCI HAR Dataset"
## [1] "."                                       
## [2] "./UCI HAR Dataset"                       
## [3] "./UCI HAR Dataset/test"                  
## [4] "./UCI HAR Dataset/test/Inertial Signals" 
## [5] "./UCI HAR Dataset/train"                 
## [6] "./UCI HAR Dataset/train/Inertial Signals"
## hence we use this file directory sructure to access the files to extract that data
##
## mainDir is "./UCI HAR Dataset" for files "features/txt" and "activity_lables.txt"
## testDir is "./UCI HAR Dataset/test" for files "X_test.txt" , y_test.txt" and "subject_test.txt"
## trainDir is "./UCI HAR Dataset/train"  for files "X_train.txt" , y_train.txt" and "subject_train.txt"
##

mainDir <- list.dirs()[2]
testDir <- list.dirs()[3]
trainDir <- list.dirs()[5]

## now start reading the data files from each directory into the tables
## start with mainDir 
## 
## features Labels
featuresLabel <- read.table ((paste(mainDir, "features.txt", sep ="/")), sep="")
colnames(featuresLabel) <- c("id", "feature")

## activity labels
activityLabel <- read.table ((paste(mainDir, "activity_labels.txt", sep ="/")), sep="")
colnames(activityLabel) <- c("id", "activity")

## now move to the test data from the testDir
testData <- read.table ((paste(testDir, "X_test.txt", sep ="/")), sep="")
## we will delay naming the columns/variables for this testData table for now

testActivity <- read.table ((paste(testDir, "y_test.txt", sep ="/")), sep="")
colnames(testActivity) <- c("activity")

testSubject <- read.table ((paste(testDir, "subject_test.txt", sep ="/")), sep="")
colnames (testSubject) <- c("subjectid")

## now we will do the same for the train data from the trainDir
trainData <- read.table ((paste(trainDir, "X_train.txt", sep ="/")), sep="")
## we will delay naming the columns/variables for this trainData table for now

trainActivity <- read.table ((paste(trainDir, "y_train.txt", sep ="/")), sep="")
colnames(trainActivity) <- c("activity")

trainSubject <- read.table ((paste(trainDir, "subject_train.txt", sep ="/")), sep="")
colnames (trainSubject) <- c("subjectid")

## now carry out the FIRST STEP of the PROJECT WORK instruction that is merging the test and trainin data set
## let us start with the testSet first and then trainSet

testDataSet <- cbind(testData, testSubject, testActivity)
trainDataSet <- cbind(trainData, trainSubject, trainActivity)

## now combine the test and train data sets together to get the combined Data set
combinedData <- rbind(testDataSet, trainDataSet)

## now we will do the SECOND STEP of the PROJECT WORK instructions
## Extracts only the measurements on the mean and standard deviation for each measurement. 
## now identify the columns to select and that is based on the mean and std columns

colToSelect <- grep ("-mean\\(\\)|-std\\(\\)", featuresLabel$feature)
firstTidyData <- select (combinedData, subjectid, activity, colToSelect)

## now we have to do the THRID STEP of the PROJECT WORK instructions
## Uses descriptive ACTIVITY names to name the activities in the data set
## however now we have to first order the data set correctly before we add the ACTIVITY labels
##
## arranged the table in an ordered strcuture for the subject id and activity
firstTidyData <- arrange(firstTidyData, subjectid, activity)
## we also take a copy of this firstTidyData as a nextTidayData
## this is done to keep ready for STEP 5 acitivity of the project work instructions
nextTidyData <- arrange (firstTidyData, subjectid, activity)
##now we can add the activity descriptions in the correct order 1 to 6 respective
## let us make sure the activity varibale is right format to take the characters
firstTidyData$activity <- as.character(firstTidyData$activity)

firstTidyData$activity <- mapvalues(firstTidyData$activity, as.character(activityLabel$id), as.character(activityLabel$activity))

## noW we can do the FOURTH STEP of the PROJECT WORK instructions 
## Appropriately labels the data set with descriptive variable names.
## adding the names to the variables in the firstTidyData other than subjectid and activity
## these labels are provided as part of the the featuresLabel table
colnames(firstTidyData) <- c("subjectid" , "activity", as.character(featuresLabel$feature[colToSelect]))


## noW we can do the FITH STEP of the PROJECT WORK instructions 
## From the data set in step 4, creates a second, independent tidy data set 
## with the average of each variable for each activity and each subject.
## as we have done the re-mapping of activity to the labels the organisation would change 
## if we use the grouping by the activity.
## Hence wanted to keep the sequence of labels corresponding to 1 to 6 

colnames(nextTidyData) <- c("subjectid" , "activity", as.character(featuresLabel$feature[colToSelect]))
nextTidyData <- (nextTidyData %>% group_by(subjectid, activity) %>% summarise_each(funs(mean)))

nextTidyData$activity <- as.character(nextTidyData$activity)

nextTidyData$activity <- mapvalues(nextTidyData$activity, as.character(activityLabel$id), as.character(activityLabel$activity))

tidyData <- melt (nextTidyData, id = c("subjectid", "activity"), measure.vars= as.vector(colnames(nextTidyData)[3:68]))
## adding the names to the variables in the tidyData other than subjectid and activity
names(tidyData) <- c("subjectid", "activity", "measurement", "average")

## now write the table as text file in to the current working directory
## PLEASE NOTE THAT THERE IS NO CHECK DONE IF THE FILE IS ALREADY EXISTS OR NOT
## IF REQUIRED THIS CHECK CAN BE ADDED BUT FOR SIMPLIFICATION NOT INCLUDED NOW IN THE CODE
write.table(tidyData, file = "./tidyData.txt", quote=FALSE, sep = ",", row.names=FALSE)

## this is the end of the code file

