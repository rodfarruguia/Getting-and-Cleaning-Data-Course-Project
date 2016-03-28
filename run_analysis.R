#downloads to a temporary placeholder , unzips , unlinks and removes the temporary after file creation of data containing folder.
#temporary <- tempfile()
#download.file(
#    "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip",
#    temporary
#)
#unzip(temporary)
#unlink(temporary)
#rm(temporary)

y_train <- read.table("UCI HAR Dataset/train/y_train.txt", quote="") 