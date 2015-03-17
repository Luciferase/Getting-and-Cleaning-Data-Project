# Getting-and-Cleaning-Data-Project

This repository contains the data required for the course project of Getting-and-Cleaning-Data

The run_analysis.R file needs to be in the UCI HAR Dataset folder to run correctly

Code Book contains explanations for each of the varibales declared in run_analysis.R

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

run_analysis.R returns a tidy data set  of the average for each subject per activity per variable name containing the phrase "mean" or "std" 

The tidy data set is returned in a text file named "tidy_data.txt"
