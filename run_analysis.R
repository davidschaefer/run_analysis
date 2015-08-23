# Getting and Cleaning Data project
# 8/23/2015
# 
# The purpose of this project is to demonstrate collecting, working with, and 
# cleaning a data set. The goal is to prepare and output a tidy data set that can 
# be utilized for analysis. This data for this project comes from University of 
# California at Irvine's Human Activity Recognition database built from the 
# recordings of 30 subjects performing activities of daily living (ADL) while 
# carrying a waist-mounted Samsung Galaxy Smartphone with embedded inertial sensors.
# A full description of this data is available at the site where the data was obtained:
# http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 
#
# Data Source for the project: 
# https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
#
# Output: data/tidy_data.txt
# 
#
# Solution Description:
# 1. Merges the training and the test sets to create one data set.
# 2. Extracts only the measurements on the mean and standard deviation for each 
#    measurement. 
# 3. Uses descriptive activity names to name the activities in the data set
# 4. Appropriately labels the data set with descriptive variable names. 
# 5. From the data set in step 4, creates a second, independent tidy data set 
#    with the average of each variable for each activity and each subject.

# Load libraries
library(downloader)
library(plyr)
library(dplyr)


# Create data directory
if (!dir.exists("./data")) {
        dir.create("./data")
}

# Download and unzip data files if not already downloaded
if (!file.exists("./data/UCI HAR Dataset.zip")) {
        download("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip", "./data/UCI HAR Dataset.zip", mode="wb")
        unzip("./data/UCI HAR Dataset.zip", exdir = "./data", overwrite = TRUE)
}


# === 1. Merges the training and the test sets to create one data set. ===

# Load training data sets
trainingData <- read.table("./data/UCI HAR Dataset/train/X_train.txt")
trainingActivity <- read.table("./data/UCI HAR Dataset/train/y_train.txt")
trainingSubject <- read.table("./data/UCI HAR Dataset/train/subject_train.txt")

# Load test data sets
testData <- read.table("./data/UCI HAR Dataset/test/X_test.txt")
testActivity <- read.table("./data/UCI HAR Dataset/test/y_test.txt")
testSubject <- read.table("./data/UCI HAR Dataset/test/subject_test.txt")

# Load lookup tables
activityLookup <- read.table("./data/UCI HAR Dataset/activity_labels.txt")
featuresLookup <- read.table("./data/UCI HAR Dataset/features.txt")

# Merge training and test datasets
trainingAndTestData <- rbind(trainingData, testData)
trainingAndTestActivity <- rbind(trainingActivity, testActivity)
trainingAndTestSubject <- rbind(trainingSubject, testSubject)

# Set column names to more meaningful values
names(trainingAndTestData) <- featuresLookup$V2
names(trainingAndTestSubject) <- "subject"
names(trainingAndTestActivity) <- "activityID"

# Merge trainingAndTestData, trainingAndTestSubject, and trainingAndTestActivity
# datasets into one single dataset
mergedData <- cbind(trainingAndTestData, trainingAndTestSubject, trainingAndTestActivity)


# === 2. Extracts only the measurements on the mean and standard deviation for each measurement. ===

# Create filterd list of columns for the means and standard deviation measures
meanStdMeasures <- grepl("mean\\(\\)|std\\(\\)", featuresLookup[,2], ignore.case = TRUE)

# Append TRUE values for the subject and activity id columns
columnList <- append(meanStdMeasures, c(TRUE,TRUE)) 

#Subset data using filtered list, subject, and activityID
mergedData <- mergedData[, columnList]


# === 3. Uses descriptive activity names to name the activities in the data set ===

# Set column names to more meaningful values
names(activityLookup) <- c("activityID", "activity")

# Use join from plyr package to create a left join on the Activity Lookup and
# merge the activity data to the unified dataset
mergedData <- join(mergedData, activityLookup, by = "activityID", type="left")

#remove activityID from data set
mergedData <- mergedData[, !names(mergedData) %in% "activityID"]

# === 4. Appropriately labels the data set with descriptive variable names. ===

# Spell out abbreviations, hyphenate between words, remove redundant words (e.g.
# "BodyBody"), and remove empty parentheses
names(mergedData) <- gsub("^t", "time-", names(mergedData), ignore.case = TRUE)
names(mergedData) <- gsub("^f", "frequency-", names(mergedData), ignore.case = TRUE)
names(mergedData) <- gsub("BodyBody", "body-", names(mergedData), ignore.case = TRUE)
names(mergedData) <- gsub("Body", "body-", names(mergedData), ignore.case = TRUE)
names(mergedData) <- gsub("gravity", "gravity-", names(mergedData), ignore.case = TRUE)
names(mergedData) <- gsub("Mean", "mean", names(mergedData), ignore.case = TRUE)
names(mergedData) <- gsub("Acc", "accelerometer-", names(mergedData), ignore.case = TRUE)
names(mergedData) <- gsub("Mag", "magnitude-", names(mergedData), ignore.case = TRUE)
names(mergedData) <- gsub("Gyro", "gyroscope-", names(mergedData), ignore.case = TRUE)
names(mergedData) <- gsub("Jerk", "jerk-", names(mergedData), ignore.case = TRUE)
names(mergedData) <- gsub("--", "-", names(mergedData), ignore.case = TRUE)
names(mergedData) <- gsub("\\(\\)", "", names(mergedData), ignore.case = TRUE)
names(mergedData) <- gsub("tBody", "time-body", names(mergedData), ignore.case = TRUE)
names(mergedData) <- gsub("\\-)", "\\)", names(mergedData), ignore.case = TRUE)


# === 5. From the data set in step 4, creates a second, independent tidy data set with the ===
# ===    average of each variable for each activity and each subject.                      ===

# Group the merged data by activity and then subject
# Then calcculate the mean of each column
tidyData <- mergedData %>% group_by(activity, subject) %>% summarise_each(funs(mean))

# Write the resulting tidy dataset to a file
write.table(tidyData, file = "./data/tidy_data.txt" , row.names = FALSE)





