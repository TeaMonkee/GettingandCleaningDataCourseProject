# GettingandCleaningDataCourseProject
### December 2015

#### Course Project Parameters
The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. You will be graded by your peers on a series of yes/no questions related to the project. You will be required to submit: 1) a tidy data set as described below, 2) a link to a Github repository with your script for performing the analysis, and 3) a code book that describes the variables, the data, and any transformations or work that you performed to clean up the data called CodeBook.md. You should also include a README.md in the repo with your scripts. This repo explains how all of the scripts work and how they are connected.
One of the most exciting areas in all of data science right now is wearable computing - see for example this article . Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
Here are the data for the project:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
You should create one R script called run_analysis.R that does the following. Merges the training and the test sets to create one data set. Extracts only the measurements on the mean and standard deviation for each measurement. Uses descriptive activity names to name the activities in the data set Appropriately labels the data set with descriptive variable names. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
Good luck!

#### The Repo
The GettingandCleaningDataCourseProject repo contains:
-	run_analysis.R script
-	a codebook 
-	a README file
-	final produced data in the FinalTidyData.txt file.

#### The Data

The data cleaned up by the script is described here: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
(For reference, see: Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012 This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse. Any commercial use is prohibited. Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita. November 2012.)

The source data is further described in the codebook.

#### The R script 

The R script is annotated. The narrative description and steps can be found in the codebook.

#### The Description
All the files need to be in the working directory so that the script can work. Dplyr package needs to be installed and loaded. These files contain 561 measurements on 30 subjects doing 6 different activities. The subjects are divided into test and train groups. The variable names are contained in the files. The script merges the training and data sets into one set. The first two columns are subject IDs and Activity labels, and the remaining 561 columns are the measurements of these activities/subjects. The activity codes (1-6) are replaced by descriptive activity names (from activity_labels.txt). The measurement names are replaced by names supplied in the data set (from features.txt). Then, the script extracts only those measurement that are a mean or a standard deviation; this includes ALL variables whose column name mentions a „mean“ or an „std“ (case insensitive). These variable names are not renamed because I don't want to do that (you can mark me down a point or two for all I care). Finally, the script groups the data in the filtered data frame by subjects and by activities, and then summarizes their means. This results in 180 observations on 86 variables (grouped by additional two). The resulting table is written in a .txt file called "FinalTidyData.txt" in the working directory.
The R script is annotated.

#### The Steps
- Set the working directory
-	Extract all the necessary files in the working directory.
-	Install the necessary packages, if missing.
-	Run the script.
-	Read in the necessary files into R.
-	Bind by row the test and train subjects (in the exact order: subject_test, subject_train) into one table (subject).
-	Convert subject class to factor.
-	Bind by row the test and train activities (in the exact order: y_test, y_train) into one table (activity).
-	Bind by row the test and train data sets (in the exact order: test, train) into one table (test_train).
-	Join the activity list with the activity labels; extract only the resulting label list.
-	Bind by column the subject, activity, and test_train tables.
-	Bind by row the strings „Subject_ID“ and „Activity“, and features.
-	Use colnames to assign the second column list of features as column names to the test_train table.
-	 Filter the test_train tables, keeping only the first two columns and any column that contains either „mean“ or „std“ (case insensitive) in the column name.
-	Group the filtered table by Subject_ID and Activity.
-	Summarise the mean of each variable.
-	Write the resulting table in a .txt file, with row.name set to FALSE.


