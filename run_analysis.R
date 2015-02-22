library(reshape2)

# 1. Merges the training and the test sets to create one data set.

# read data into respective data frames
test_subject <- read.table("UCI HAR Dataset/test/subject_test.txt", sep="", header=FALSE)
test_x <- read.table("UCI HAR Dataset/test/X_test.txt", sep="", header=FALSE)
test_y <- read.table("UCI HAR Dataset/test/Y_test.txt", sep=",", header=FALSE)

# read data into respective data frames
train_subject <- read.table("UCI HAR Dataset/train/subject_train.txt", sep="", header=FALSE)
train_x <- read.table("UCI HAR Dataset/train/X_train.txt", sep="", header=FALSE)
train_y <- read.table("UCI HAR Dataset/train/Y_train.txt", sep="", header=FALSE)

# Add column name for label files
names(train_y) <- "activity"
names(test_y) <- "activity"

# Add column name for subject files
names(train_subject) <- "subjectID"
names(test_subject) <- "subjectID"

# Add column names for measurement files
feature_names <- read.table("UCI HAR Dataset/features.txt")
names(train_x) <- feature_names[[2]]
names(test_x) <- feature_names[[2]]
# merge files into one data frame
train <- cbind( train_subject, train_y, train_x)
test <- cbind( test_subject, test_y, test_x)
mergedData <- rbind(train, test)

# 2 Extract only the measurements on the mean and standard deviation for each measurement.

#  columns with "mean()" or "std()"
logicalVector <- grepl("mean", names(mergedData)) | grepl("std", names(mergedData))

#enable subjectid and activity
logicalVector[1:2] <- TRUE

# remove unnecessary data columns
mergedData <- mergedData[, logicalVector]
ncol(mergedData)
#names(mergedData)

#3 Uses descriptive activity names to name the activities in the data set

mergedData$activity <- factor(mergedData$activity, labels=c("WALKING", "WALKING_UPSTAIRS", "WALKING_DOWNSTAIRS", "SITTING", "STANDING", "LAYING"))

#4 The data set is already set with descriptive label names in step 1 from feature.txt column 2

#5  tidy data set with the average of each variable for each activity and each subject
long_format_melted <- melt( mergedData, id=c("subjectID","activity"))
output <- dcast( long_format_melted, subjectID+activity ~ variable, mean)

#tidy

# output the result to a file
write.table(output, "output.txt", row.names=FALSE)
