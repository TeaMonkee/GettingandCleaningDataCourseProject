# GettingandCleaningDataCourseProject
## Getting and Cleaning Data Course Project README.
### December 2015

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
