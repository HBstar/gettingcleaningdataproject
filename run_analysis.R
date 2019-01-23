
##library "dplyr" package
library(dplyr)
package_version(R.version)
##[1] '3.5.2'
packageVersion("dplyr")
##[1] '0.7.8'

##download the file and unzip it
fileurl<-"https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
if(!file.exists("data")){dir.create("data")}
download.file(fileurl, destfile="./data/dataset.zip")
zipfile<-"./data/dataset.zip"
unzip(zipfile, exdir="./data")

##load activity lables from the file, the file is only for reading, not used next
activitylabel<-read.table("./data/UCI HAR Dataset/activity_labels.txt")

##load the test data set and its activities and subjects into individual dataframes
testdata<-read.table("./data/UCI HAR Dataset/test/X_test.txt")
testactivity<-read.table("./data/UCI HAR Dataset/test/y_test.txt")
testsubject<-read.table("./data/UCI HAR Dataset/test/subject_test.txt")

##rename variable names to "activity" and "subject"
testactivity<-rename(testactivity, activity=V1)
testsubject<-rename(testsubject, subject=V1)

##bind the test data set with activity and suject sets
##reorder the column names by using "select"
totaltest<-mutate(subject=testsubject$subject, activity=testactivity$activity, testdata)
totaltest<-select(totaltest, "subject","activity", everything())

##load the train data set and its activities and subjects into individual dataframes
traindata<-read.table("./data/UCI HAR Dataset/train/X_train.txt")
trainactivity<-read.table("./data/UCI HAR Dataset/train/y_train.txt")
trainsubject<-read.table("./data/UCI HAR Dataset/train/subject_train.txt")

##rename variable names to "activity" and "subject"
trainactivity<-rename(trainactivity, activity=V1)
trainsubject<-rename(trainsubject, subject=V1)

##bind the train data set with activity and suject sets
##reorder the column names by using "select"
totaltrain<-mutate(subject=trainsubject$subject, activity=trainactivity$activity, traindata)
totaltrain<-select(totaltrain, "subject","activity", everything())

##merge test and train data sets
total1<-merge(totaltest, totaltrain, all=TRUE)

##read from the feature table 
##grep all features that have "mean" and "std" by their row numbers and give them to "n"
##sort "n" in the increasing order
##get the character list for required features
##set "m" to be equal to "n+2" for subsetting required columns from total1
feature<-read.table("./data/UCI HAR Dataset/features.txt")
n<-c(grep("[Mm]ean",as.character(feature[,2])),grep("std", as.character(feature[,2])))
n<-sort(n)
featureneed<-as.character(feature[,2][n])
m=n+2
m<-sort(m)

##select required columns from total1
##rename slected columns by using "featureneed" list
##labels the data set with descriptive variable names
total2<-select(total1, subject, activity, m)
names(total2)[3:88]<-featureneed

##uses descriptive activity names to name the activities in the data set
total2$activity<-factor(total2$activity, levels=c(1,2,3,4,5,6),labels=c("WALKING", "WALKING_UPSTAIRS","WALKING_DOWNSTAIRS","SITTING","STANDING","LAYING"), ordered = TRUE)

##creates a new data set 
##the data set is with the average of each variable for each activity and each subject
totalgroup<-group_by(total2,subject,activity)
total<-summarise_at(totalgroup,.vars=names(totalgroup[3:88]),.funs=c(average="mean"))

##write the final table into a txt file
write.table(total,file="total.txt",row.name=FALSE)

