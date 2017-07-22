
# Getting and Cleaning Data Course Project 
# Author: Abhishek Sinha

# install package data.table if does not exist
if("data.table" %in% installed.packages() ==FALSE)
{
    install.packages("data.table")
}
library(data.table)


# Read Activity Label and Feature List
activity_labels <-read.table(file = "UCI HAR Dataset/activity_labels.txt")[,2]
features<-read.table(file = "UCI HAR Dataset/features.txt")[,2]

# Read train files
train_X <- read.table(file = "UCI HAR Dataset/train/X_train.txt")
train_y <- read.table(file = "UCI HAR Dataset/train/y_train.txt")
train_subject <- read.table(file = "UCI HAR Dataset/train/subject_train.txt")

# Read test files
test_X <- read.table(file = "UCI HAR Dataset/test/X_test.txt")
test_y <- read.table(file = "UCI HAR Dataset/test/y_test.txt")
test_subject <- read.table(file = "UCI HAR Dataset/test/subject_test.txt")

# Update column names train_X and test_X to feature list
names(train_X) <- features
names(test_X) <- features


# Extract features that have 'mean' or 'std' in their name
features_to_use <-grep('mean|std',features)

#subset train_X and test_X and select columns with 'mean' or 'std' in the name
train_X<- train_X[,features_to_use]
test_X<- test_X[,features_to_use]

# Create a new column in train and test to store Activity name
train_y$Activity_Name<-activity_labels[train_y$V1]
names(train_y) <-c("Activity_Id","Activity_Name")

test_y$Activity_Name<-activity_labels[test_y$V1]
names(test_y) <-c("Activity_Id","Activity_Name")


# update column name of subject to "Subject_Id"
names(train_subject)<-c("Subject_Id")
names(test_subject)<-c("Subject_Id")


# Column bind to create test_all and train_all data table
test_all <- cbind(test_subject, test_y, test_X)
train_all <- cbind(train_subject, train_y, train_X)


# Merge train_all and test_all
all_data <- rbind(train_all,test_all)


#Melt Dataset on Subject_Id, Activity_Id, Activity_Name
id_vars<-c("Subject_Id","Activity_Id","Activity_Name")
measure_vars <-colnames(all_data)[4:ncol(all_data)]

melted_data<-melt(all_data, id.vars = id_vars, measure.vars=measure_vars)

# Tidy data to show mean value of each variable for each subject and activity
all_data <- dcast(melted_data, Subject_Id+Activity_Name ~ variable, fun=mean)

#Write data to file
write.table(all_data, file = "all_data.txt", row.names = F)
