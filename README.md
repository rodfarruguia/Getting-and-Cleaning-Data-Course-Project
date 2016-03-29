## Getting and Cleaning Data Course Project
### Overview
 The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. You will be graded by your peers on a series of yes/no questions related to the project. You will be required to submit: 1) a tidy data set as described below, 2) a link to a Github repository with your script for performing the analysis, and 3) a code book that describes the variables, the data, and any transformations or work that you performed to clean up the data called CodeBook.md. You should also include a README.md in the repo with your scripts. This repo explains how all of the scripts work and how they are connected.

One of the most exciting areas in all of data science right now is wearable computing - see for example this article . Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Here are the data for the project:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

You should create one R script called run_analysis.R that does the following.

1 Merges the training and the test sets to create one data set.
2 Extracts only the measurements on the mean and standard deviation for each measurement.
3 Uses descriptive activity names to name the activities in the data set
4 Appropriately labels the data set with descriptive variable names.
5 From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

### What it does. The run_analysis.R file.
The first part checks to see if the data to work with is there or not , if it is not there it will download it from the url. 

It then reads in table format and uses rbind to combine each subject test and train by row , col , and subject.

From the activities we extract and filter only the names for use. we combine the names with the row col data to replace the v1 values and col names.To make it more descriptive.

filter each col for std and mean and adds the names to the dataset. collects the data to print into tidydatapart4.txt.

filters data again to only show mean and std cols, and outputs to the tidyDataPart5.txt file.

### Usage

Open in RStudio , and source, it will download the data, and generate two files at the end i called tidydatapart4 and tidydatapart5 to answer the part 4 and 5 of the criteria. 


