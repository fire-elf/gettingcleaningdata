Description of analysis files for Getting and Cleaning Data peer graded assignment

Adapted from:

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

Reference:

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

==================================================================

Description of the data collection (from the original README - direct quotes):
"The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

"The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details.

"For each record it is provided:
- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment."


Files contained in this dataset:
=========================================

- 'README.txt' : original from which this file is adapted

- 'features_info.txt': Description of the variables used on the feature vector.

- 'features.txt': List of all features, i.e. measurements taken by the activity tracker.

- 'activity_labels.txt': Links the class labels with their activity name (WALKING, WALKING_UPSTAIRS, etc.)

Two subfolders, 'train' and 'test':

- 'train/X_train.txt': Training set with measurements associated with each feature (range: -1 to 1)

- 'train/y_train.txt': Training labels containing the subject # identifiers.

- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 

- 'test/X_test.txt': Test set with measurements associated with each feature (range: -1 to 1)

- 'test/y_test.txt': Test labels containing the subject # identifiers.

- 'test/subject_test.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 2 to 24. 

One sub-subfolder in each, 'Inertial Signals' containing accelerometer signals in standard gravity units 'g'. This is raw data and not considered for this assignment.


