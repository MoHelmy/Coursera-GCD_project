# Load all data 
x <- read.csv("~/Documents/GetingandCleaningDataProject/UCI HAR Dataset/all/X_all.txt",header = F,sep = "")
y <- read.csv("~/Documents/GetingandCleaningDataProject/UCI HAR Dataset/all/y_all.txt",header = F,sep = ' ')
subject <- read.csv("~/Documents/GetingandCleaningDataProject/UCI HAR Dataset/all/subject_all.txt",header = F,sep = ' ')

# Read featuers.txt and use it as names
f <- read.csv("~/Documents/GetingandCleaningDataProject/UCI HAR Dataset/features.txt",header = F,sep = ' ')

# 4- Appropriately labels the data set with descriptive variable names. 
f$V2 <- gsub('-mean', 'Mean', f$V2)
f$V2 <- gsub('-std', 'Std', f$V2)
f$V2 <- gsub('[-()]', '', f$V2)
names(x) <- as.factor(f[[2]])
# Merge X, sunject and Y into one dataframe  
all <- cbind(subject, y, x)
colnames(all)[[1]] <- 'Subject'
colnames(all)[[2]] <- 'Y'

## 2- Extracts only the measurements on the mean and standard deviation for each measurement
data_mead_std <- all[, grep("Subject|.*Mean.*|.*Std.*", names(all))]
data_mead_std <- cbind(all[[2]], data_mead_std)
colnames(data_mead_std)[[1]] <- 'Y'
## 3- Uses descriptive activity names to name the activities in the data set
# Read activities lables
activ_lab <- read.csv("~/Documents/GetingandCleaningDataProject/UCI HAR Dataset/activity_labels.txt",header = F,sep = ' ')
names(activ_lab) <- c('Y', 'ActivityLable')
final <- merge (activ_lab, data_mead_std, by='Y')

## 5- From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
tidy_data <- aggregate(final,by=list(Activity = final$ActivityLable, Subject=final$Subject), mean)
tidy_data$Y <- NULL
tidy_data$ActivityLable <- NULL
# save tidy data
write.table(tidy_data, "~/Documents/GetingandCleaningDataProject/UCI HAR Dataset/Tidy_Data.txt", sep="\t")



