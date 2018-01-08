## Getting and Cleaning Data Project

The purpose of this project is to clean a data set collected from the accelerometers from the Samsung Galaxy S smartphone.

Here are the data for the project: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

The  R script run_analysis.R is created to do the following:
1. Extract test and training features, activity, and subject data sets from the Samsung data folder.
2. Merge the test and training data sets to create one data set.
3. Extract only the measurements on the mean and standard deviation for each features variable.
4. Convert activity labels into descriptive activity names in the data set.
5. Label the data set with descriptive variable names.
6. Creates a tidy data set with the average of each variable for each activity and each subject.

The result is shown in the file tidy_data.txt.
