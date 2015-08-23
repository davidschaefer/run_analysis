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

##Description of the variables in the tidy_data.txt file
The dataset within the tidy_data.txt file contains 180 observations of 68 variables. Given that there are 6 activities and 30 volunteers (aka subjects), there are a total of 180 observations. Each observation corresponds to the average of each variable for each activity and each subject. The 68 variables (see list below) provided are the Subject identifier (numerical value representing each of 30 volunteers), the Activity (walking, walking_upstairs, walking_downstairs, sitting, standing, laying), and 66 mean and standard deviation measures.
The 66 mean and standard deviation measures adhere to the following naming convention that was established as part of the data cleansing process:


Note: The course project instructions stated to extract only the measurements on the mean and standard deviation for each measurement.  I interpreted this to mean measures containing either "mean()" or "std()".  Within the raw data files, there were additional measures that contained words like MeanFreq.  However, based upon the [course community forum thread on this topic](https://class.coursera.org/getdata-031/forum/thread?thread_id=160#comment-609) I elected not include measures that did not adhere to this naming convenetion.  As such, there are only 66 mean and std measures within the tidy dataset.

###Variables 
Naming convention description

The Activity variable describes the activity the volunteer performed.  There were a total of 6 activities.
Subject refers to the unique identifer for the volunteer.  There were a total of 30 volunteers.


| Variable | Class | Unique Values/Levels |
|---------|--------|:---------------------|
| activity | Factor | w/ 6 levels "WALKING", "WALKING_UPSTAIRS", "WALKING_DOWNSTAIRS", "SITTING", "STANDING", "LAYING" |
| subject                                         | int |  1 2 3 4 5 6 7 8 9 10 ... |
| time-body-accelerometer-mean-X                  | num |  0.222 0.281 0.276 0.264 0.278 ... |
| time-body-accelerometer-mean-Y                  | num |  -0.0405 -0.0182 -0.019 -0.015 -0.0183 ... |
| time-body-accelerometer-mean-Z                  | num |  -0.113 -0.107 -0.101 -0.111 -0.108 ... |
| time-body-accelerometer-std-X                   | num |  -0.928 -0.974 -0.983 -0.954 -0.966 ... |
| time-body-accelerometer-std-Y                   | num |  -0.837 -0.98 -0.962 -0.942 -0.969 ... |
| time-body-accelerometer-std-Z                   | num |  -0.826 -0.984 -0.964 -0.963 -0.969 ... |
| time-gravity-accelerometer-mean-X               | num |  -0.249 -0.51 -0.242 -0.421 -0.483 ... |
| time-gravity-accelerometer-mean-Y               | num |  0.706 0.753 0.837 0.915 0.955 ... |
| time-gravity-accelerometer-mean-Z               | num |  0.446 0.647 0.489 0.342 0.264 ... |
| time-gravity-accelerometer-std-X                | num |  -0.897 -0.959 -0.983 -0.921 -0.946 ... |
| time-gravity-accelerometer-std-Y                | num |  -0.908 -0.988 -0.981 -0.97 -0.986 ... |
| time-gravity-accelerometer-std-Z                | num |  -0.852 -0.984 -0.965 -0.976 -0.977 ... |
| time-body-accelerometer-jerk-mean-X             | num |  0.0811 0.0826 0.077 0.0934 0.0848 ... |
| time-body-accelerometer-jerk-mean-Y             | num |  0.00384 0.01225 0.0138 0.00693 0.00747 ... |
| time-body-accelerometer-jerk-mean-Z             | num |  0.01083 -0.0018 -0.00436 -0.00641 -0.00304 ... |
| time-body-accelerometer-jerk-std-X              | num |  -0.958 -0.986 -0.981 -0.978 -0.983 ... |
| time-body-accelerometer-jerk-std-Y              | num |  -0.924 -0.983 -0.969 -0.942 -0.965 ... |
| time-body-accelerometer-jerk-std-Z              | num |  -0.955 -0.988 -0.982 -0.979 -0.985 ... |
| time-body-gyroscope-mean-X                      | num |  -0.01655 -0.01848 -0.02082 -0.00923 -0.02189 ... |
| time-body-gyroscope-mean-Y                      | num |  -0.0645 -0.1118 -0.0719 -0.093 -0.0799 ... |
| time-body-gyroscope-mean-Z                      | num |  0.149 0.145 0.138 0.17 0.16 ... |
| time-body-gyroscope-std-X                       | num |  -0.874 -0.988 -0.975 -0.973 -0.979 ... |
| time-body-gyroscope-std-Y                       | num |  -0.951 -0.982 -0.977 -0.961 -0.977 ... |
| time-body-gyroscope-std-Z                       | num |  -0.908 -0.96 -0.964 -0.962 -0.961 ... |
| time-body-gyroscope-jerk-mean-X                 | num |  -0.107 -0.102 -0.1 -0.105 -0.102 ... |
| time-body-gyroscope-jerk-mean-Y                 | num |  -0.0415 -0.0359 -0.039 -0.0381 -0.0404 ... |
| time-body-gyroscope-jerk-mean-Z                 | num |  -0.0741 -0.0702 -0.0687 -0.0712 -0.0708 ... |
| time-body-gyroscope-jerk-std-X                  | num |  -0.919 -0.993 -0.98 -0.975 -0.983 ... |
| time-body-gyroscope-jerk-std-Y                  | num |  -0.968 -0.99 -0.987 -0.987 -0.984 ... |
| time-body-gyroscope-jerk-std-Z                  | num |  -0.958 -0.988 -0.983 -0.984 -0.99 ... |
| time-body-accelerometer-magnitude-mean          | num |  -0.842 -0.977 -0.973 -0.955 -0.967 ... |
| time-body-accelerometer-magnitude-std           | num |  -0.795 -0.973 -0.964 -0.931 -0.959 ... |
| time-gravity-accelerometer-magnitude-mean       | num |  -0.842 -0.977 -0.973 -0.955 -0.967 ... |
| time-gravity-accelerometer-magnitude-std        | num |  -0.795 -0.973 -0.964 -0.931 -0.959 ... |
| time-body-accelerometer-jerk-magnitude-mean     | num |  -0.954 -0.988 -0.979 -0.97 -0.98 ... |
| time-body-accelerometer-jerk-magnitude-std      | num |  -0.928 -0.986 -0.976 -0.961 -0.977 ... |
| time-body-gyroscope-magnitude-mean              | num |  -0.875 -0.95 -0.952 -0.93 -0.947 ... |
| time-body-gyroscope-magnitude-std               | num |  -0.819 -0.961 -0.954 -0.947 -0.958 ... |
| time-body-gyroscope-jerk-magnitude-mean         | num |  -0.963 -0.992 -0.987 -0.985 -0.986 ... |
| time-body-gyroscope-jerk-magnitude-std          | num |  -0.936 -0.99 -0.983 -0.983 -0.984 ... |
| frequency-body-accelerometer-mean-X             | num |  -0.939 -0.977 -0.981 -0.959 -0.969 ... |
| frequency-body-accelerometer-mean-Y             | num |  -0.867 -0.98 -0.961 -0.939 -0.965 ... |
| frequency-body-accelerometer-mean-Z             | num |  -0.883 -0.984 -0.968 -0.968 -0.977 ... |
| frequency-body-accelerometer-std-X              | num |  -0.924 -0.973 -0.984 -0.952 -0.965 ... |
| frequency-body-accelerometer-std-Y              | num |  -0.834 -0.981 -0.964 -0.946 -0.973 ... |
| frequency-body-accelerometer-std-Z              | num |  -0.813 -0.985 -0.963 -0.962 -0.966 ... |
| frequency-body-accelerometer-jerk-mean-X        | num |  -0.957 -0.986 -0.981 -0.979 -0.983 ... |
| frequency-body-accelerometer-jerk-mean-Y        | num |  -0.922 -0.983 -0.969 -0.944 -0.965 ... |
| frequency-body-accelerometer-jerk-mean-Z        | num |  -0.948 -0.986 -0.979 -0.975 -0.983 ... |
| frequency-body-accelerometer-jerk-std-X         | num |  -0.964 -0.987 -0.983 -0.98 -0.986 ... |
| frequency-body-accelerometer-jerk-std-Y         | num |  -0.932 -0.985 -0.971 -0.944 -0.966 ... |
| frequency-body-accelerometer-jerk-std-Z         | num |  -0.961 -0.989 -0.984 -0.98 -0.986 ... |
| frequency-body-gyroscope-mean-X                 | num |  -0.85 -0.986 -0.97 -0.967 -0.976 ... |
| frequency-body-gyroscope-mean-Y                 | num |  -0.952 -0.983 -0.978 -0.972 -0.978 ... |
| frequency-body-gyroscope-mean-Z                 | num |  -0.909 -0.963 -0.962 -0.961 -0.963 ... |
| frequency-body-gyroscope-std-X                  | num |  -0.882 -0.989 -0.976 -0.975 -0.981 ... |
| frequency-body-gyroscope-std-Y                  | num |  -0.951 -0.982 -0.977 -0.956 -0.977 ... |
| frequency-body-gyroscope-std-Z                  | num |  -0.917 -0.963 -0.967 -0.966 -0.963 ... |
| frequency-body-accelerometer-magnitude-mean     | num |  -0.862 -0.975 -0.966 -0.939 -0.962 ... |
| frequency-body-accelerometer-magnitude-std      | num |  -0.798 -0.975 -0.968 -0.937 -0.963 ... |
| frequency-body-accelerometer-jerk-magnitude-mean| num |  -0.933 -0.985 -0.976 -0.962 -0.977 ... |
| frequency-body-accelerometer-jerk-magnitude-std | num |  -0.922 -0.985 -0.975 -0.958 -0.976 ... |
| frequency-body-gyroscope-magnitude-mean         | num |  -0.862 -0.972 -0.965 -0.962 -0.968 ... |
| frequency-body-gyroscope-magnitude-std          | num |  -0.824 -0.961 -0.955 -0.947 -0.959 ... |
| frequency-body-gyroscope-jerk-magnitude-mean    | num |  -0.942 -0.99 -0.984 -0.984 -0.985 ... |
| frequency-body-gyroscope-jerk-magnitude-std     | num |  -0.933 -0.989 -0.983 -0.983 -0.983 ... |

##Sources
Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. A Public Domain Dataset for Human Activity Recognition Using Smartphones. 21th European Symposium on Artificial Neural Networks, Computational Intelligence and Machine Learning, ESANN 2013. Bruges, Belgium 24-26 April 2013.
