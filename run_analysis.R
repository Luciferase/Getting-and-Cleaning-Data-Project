## Coursera Getting and Cleaning Data Course Assignment
## Alex Jacobs
## 2015-03-17

## You should create one R script called run_analysis.R that does the following. 
## 1. Merges the training and the test sets to create one data set.
## 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
## 3. Uses descriptive activity names to name the activities in the data set
## 4. Appropriately labels the data set with descriptive variable names. 
## 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each
## activity and each subject.

## File run_analysis.R needs to be in the main directory so that it can be run as long as the Samsung data is in the working directory
## Data was obtained from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

## load packages
library(plyr)

## read data X data
X_trainData <- read.table("train/X_train.txt")
X_testData <- read.table("test/X_test.txt")

## read data Y data
Y_trainData <- read.table("train/Y_train.txt")
Y_testData <- read.table("test/y_test.txt")

## read subject data
subject_trainData <- read.table("train/subject_train.txt")
subject_testData <- read.table("test/subject_test.txt")

## read features and change it to a list
features <- read.table("features.txt")
features <- features[,2]

## read activity_labels
ActivityType <- read.table("activity_labels.txt")

## 1. Merges the training and the test sets to create one data set.
## merge train and test data set for X Y and subject
X_trainTest <- rbind(X_trainData, X_testData)
Y_trainTest <- rbind(Y_trainData, Y_testData)
subject_trainTest <- rbind(subject_trainData, subject_testData)

## 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
## Identify features containing the phrase "mean" or "std" in list of features
meanStdFeatures <- grep("mean|std", features)

## extract mean and std from X traintest data
X_trainTest <- X_trainTest[, meanStdFeatures]

## 3. Use descriptive activity names to name the activities in the data set 
## Re-lable 1:6 with the following: WALKING, WALKING_UPSTAIRS, 
## WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING
Y_trainTest[, 1] <- ActivityType[Y_trainTest[, 1], 2]
names(Y_trainTest) <- "ActivityType"

## 4. Appropriately label the data set with descriptive variable names
names(X_trainTest) <- features[meanStdFeatures]

names(subject_trainTest) <- "SubjectNumber"

## bind data together by columns
XYsubjectData <- cbind(X_trainTest, Y_trainTest, subject_trainTest)

## 5. From the data set in step 4, creates a second, independent tidy data 
##    set with the average of each variable for each activity and each subject.

## Assign the length of columns for XYsubjectData -2 to numberOfColumns
numberOfColumns <- length(XYsubjectData[1,])-2

## Create a tidy data set from XYsubjectData containing the means of each Acivity per Subject
tidy_data <- ddply(XYsubjectData, .(SubjectNumber, ActivityType), function(x) colMeans(x[, 1:numberOfColumns]))

## write table
write.table(tidy_data, "tidy_data.txt", row.names=FALSE)
