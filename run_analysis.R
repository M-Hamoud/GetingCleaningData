## Reading data
testData <- read.table("./UCI HAR Dataset/test/X_test.txt")
testActivity <- read.table("./UCI HAR Dataset/test/y_test.txt")
testSubject <- read.table("./UCI HAR Dataset/test/subject_test.txt")
trainData <- read.table("./UCI HAR Dataset/train/X_train.txt")
trainActivity <- read.table("./UCI HAR Dataset/train/y_train.txt")
trainSubject <- read.table("./UCI HAR Dataset/train/subject_train.txt")

## Merging the Two data sets
mergedData <- rbind(trainData,testData)

## Extracting only the measurements on the mean and standard deviation for each measurement. 
DataMeanAndStd <- mergedData[,c(1:6, 41:46, 81:86, 121:126, 161:166, 201, 202, 214, 215, 227, 228, 240, 241, 253, 254, 266:271, 345:350, 424:429, 503, 504, 516, 517, 529, 530, 542, 543)]

## Adding Activity and Subject to the data sets
ActivityFull <- rbind(trainActivity,testActivity)
subjectFull <- rbind(trainSubject,testSubject)
dataFull <- cbind(subjectFull, ActivityFull, DataMeanAndStd)

## Renaming activities in the data set
dataFull[,2] <- factor(dataFull[,2])
library(plyr)
dataFull[,2] <- revalue(dataFull[,2], c("1"="WALKING","2"="WALKING_UPSTAIRS","3"="WALKING_DOWNSTAIRS","4"="SITTING","5"="STANDING","6"="LAYING"))
dataFull[,2] <- as.character(dataFull[,2])

## Relabeling variables
alltitles <- read.table("./UCI HAR Dataset/features.txt")
titles <- alltitles[c(1:6, 41:46, 81:86, 121:126, 161:166, 201, 202, 214, 215, 227, 228, 240, 241, 253, 254, 266:271, 345:350, 424:429, 503, 504, 516, 517, 529, 530, 542, 543),2]
titles <- as.character(titles)
titles2 <- c("Subject", "Activity", titles)
names(dataFull) <- titles2

## Creating independent tidy data
library(reshape2)
dataMelt <- melt(dataFull, id.vars = c("Subject", "Activity") ,measure.vars = titles)
FinalDT <- dcast(dataMelt, Subject + Activity ~ variable , mean)

## Write the data frame to a txt file
write.table(FinalDT, "FinalDT.txt",row.name=FALSE)

