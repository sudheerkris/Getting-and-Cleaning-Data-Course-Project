#Load all necessary packages for data cleaning depending on your session
library(plyr)
#Downloading datasets
if(!file.exists("./data")){dir.create("./data")}
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl,destfile="./data/Dataset.zip")

#Unzipping the dataSet to /data directory that is to be used as WD, the data folder
unzip(zipfile="./data/Dataset.zip",exdir="./data")

#Reading trainings tables

x_train <- read.table("./train/X_train.txt")
y_train <- read.table("./train/y_train.txt")
subject_train <- read.table("./train/subject_train.txt")

#Reading testing tables

x_test <- read.table("./test/X_test.txt")
y_test <- read.table("./test/y_test.txt")
subject_test <- read.table("./test/subject_test.txt")

#Reading feature vector
features <- read.table("./features.txt")

#Reading the activity labels

activityLabels = read.table("./activity_labels.txt")

#Assigning column names

colnames(x_train) <- features[,2] 
colnames(y_train) <-"activityId"
colnames(subject_train) <- "subjectId"

colnames(x_test) <- features[,2] 
colnames(y_test) <- "activityId"
colnames(subject_test) <- "subjectId"

colnames(activityLabels) <- c('activityId','activityType')

#Merging all data in to one combined set

mrg_train <- cbind(y_train, subject_train, x_train)
mrg_test <- cbind(y_test, subject_test, x_test)
setAllInOne <- rbind(mrg_train, mrg_test)

#Extracting the measurements on mean and standard deviation

#Reading column names

colNames <- colnames(setAllInOne)

#Creating vector for defining ID, mean and standard deviation
#Appropriate labeling of the data set with descriptive variable names

mean_and_std <- (grepl("activityId" , colNames) | 
                   grepl("subjectId" , colNames) | 
                   grepl("mean.." , colNames) | 
                   grepl("std.." , colNames) 
)

#Making necessary subset from setAllInOne

setForMeanAndStd <- setAllInOne[ , mean_and_std == TRUE]

#Using descriptive activity names to name the activities in the data set:

setWithActivityNames <- merge(setForMeanAndStd, activityLabels, by='activityId', all.x=TRUE)

#Creating a second independent tidy data set
#Contains average of each variable for each activity and each subject

secondtidyset <- aggregate(. ~subjectId + activityType, setWithActivityNames, mean)
secondtidyset <- secondtidyset[order(secondtidyset$subjectId, secondtidyset$activityId),]

#Writing second tidy data set in txt file

write.table(secondtidyset, "secondtidyset.txt", row.name=FALSE)
