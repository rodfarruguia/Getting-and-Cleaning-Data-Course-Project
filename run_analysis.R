##checks to see if the data folder exists otherwise downloads to a temporary placeholder , unzips , unlinks and removes the temporary after creation of data containing folder.
if (!file.exists("./UCI HAR Dataset")) {
    temporary <- tempfile()
    download.file(
        "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip",
        temporary
    )
    unzip(temporary)
    unlink(temporary)
    rm(temporary)
}

##Reads a file in table format and creates a data frame from it, with cases corresponding to lines and variables to fields in the file. part 1
ytrain <- read.table("./UCI HAR Dataset/train/y_train.txt")
ytest <- read.table("./UCI HAR Dataset/test/y_test.txt")
xtrain <- read.table("./UCI HAR Dataset/train/X_train.txt")
xtest <-
    read.table("./UCI HAR Dataset/test/X_test.txt", stringsAsFactors = FALSE)
features <- read.table("./UCI HAR Dataset/features.txt")
activitylabels <-
    read.table("./UCI HAR Dataset/activity_labels.txt")
subjecttrain <-
    read.table("./UCI HAR Dataset/train/subject_train.txt")
subjecttest <- read.table("./UCI HAR Dataset/test/subject_test.txt")
## row combining the data.for part 1
xboundtrainandtest <- rbind(xtest, xtrain)
subjectboundtrainandtest <- rbind(subjecttest, subjecttrain)
yboundtrainandtest <- rbind(ytest, ytrain)

## removes object from enviroment
rm(subjecttest, subjecttrain, xtrain, ytrain, xtest, ytest)

## only get the names from the features.txt for part 4
featuresfiltered <- features$V2

## filtering out the colums for std and mean. for part 2 
datameanandstd <-
    grepl("(std|mean[^F])", featuresfiltered, perl = TRUE)
xboundtrainandtest <- xboundtrainandtest[, datameanandstd]
names(xboundtrainandtest) <- featuresfiltered[datameanandstd]
names(xboundtrainandtest) <-
    gsub("\\(|\\)", "", names(xboundtrainandtest))
names(xboundtrainandtest) <- tolower(names(xboundtrainandtest))

## read and add names to dataset. for part 3, 4
activitylabels[, 2] = gsub("_", "", tolower(as.character(activitylabels[, 2])))
yboundtrainandtest[, 1] = activitylabels[yboundtrainandtest[, 1], 2]
names(yboundtrainandtest) <- "activity"
names(subjectboundtrainandtest) <- "subject"

##collect the data to print to tidyData for part 1
tidyData <-
    cbind(subjectboundtrainandtest,
          yboundtrainandtest,
          xboundtrainandtest)
write.table(tidyData, "tidyDataPart4.txt")


## including only data to generate mean and std, print out tidydata for part 5
part5data <-
    tidyData[xor(grepl("mean", names(tidyData)), grepl("std", names(tidyData)))]
tidyData <- cbind(tidyData[, 1:2], part5data)
rm(part5data)
require("dplyr") ## required package.
tidydatapart5 <-
    tidyData %>% group_by(subject, activity) %>% summarise_each(funs(mean))
write.table(tidydatapart5, "tidyDataPart5.txt", row.names = FALSE)
