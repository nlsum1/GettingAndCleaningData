# Join the dataset of train and test set
trainX <- read.table("train/X_train.txt")
testX <- read.table("test/X_test.txt")

dataX <- rbind(trainX, testX)

trainY <- read.table("train/Y_train.txt")
testY <- read.table("test/Y_test.txt")

dataY <- rbind(trainY, testY)

subTrain<- read.table("train/subject_train.txt")
subTest <- read.table("test/subject_test.txt")

dataSubject <- rbind(subTrain, subTest)

# get the features name from the features.txt

feature <- read.table("features.txt")

# only select the features with mean or standard deviation label
noOfColumn <- grep("-mean\\(\\)|-std\\(\\)", feature[, 2])

# then subset the X dataset with only the required columns
dataX <- dataX[,noOfColumn]

# Get the activities label from activity_labels.txt
activityLabel <- read.table("activity_labels.txt")

# replace the Y dataset with the activities labels
dataY <- activityLabel[dataY[,1], 2]
dataY <- gsub("_", " ", dataY)

# name some of the variables with approriate names
names(dataSubject) <- "Subject"
names(dataX) <- feature[noOfColumn,2]

# Join all dataset into one cleaned table
cleaned <- cbind(dataSubject, dataY, dataX)

#melted down the dataset
meltedData <- melt(cleaned,measure.vars=names(cleaned[3:68]) )

#then dcast it to get the average value for each subject and each of their activities

finalData <- dcast(meltedData, Subject + dataY ~ variable, mean)

# remove some not-so friendly characters in the variables names 
# such as "()"
colnames(finalData)[2] <- "Activities"
colnames(finalData)[3:68] <- gsub("\\(|\\)", "",colnames(finalData)[3:68])

write.table(finalData, "average_final_data.txt", row.name=FALSE)
