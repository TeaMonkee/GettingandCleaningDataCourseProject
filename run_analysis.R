# Make sure that the working directory contains all the files read into tables in this script.
# dplyr package is used in script, so install.packages("dplyr") if it isn't already installed.
library(dplyr)

# All needed files are read into their respective tables.
test <- read.table("X_test.txt", sep = "", stringsAsFactors = FALSE)
train <- read.table("X_train.txt", sep = "", stringsAsFactors = FALSE)
y_test <- read.table("y_test.txt", sep = "", stringsAsFactors = FALSE)
y_train <- read.table("y_train.txt", sep = "", stringsAsFactors = FALSE)
subject_test <- read.table("subject_test.txt", sep = "")
subject_train <- read.table("subject_train.txt", sep = "")
activity_labels <- read.table("activity_labels.txt", sep="")
features <- read.table("features.txt", sep = "", stringsAsFactors = FALSE)

# Subject IDs are bound by row (first test, then train).
subject <- rbind(subject_test, subject_train)

# The subject class is converted into factors, as this will later be needeed in grouping 
# variables using group_by() function.
subject <- as.factor(subject$V1)

# Activities, and actual measurement data are each bound by row respectively (first test, then train).
activity <- rbind(y_test, y_train)
test_train <- rbind(test, train)

# The activity and activity labels are joined so that each activity label can be joined to 
# its own coded number.
# After that, the numbers are dropped as they are no longer needed.
activity <- join(activity, activity_labels)
activity <- activity$V2

# The subjects, activities, and measurement data are bound by column. 
# This finishes the first data set.
test_train <- cbind(subject, activity, test_train)

# The Column names are renamed, first is "Subject_ID", then "Activity", and then 
# the measurement data variables whose names are stored in the features.txt/features table.
features <- rbind("Subject_ID","Activity", features)
colnames(test_train) <- features[,2]

# The data set is filtered; only the first two columns and all measurement 
# data that has either "mean" or "std" (case insensitive) in the column name are kept.
test_train <- test_train[grepl("Subject_ID", features[,2]) | 
                           grepl("Activity", features[,2]) | 
                           grepl("mean", features[,2], ignore.case = TRUE) | 
                           grepl("std", features[,2], ignore.case = TRUE)]

# The filtered set is grouped first by subject, then by activity, and then each variable 
# is summarised according to grouping.
test_train_final <- group_by(test_train, Subject_ID, Activity)
test_train_final <- summarise_each(test_train_final, funs(mean))

# Resulting data set is written in the "FinalTidyData.txt" file in the working directory.
write.table(test_train_final, "FinalTidyData.txt", row.name = FALSE)

# And to test it worked:
test_train_final1 <- read.table("FinalTidyData.txt", header = TRUE, sep ="", stringsAsFactors = FALSE)
View(test_train_final1)