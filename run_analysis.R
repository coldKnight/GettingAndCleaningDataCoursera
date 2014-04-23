# Author: Vatsal Srivastava    E-mail: vatsal410@gmail.com
# This script is part of the Peer Assignment for Getting and Cleaning Data course offered on Coursera by John Hopkins Bloomberg School of Public Health

setwd("E:/Downloads/Data Science Specialization/Getting and Cleaning Data/PeerAssessment/UCI HAR Dataset")      # setting the working directory

# reading all the required files
subTest <- read.table("subject_test.txt")      
xTest <- read.table("X_test.txt")
yTest <- read.table("Y_test.txt")

subTrain <- read.table("subject_train.txt")
xTrain <- read.table("X_train.txt")
yTrain <- read.table("Y_train.txt")

feature <- read.table("features.txt")

# merging together the columns of all the read files one by one
bigTest <- cbind(yTest,subTest)
bigTrain <- cbind(yTrain,subTrain)

finalTest <- cbind(bigTest,xTest)
finalTrain <- cbind(bigTrain,xTrain)

finalSet <- rbind(finalTrain,finalTest)

# creating a data frame with data present in the features.txt for the purpose of getting the column names
headingFeature <- data.frame(V2="activity")
h <- data.frame(V2="subject")
headingFeature <- rbind(headingFeature,h)
f <- data.frame(feature$V2)
colnames(f) <- "V2"
featureHeading <- rbind(headingFeature,f)
headTest <- featureHeading
tapply(headTest$V2,1:563,as.character)

names(finalSet) <- headTest[,1]
namedFinalSet <- finalSet       # this is the data set with all the proper column names but not descriptive activity names

# setting the activity names using the data from the activity_labels.txt file
useDescriptName <- gsub("1","WALKING",namedFinalSet$activity)
useDescriptName <- gsub("2","WALKING_UPSTAIRS",useDescriptName)
useDescriptName <- gsub("3","WALKING_DOWNSTAIRS",useDescriptName)
useDescriptName <- gsub("4","SITTING",useDescriptName)
useDescriptName <- gsub("5","STANDING",useDescriptName)
useDescriptName <- gsub("6","LAYING",useDescriptName)

useDescriptName <- data.frame(useDescriptName)
colnames(useDescriptName) <- "activity"
namedFinalSet[,1] <- useDescriptName[,1]
cleanDataSet <- namedFinalSet           # this is the data set with all the proper column names and decriptive activity labels

# extracting all the columns with mean or std in them --- the numbers were obtained using <grep("mean",names(cleanDataSet))> and <grep("std",names(cleanDataSet))>
cleanDataSet <- cleanDataSet[,c(1,2,3,4,5,6,7,8,43,44,45,46,47,48,83,84,85,86,87,88,123,124,125,126,127,128,163,164,165,166,167,168,203,204,216,217,229,230,242,243,255,256,268,269,270,271,272,273,296,297,298,347,348,349,350,351,352,375,376,377,426,427,428,429,430,431,454,455,456,505,506,515,518,519,531,532,541,544,545,554)]

library(plyr)
cleanDataSet$activity <- as.character(cleanDataSet$activity)    # converting activity names to characters
arrangedDataSet <- arrange(cleanDataSet,subject,activity)       # arranging the dataset according to increasing subject number and then activities 

# relevent data set for the Part 2 of the assignment
write.csv(arrangedDataSet[1:80],"arrangedDataSet.csv")

library(reshape2)
meltedDataSet <- melt(arrangedDataSet,id=c("activity","subject"))

decastDataSet <- dcast(meltedDataSet,subject ~ activity + variable,mean)

# relevent data set for the Part 5 of the assignment
write.csv(decastDataSet,"tidyDataSet.csv")

# the tidyDataSet.csv file can now be opened using Microsoft Excel or Libre Office and published into pdf format for submission










