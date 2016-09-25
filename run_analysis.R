# Peer graded assignment for "Getting and Cleaning Data" Sept. 2016
#
# Assessment criteria:
# Merges the training and the test sets to create one data set.
# Extracts only the measurements on the mean and standard deviation for each measurement.
# Uses descriptive activity names to name the activities in the data set
# Appropriately labels the data set with descriptive variable names.
# From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
#
# Data source: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

# Set the working directory - for the purpose of submission, assume already in the working directory
# setwd("C:/Users/Jenny/Documents/COURSERA/2 - Getting and cleaning data (Sep 2016)/Week 4")

# Download and unzip the data
fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
data_zip <- download.file(fileURL, destfile = "./data_zip.zip")

# How to unzip folders? Searched online: https://stat.ethz.ch/R-manual/R-devel/library/utils/html/unzip.html
unzip("data_zip.zip")

# Check the directory
# list.files()

# Change into the new folder, "UCI HAR Dataset", and check what is inside
setwd("./UCI HAR Dataset")
# list.files()

# According to the README.txt and features_info.txt files, data was collected for 30 people, and these were split between
# "train" and "test" sets, in separate folders labelled as such. Within each folder is the following:
# 1. subject_train.txt (or _test) - identifies the person, from 1 to 30
# 2. X_train.txt (or _test) - the data
# 3. Y_train.txt (or _test) - the data labels
# 4. A folder called Inertial Signals, which contains more .txt files with data

# Start reading in the data from the two folders. Start with the test folder because it's smaller.
library(data.table)
setwd("./test")
#list.files()
X_test_df <- fread("./X_test.txt")
Y_test_df <- fread("./y_test.txt")
subject_test_df <- fread("./subject_test.txt")

# Explore the data
#dim(X_test_df)        #2947 obs x 561 var
#dim(Y_test_df)        #2947 obs x 1 var
#summary(Y_test_df)   #min 1, max 6
#dim(subject_test_df)  #2947 obs x 1 var
#summary(subject_test_df) #min 2, max 24

# Now read in the data in the train folder.
#setwd("C:/Users/Jenny/Documents/COURSERA/2 - Getting and cleaning data (Sep 2016)/Week 4")
setwd("./UCI HAR Dataset/train")
X_train_df <- fread("./X_train.txt")
Y_train_df <- fread("./y_train.txt")
subject_train_df <- fread("./subject_train.txt")

#Explore a bit
#dim(X_train_df)       #7352 obs x 561 var
#dim(Y_train_df)       #7352 obs x 1 var
#summary(Y_train_df)   #min 1, max 6
#dim(subject_train_df) #7352 obs x 1 var
#summary(subject_train_df) #min 1, max 30

# According to the documentation, features.txt contains the feature names. Read this file in, explore.
setwd("..")
features_df <- fread("./features.txt")
#dim(features_df)      #561 obs x 2 var

# Activity labels are contained in a file as well. Read this in.
activity <- fread("./activity_labels.txt")

# By matching up the dimensions of the different data sets, it seems that the names in features
# represent the column names in the X_test and X_train data sets. Want to:
# 1. add in the column names
# 2. preserve order of the columns
# 3. merge X_test and X_train

colnames(X_test_df) <- features_df$V2
colnames(X_train_df) <- features_df$V2

colnames(subject_test_df) <- c("subject")
colnames(subject_train_df) <- c("subject")
colnames(Y_test_df) <- c("activity_code")
colnames(Y_train_df) <- c("activity_code")
colnames(activity) <- c("activity_code", "activity")

merge_test1 <- merge(Y_test_df, activity, by = "activity_code")
merge_train1 <- merge(Y_train_df, activity, by = "activity_code")

test_SYX <- cbind(subject_test_df, merge_test1, X_test_df)
train_SYX <- cbind(subject_train_df, merge_train1, X_train_df)

# Merge data from the test and train sets
all_test_train <- rbind(test_SYX, train_SYX)

# Create a vector of the column names / labels for the combined data set
all_labels <- colnames(all_test_train)

# Extract the label names for subject, activity, and measurements mean and std
lbls_mean_std <- c("subject", "activity", grep("mean|std", all_labels, value = TRUE))

# Extract data from the combined set the mean and std columns
data_mean_std <- subset(all_test_train, select=lbls_mean_std)

# Create a tidy dataset from data_mean_std
# Calculate for each subject / activity combo the average for the given measurements
tidy2 <- aggregate(. ~subject + activity, data_mean_std, mean)


# Write the results to a file
write.table(tidy2, file = "tidy2.txt", row.name = FALSE)
