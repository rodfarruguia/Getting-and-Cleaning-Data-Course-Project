Code Book for Course Project
Overview

Source of the original data:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

Full Description at the site where the data was obtained:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Process

The script run_analysis.R performs the following process to clean up the data and create tiny data sets:
    Checks to see if the data files are in the working directory.
    
    Downloads data files if they are missing from the url provided.

    Merge the train and test sets to create one data set.

    Reads features.txt and uses only the measurements on the mean and standard deviation for each measurement.

    Reads activity_labels.txt and applies human readable activity names to name the activities in the data set.

    Labels the data set with descriptive names. 

    Merges the features with activity labels and subject IDs. The result is saved as tidyDataPart4.txt.

    The average of each measurement for each activity and each subject is merged to a second data set, saved as tidyDataPart5.txt

Variables

    xtest- table contents of test/X_test.txt
    xtrain - table contents of train/X_train.txt
    xboundtrainandtest - Combined data set of the two above variables.
    subjecttest - table contents of test/subject_test.txt
    subjecttrain - table contents of test/subject_train.txt
    subjectbountrainandtest - Combined data set of the two above variables
    ytest - table contents of test/y_test.txt
    ytrain - table contents of train/y_train.txt
    yboundtrainandtest - Combined data set of the two above variables.
    features - table contents of features.txt
    featuresfiltered - Name columns derived from features
    activities -  Human readable labels data table. 
    tidyData - subsetted, human-readable data ready for output.
    part5data - subsetted from above for std and mean only. 
    featuresfiltetered - contains just col V2 of features. 
    datameananstd - Combined data set with mean and std values
    
## Measurements

"subject" "activity" "tbodyacc-mean-x" "tbodyacc-mean-y" "tbodyacc-mean-z" "tbodyacc-std-x" "tbodyacc-std-y" "tbodyacc-std-z" "tgravityacc-mean-x" "tgravityacc-mean-y" "tgravityacc-mean-z" "tgravityacc-std-x" "tgravityacc-std-y" "tgravityacc-std-z" "tbodyaccjerk-mean-x" "tbodyaccjerk-mean-y" "tbodyaccjerk-mean-z" "tbodyaccjerk-std-x" "tbodyaccjerk-std-y" "tbodyaccjerk-std-z" "tbodygyro-mean-x" "tbodygyro-mean-y" "tbodygyro-mean-z" "tbodygyro-std-x" "tbodygyro-std-y" "tbodygyro-std-z" "tbodygyrojerk-mean-x" "tbodygyrojerk-mean-y" "tbodygyrojerk-mean-z" "tbodygyrojerk-std-x" "tbodygyrojerk-std-y" "tbodygyrojerk-std-z" "tbodyaccmag-mean" "tbodyaccmag-std" "tgravityaccmag-mean" "tgravityaccmag-std" "tbodyaccjerkmag-mean" "tbodyaccjerkmag-std" "tbodygyromag-mean" "tbodygyromag-std" "tbodygyrojerkmag-mean" "tbodygyrojerkmag-std" "fbodyacc-mean-x" "fbodyacc-mean-y" "fbodyacc-mean-z" "fbodyacc-std-x" "fbodyacc-std-y" "fbodyacc-std-z" "fbodyaccjerk-mean-x" "fbodyaccjerk-mean-y" "fbodyaccjerk-mean-z" "fbodyaccjerk-std-x" "fbodyaccjerk-std-y" "fbodyaccjerk-std-z" "fbodygyro-mean-x" "fbodygyro-mean-y" "fbodygyro-mean-z" "fbodygyro-std-x" "fbodygyro-std-y" "fbodygyro-std-z" "fbodyaccmag-mean" "fbodyaccmag-std" "fbodybodyaccjerkmag-mean" "fbodybodyaccjerkmag-std" "fbodybodygyromag-mean" "fbodybodygyromag-std" "fbodybodygyrojerkmag-mean" "fbodybodygyrojerkmag-std"

 Activity Labels

* "walking"  1 
* "walkingupstairs" 2
* "walingdownstairs" 3
* "sitting" 4
* "standing" 5
* "laying" 6

Output
tidyData.txt

tidyDataPart4.txt is a 10299x68 data frame.

    The first column contains subject IDs.
    The second column contains activity names.
    The last 66 columns are measurements.
    Subject IDs are integers between 1 and 30.

tidyData2.txt

tidyData2.txt is a 180x68 data frame.

    The first column contains subject IDs.
    The second column contains activity names.
    The averages for each of the 66 attributes are in columns 3-68.
