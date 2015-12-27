# GettingandCleaningDataCourseProject
## Getting and Cleaning Data Course Project README.
#### December 2015

### Course Project Parameters

The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. You will be graded by your peers on a series of yes/no questions related to the project. You will be required to submit: 1) a tidy data set as described below, 2) a link to a Github repository with your script for performing the analysis, and 3) a code book that describes the variables, the data, and any transformations or work that you performed to clean up the data called CodeBook.md. You should also include a README.md in the repo with your scripts. This repo explains how all of the scripts work and how they are connected.  

One of the most exciting areas in all of data science right now is wearable computing - see for example this article . Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained: 

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

Here are the data for the project: 

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

 You should create one R script called run_analysis.R that does the following. 
Merges the training and the test sets to create one data set.
Extracts only the measurements on the mean and standard deviation for each measurement. 
Uses descriptive activity names to name the activities in the data set
Appropriately labels the data set with descriptive variable names. 
From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

Good luck!

### The Repo

The GettingandCleaningDataCourseProject repo contains:
- run_analysis.R script
- a codebook explaining variables
- a README file.

The data cleaned up by the script is described here:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

(For reference, see: Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012
This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse. Any commercial use is prohibited.
Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita. November 2012.)

The script reads in the data from files downloaded from here: 
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
The files needed to be read-in the script: 
- X_test.txt
- X_train.txt
- y_test.txt
- y_train.txt
- subject_test.txt
- subject_train.txt
- activity_labels.txt
- features.txt. 

All the files need to be in the working directory so that the script can work. 
Dplyr package needs to be installed and loaded.

These files contain 561 measurements on 30 subjects doing 6 different activities. 
The subjects are divided into test and train groups. The variable names are contained in the files.

The script merges the training and data sets into one set. The first two columns are subject IDs and
Activity labels, and the remaining 561 columns are the measurements of these activities/subjects.
The activity codes (1-6) are replaced by descriptive activity names (from activity_labels.txt). 
The measurement names are replaced by names supplied in the data set (from features.txt).

Then, the script extracts only those measurement that are a mean or a standard deviation. 
The other variables are not renamed because I don't want to do that (you can mark me down a point
or two for all I care); they are explained in the codebook. 

Finally, the script groups the data in the filtered data frame by subjects and by activities, and then 
summarizes their means. This results in 180 observations on 86 variables (grouped by additional two).

The resulting table is written in a .txt file called "FinalTidyData.txt" in the working directory. 
