# Readme
## Project Description:
The purpose of this project is to demonstrate collecting, working with, and cleaning a data set. The goal is to prepare and output a tidy data set that can be utilized for analysis. This data for this project comes from University of California at Irvine's Human Activity Recognition database built from the recordings of 30 subjects performing activities of daily living (ADL) while carrying a waist-mounted Samsung Galaxy Smartphone with embedded inertial sensors. A full description of this data is available at the site where the data was obtained: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

Data Source for the project: 
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

Output: data/tidy_data.txt
 
##Solution Description:
1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set.
4. Appropriately labels the data set with descriptive variable names.
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

##How the solution works:

For additional details, feel free to read the [code](https://github.com/davidschaefer/run_analysis/blob/master/run_analysis.R) as it is thoroughly documented.

##How to execute the run_analysis.R script:
To execute the script simply, simply source the run_analysis.R script in R. The script will automatically download and unzip the raw data, cleanse it, and produce the tidy data set. The tidy data set is placed in the "data/tidy_data.txt" file of your current working directory.
