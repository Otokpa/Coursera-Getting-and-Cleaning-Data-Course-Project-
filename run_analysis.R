

# Get the data ###############################
setwd('~/Documents/R/Coursera/Getting and Cleaning Data/Course Projec/UCI HAR Dataset/')
fileUrl <- 'https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip'
download.file(fileUrl,destfile = 'dataset.zip', method = 'curl')
unzip('dataset.zip')


# load the data ##############################
# test 
Xtest <- read.table('test/X_test.txt', header = F, sep = '')
testSubjectId <- read.table('test/subject_test.txt', header = F, sep = '', col.names = 'subject.id')
testActivityId <- read.table('test/y_test.txt', header = F, sep = '', col.names = 'activity.id')

# labels (features)
labels <- read.table('features.txt', header = F, sep = '', col.names = c('id', 'names'))

# train 
Xtrain <- read.table('train/X_train.txt', header = F, sep = '')
trainSubjectId <- read.table('train/subject_train.txt', header = F, sep = '', col.names = 'subject.id')
trainActivityid <- read.table('train/y_train.txt', header = F, sep= '', col.names = 'activity.id' )

# Merge the training and the test data set #############################
# label the dataset Xtest and column bind it with subject id and activity id
names(Xtest) <- labels$names
testData <- cbind(testSubjectId, testActivityId, Xtest)

# label the dataset Xtrain and column bind it with subject id and activity id
names(Xtrain) <- labels$names
trainData <- cbind(trainSubjectId, trainActivityid, Xtrain)

# Merge train and test data##############################################
data <- rbind(testData, trainData)

# subset all the mean and strandard deviation measurements##############
# identify the mean and standard deviation columns.
meanCols <- grep('mean', names(data), ignore.case = T)
stdCols <- grep('std', names(data), ignore.case = T)

meanNames <- names(data[, meanCols])
stdNames <- names(data[, stdCols])
# subset subject id , activity id and the identified STD and Mean columns.
meanStdData <- data[, c('subject.id', 'activity.id', meanNames, stdNames)]

# Name the activities in the data set with descriptive activity names 
activityNames <- read.table('activity_labels.txt', header = F, sep = '', col.names = c('activity.id', 'activity.name'))
descriptiveData <- merge(meanStdData, activityNames, by.x = 'activity.id', by.y = 'activity.id', all = T)

# label the variables of the  data set with descriptive names by removing: '-() bodybody' from the variables. 
names(descriptiveData) <- gsub('-std', ' Std', names(descriptiveData), ignore.case = T)
names(descriptiveData) <- gsub('-mean', ' Mean', names(descriptiveData), ignore.case = T)
names(descriptiveData) <- gsub('bodybody', 'body', names(descriptiveData), ignore.case = T)
names(descriptiveData) <- gsub('[()]', '', names(descriptiveData), ignore.case = T)
names(descriptiveData) <- gsub('-', ' ', names(descriptiveData), ignore.case = T)
names(descriptiveData)

# Reshape data set with the average of each variable for each activity and each subject.
library(reshape2)
reshapedData <- melt(descriptiveData, id = c('subject.id', 'activity.name', 'activity.id'))
reshapedData$subject.id <- as.factor(reshapedData$subject.id)
reshapedData$activity.id <- as.factor(reshapedData$activity.id)

# From the data set in step 4, creates a second, independent tidy data set with the average of each variable 
# for each activity and each subject.
result <- dcast(reshapedData, subject.id + activity.name + activity.id ~ variable, mean)

# save result table as a text file (activity.txt) 
write.table(result, file = 'activityData.txt', row.names = F)

