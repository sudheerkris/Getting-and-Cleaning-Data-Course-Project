## Project details

The purpose of this script/project is to demonstrate ability to collect, work with, and clean a data set.

## Source data

One of the most exciting areas in all of data science right now is wearable computing. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Here are the data for the project:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

## About the script

R script called run_analysis.R that does the following:

1. Merging the training and the test sets to create one data set.
  1.1 Reading files 
	1.1.1 Reading training tables
	1.1.2 Reading testing tables
	1.1.3 Reading feature vector
	1.1.4 Reading activity labels
  1.2 Assigning column names
  1.3 Merging all data in to one set [setAllInOne]
2. Extracting only the measurements on the mean and standard deviation for each measurement
  2.1 Reading column names  
  2.2 Create vector for defining ID, mean and standard deviation
  2.3 Making necessary subset from setAllInOne [setForMeanAndStd]
3. Using descriptive activity names to name the activities in the data set [setWithActivityNames]
4. Appropriately labeling the data set with descriptive variable names (covered in section 2)
5. Creating a second, independent tidy data set with the average of each variable for each activity and each subject
  5.1 Making second tidy data set [secondtidyset]
  5.2 Writing second tidy data set in txt file [secondtidyset.txt]

## About variables:
* 'x_train', 'y_train', 'x_test', 'y_test', 'subject_train' and 'subject_test' contain the data from the downloaded files.
* 'x_data', 'y_data' and 'subject_data' merge the previous datasets to further analysis.
* 'features' contains the correct names for the 'x_data' dataset, which are applied to the column names
 
