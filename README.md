# Getting-and-Cleaning-Data-Project

This repository contains the data required for the course project of Getting-and-Cleaning-Data

The run_analysis.R file needs to be in the UCI HAR Dataset folder to run correctly

Code Book contains explanations for each of the varibales declared in run_analysis.R

You should create one R script called run_analysis.R that does the following. 
1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names. 
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each
activity and each subject.

run_analysis.R reads in the following files in the train folder :
X_train.txt
y_train.txt
subject_train.txt

test folder:
X_test.txt
y_test.txt
subject_test.txt

same folder as run_analysis.R:
features.txt
acivity_labels.txt

1. Once data has been read, the train and test sets are merged together.
2. The features in features.txt that contain the phrase "mean" or "std" are then identified and extracted from X dataset.
3. Observations in y dataset are re-named according to the acivity_labels.txt and the column is named "ActivityType"
4. The X dataset column names are assigned according to features.txt extracted features
1. The data is then all column bound together, X, y, and subject data.
5. A tidy data set is created from XYsubjectData containing the means of each Acivity per Subject 

run_analysis.R then returns a tidy data set 

The tidy data set is returned in a text file named "tidy_data.txt"
