## Coursera Getting and Cleaning Data Course Assignment
## Alex Jacobs
## 2015-03-17
## file run_analysis.R in the main directory so that it can be run as long as the Samsung data is in your working directory

## load packages
library(plyr)

## read data X data
X_trainData <- read.table("train/X_train.txt")
X_testData <- read.table("test/X_test.txt")
        
## read data Y data
Y_trainData <- read.table("train/Y_train.txt")
Y_testData <- read.table("test/y_test.txt")
        
## read subject data and
subject_trainData <- read.table("train/subject_train.txt")
subject_testData <- read.table("test/subject_test.txt")

## read features and change it to a list
features <- read.table("features.txt")
features <- features[,2]

## read activity_labels
ActivityType <- read.table("activity_labels.txt")
        
## merge train and test data set
X_trainTest <- rbind(X_trainData, X_testData)
Y_trainTest <- rbind(Y_trainData, Y_testData)
subject_trainTest <- rbind(subject_trainData, subject_testData)
        
## extract mean and standard deviation from X_trainTest
        
## Identify features containing "mean" or "std" in features
meanStdFeatures <- grep("mean|std\\(\\)", features)

## extract mean and std from X traintest data
X_trainTest <- X_trainTest[, meanStdFeatures]
        
## Use descriptive activity names to name the activities in the data set 
## Re-lable 1:5 with the following: WALKING, WALKING_UPSTAIRS, 
## WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING
Y_trainTest[, 1] <- ActivityType[Y_trainTest[, 1], 2]
names(Y_trainTest) <- "ActivityType"

## Appropriately label the data set with descriptive variable names
names(X_trainTest) <- features[meanStdFeatures]

names(subject_trainTest) <- "SubjectNumber"

## bind data together by columns
XYsubjectData <- cbind(X_trainTest, Y_trainTest, subject_trainTest)

## From the data set in step 4, creates a second, independent tidy data 
## set with the average of each variable for each activity and each subject.
## Each variable you measure should be in one column, Each different 
## observation of that variable should be in a different row

tidy_data <- ddply(XYsubjectData, .(SubjectNumber, ActivityType), function(x) colMeans(x[, 1:79]))
        
## write.table() using row.name=FALSE 
write.table(tidy_data, "tidy_data.txt", row.names=FALSE)
