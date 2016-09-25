# Codebook for Peer Graded Assignment
## Getting and Cleaning Data (Coursera.org) - September 2016

This file describes the variables, the data, and any transformations or work that you performed to clean up the data.


## Objectives of the script
* Merges the training and the test sets to create one data set.
* Extracts only the measurements on the mean and standard deviation for each subject and activity type.
* Uses descriptive activity names to name the activities in the data set
* Appropriately labels the data set with descriptive variable names.
* From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.


## Data
The data set is from an experiment in which 30 subjects were given an activity tracker and thousands of measurements
were taken using the instruments' accelerometer and gyroscope.
Based on the data, it was possible to determine the subjects' activity, of which there were 6 types.
The subjects were split into two groups, the training group and the test group.
Data source: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

## Reading in the data and data structure
The downloaded data were in a .zip format.
Unzipping to the working directory gives a folder, "UCI HAR Dataset"
In this is contained two subfolders, test and train.
There are 4 additional files:
* README.txt explains in more detail how the data were gathered and the contents of the subfolders
* activity_labels.txt gives the names and respective number codes for the 6 activity types [2 variables x 6 observations]
* features.txt gives a list of the variable names of the measurements [2 variables x 561 observations]
* features_info.txt explains the variable names of the measurements in a human readable format

The two subfolders (n = test OR train) each contain
* subject_n.txt the numerical designation for the subjects in the data set [test: 1 variable x 2947 observations; train: 1 variable x 7352 observations]
* X_n.txt the data for all the measurements taken with the activity tracker in the data set [test: 561 variables x 2947 observations; train: 561 variables x 7352 observations]
* y_n.txt the feature code associated with each set of measurements in the data set [test: 1 variable x 2947 observations; train: 1 variable x 7352 observations]
* another subfolder called "Inertial Signal" - will not be using the data in these for this assignment.

The package data.table is used to facilitate reading in the data.

## Variables

Data frames (df) to read in each of the .txt files listed above:
* X_test_df 
* Y_test_df
* subject_test_df

* X_train_df
* Y_train_df
* subject_train_df

Data frames and variables containing the activity labels and features of the data, and to select the labels of interest:
* activity
* features_df
* all_labels
* lbls_mean_std

Data frames containing the complete merged date, extracted data for the features labelled mean and standard deviation (std) for each measurement, calculation of mean for each subject and activity combination, and output of the results as tidy data:
* all_test_train
* data_mean_std
* tidy2

Output file:
* tidy2.txt

## Transformations applied to the data

* Step 1. Assign the text portion of features_df to the column names of X_test_df and X_train_df
* Step 2. Assign "subject" to the column name of subject_test_df and subject_train_df
* Step 3. Assign "activity_code" to the column name of Y_test_df and Y_train_df
* Step 3. Assign "activity_code" and "activity" to the column names of activity
* Step 4. Merge data frames: (1) Y_test_df and activity based on column "activity code"; (2) (1) Y_train_df and activity based on column "activity code"
* Step 5. Bind together data frames: (1) subject_test_df, merged test data from Step 4., X_test_df; (2) subject_train_df, merged train data from Step 4., X_train_df
* Step 6. Merge data from the test and train sets
* Step 7. Create a vector of the column names / labels for the combined data set
* Step 8. Extract the label names for subject, activity, and measurements mean and std
* Step 9. Extract data from the combined set based on the mean and std columns
* Step 10. Calculate for each subject / activity combo the average for the given measurements, ensure it is a tidy data set (as per the principles set out by Hadley Wickham in the Journal of Statistical Software: for one table of data, this means (1) each variable is in one column and (2) each different observation of that variable is in a different row), and write to a file
