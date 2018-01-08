## Samsung data must be in the working directory.
## Extract test features data set.
dat1 <- read.table("./UCI HAR Dataset/test/X_test.txt")
## Extract training features data set.
dat2 <- read.table("./UCI HAR Dataset/train/X_train.txt")
## Extract test activity data set.
lab1 <- read.table("./UCI HAR Dataset/test/y_test.txt")
## Extract training activity data set.
lab2 <- read.table("./UCI HAR Dataset/train/y_train.txt")
## Extract test subject data set.
sub1 <- read.table("./UCI HAR Dataset/test/subject_test.txt")
## Extract training subject data set.
sub2 <- read.table("./UCI HAR Dataset/train/subject_train.txt")
## Extract activity labels data set.
act <- read.table("./UCI HAR Dataset/activity_labels.txt")
## Extract features data set.
mainlab <- read.table("./UCI HAR Dataset/features.txt")
## Combine test and training features data sets.
merdat <- rbind(dat1,dat2)
## Extract features with mean  and std from data set.
meanstd <- grep("std\\(|mean\\(",mainlab$V2)
dat3 <- merdat[,meanstd]
## Convert activity labels into descriptive names in data set.
name_act <- function(x) {act$V2[act$V1 == x]}
## Combine test and training activity data sets.
colact <- sapply(c(lab1$V1,lab2$V1),name_act)
## Combine test and training subject data sets.
colsub <- c(sub1$V1,sub2$V1)
## Combine subject, activity, and features data sets.
dat3 <- cbind(colsub,colact,dat3)
## Label data set with descriptive variable names.
colnames(dat3) <- c("subject","activity",as.character(mainlab$V2[meanstd]))
## Create tidy data set with the average of each variable for each activity and each subject.
tidy_data <- aggregate(dat3[,3:dim(dat3)[2]], list(activity = dat3$activity, subject = dat3$subject),mean)
## Transform tidy data set as a txt file.
write.table(tidy_data, file = "./tidy_data.txt", row.name=FALSE)