---
title: CodeBook
author: David Schaefer
date: 8/23/2015
output:
  html_document:
    keep_md: yes
---

## Project Description
The purpose of this project is to demonstrate collecting, working with, and cleaning a data set. The goal is to prepare and output a tidy data set that can be utilized for analysis. The source data for this project comes from the University of California at Irvine's (UCI) Human Activity Recognition database built from the recordings of 30 subjects performing activities of daily living (such as walking upstair, standing sitting, etc.) while carrying a waist-mounted Samsung Galaxy Smartphone with embedded inertial sensors. A full description of the source data is available at the site where the data was obtained:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones. The tidy dataset output from this project can be found here: https://github.com/davidschaefer/run_analysis/blob/master/tidy_data.txt or by executing the run_analysis.R source code. 

##Study design and data processing

###Collection of the raw data
The source data for this project was collected by UCI researchers conducting an experiment on 30 volunteers within an age range of 19-48 years. Each volunteer performed six activities (walking, walking upstairs, walking downstairs, sitting, standing, and laying) while wearing a Samsung Galaxy S II smartphone on the waist. Using the smartphone's embedded accelerometer and gyroscope, UCI researchers captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The collected data was randomly partitioned into two sets, where 70% of the volunteers were selected for generating the training data and 30% the test data. The collected raw data was provided in a zip file at this location: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 


###Notes on the original (raw) data 
For raw dataset provided: 
- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration. 
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

The specific list of raw data files used for this project:

| Raw Data File | Description | 
| ------------- |:-------------| 
| features.txt | List of all features.| 
| activity_labels.txt | Links the class labels with their activity name. |
| train/X_train.txt | Training set.|
| train/y_train.txt  | Training labels.|
| test/X_test.txt | Test set.|
| test/y_test.txt| Test labels.|
| train/subject_train.txt, test/subject_test.txt| Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. |

Note: There are additional data files contained within the Inertial Signals subfolders in the raw dataset that were determined to be irrelevant to this course project. This project is only focused on the mean and standard deviation variables, and the files within the Inertials Signals subfolder provided data outside of that scope and thus not needed.
For even more details on the raw data set, check out: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

##Creating the tidy datafile

###Guide to create the tidy data file
To create the tidy data file, simply source the run_analysis.R script in R.  The script will automatically download and unzip the raw data, cleanse it, and produce the tidy data set. The tidy data set is placed in the "data/tidy_data.txt" file of your current working directory.

###Cleaning of the data
In order to clean the data several steps were taken.  The training and test data were merged.  The subject and activity name fields were added. The data was filtered to only include mean and standard deviation variables. The variable labels were updated with more descriptive names, and the average of each variable for each activity and each subject was calculated.
For more in-depth technical details, please see the [README](https://github.com/davidschaefer/run_analysis/blob/master/README.md).

##Description of the variables in the tiny_data.txt file
General description of the file including:
 - Dimensions of the dataset
 - Summary of the data
 - Variables present in the dataset

(you can easily use Rcode for this, just load the dataset and provide the information directly form the tidy data file)

###Variable 1 (repeat this section for all variables in the dataset)
Short description of what the variable describes.

Some information on the variable including:
 - Class of the variable
 - Unique values/levels of the variable
 - Unit of measurement (if no unit of measurement list this as well)
 - In case names follow some schema, describe how entries were constructed (for example time-body-gyroscope-z has 4 levels of descriptors. Describe these 4 levels). 

(you can easily use Rcode for this, just load the dataset and provide the information directly form the tidy data file)

####Notes on variable 1:
If available, some additional notes on the variable not covered elsewehere. If no notes are present leave this section out.

##Sources
Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. A Public Domain Dataset for Human Activity Recognition Using Smartphones. 21th European Symposium on Artificial Neural Networks, Computational Intelligence and Machine Learning, ESANN 2013. Bruges, Belgium 24-26 April 2013.
