run_analysis.R() 
{
  ##pull in relevant libraries
  library(reshape2)

  
  ##Folder created and file downloaded
  if(!file.exists("./GettingData")){dir.create("./GettingData")}
  fileurl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
  download.file(fileurl,destfile = "./GettingData/Datazip.zip")
  unzip(zipfile = "./GettingData/Datazip.zip", exdir = "./GettingData")
  
  ##Reading features and activity files
  features <- read.table("./GettingData/UCI HAR Dataset/features.txt")
  activity <- read.table("./GettingData/UCI HAR Dataset/activity_labels.txt")
  
  ##Reading "test" tables
  test_subject <- read.table("./GettingData/UCI HAR Dataset/test/subject_test.txt")
  test_X <- read.table("./GettingData/UCI HAR Dataset/test/X_test.txt")
  test_Y <- read.table("./GettingData/UCI HAR Dataset/test/Y_test.txt")

  ##Reading "train" tables
  train_subject <- train_subject <- read.table("./GettingData/UCI HAR Dataset/train/subject_train.txt")
  train_X <- read.table("./GettingData/UCI HAR Dataset/train/X_train.txt")
  train_Y <-read.table("./GettingData/UCI HAR Dataset/train/Y_train.txt")
  
  ##Bind together the data into one table
  test <- cbind(test_subject, test_Y, test_X)
  train <- cbind(train_subject, train_Y, train_X)
  data <- rbind(test,train)
  
  ##Label all the columns
  colnames(data) <- c("subject","activity",as.character(features[,2]))
  
  ##remove columns not related to subject, activity, means or stdev
  DataColumns <- colnames(data)
  WantedColumns <- grep("subject|activity|mean|std",DataColumns)
  data <- subset(data,select = WantedColumns)
  
  ##Give descriptive names to the activity column
  data$activity[data$activity == 1] <- "Walking"
  data$activity[data$activity == 2] <- "Walking Upstairs"
  data$activity[data$activity == 3] <- "Walking Downstairs"
  data$activity[data$activity == 4] <- "Sitting"
  data$activity[data$activity == 5] <- "Standing"
  data$activity[data$activity == 6] <- "Laying"
  data$activity <- as.factor(data$activity)
  
  ##Provide more descriptive data names, and remove "()"
  names(data) <- gsub("^t","time",names(data))
  names(data) <- gsub("^f","frequency",names(data))
  names(data) <- gsub("Acc","accelerator",names(data))
  names(data) <- gsub("Gyro","gyroscope",names(data))
  names(data) <- gsub("[()]","",names(data))
  
  data$subject <- as.factor(data$subject)
  
  ##create a tidy data set with the average of each variable 
  ##for each activity and each subject.
  tidydata <- data[,3:81]
  tidydata <- aggregate(tidydata,by=list(activity = data$activity, subject = data$subject), mean)
  
  ##Write tidy data set into created folder
  write.table(tidydata, './GettingData/tidyData.txt',row.names=TRUE,sep='\t')
}
