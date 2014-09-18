# GCDProject 
### 1- Merges the training and the test sets to create one data set

# Change working directory
setwd('~/Documents/GetingandCleaningDataProject/UCI HAR Dataset/')

# Create All directory and subdirectory
dir.create(paste0(getwd(), '/', 'all'))
dir.create(paste0(getwd(), '/', 'all/Inertial Signals'))


# Load the testing and trainng data sets
train_folder <- 'train'
test_folder <- 'test'
# Get all files in test/Inertial Signals folder 
files <- list.files(path=paste0(getwd(),'/test/Inertial Signals'), pattern = "*.txt", all.files = T, recursive = T, include.dirs = T)

for(f in 2: length(files))
  {
      
      test_file <- paste0(getwd(),'/test/Inertial Signals', '/',files[f])
      train_file <- gsub('test', 'train', test_file)
      all_file <- gsub('test', 'all', test_file)

      # Copy test file to all foler
      print (file.copy(test_file, all_file))
      # Append the train file to the test file in the all directory
      print (file.append(all_file, train_file))

  }
# Get all files in test folder 
files <- list.files(path=paste0(getwd(),'/test/'), pattern = "*.txt")
for(f in files)
  { 
    test_file <- paste0(getwd(),'/test/', f)
    train_file <- gsub('test', 'train', test_file)
    all_file <- gsub('test', 'all', test_file)
    # Copy test file to all foler
    print (file.copy(test_file, all_file))
    # Append the train file to the test file in the all directory
    print (file.append(all_file, train_file))
     
  }
  
# Load all data for the rest of the analysis
x <- read.csv(paste0(getwd(), '/', 'all'), "/X_all.txt",header = F,sep = "")
y <- read.csv(paste0(getwd(), '/', 'all'), "/y_all.txt",header = F,sep = ' ')
subject <- read.csv(paste0(getwd(), '/', 'all'), "/subject_all.txt",header = F,sep = ' ')

# Read featuers.txt and use it as names
f <- read.csv(paste0(getwd(), '/'), "features.txt",header = F,sep = ' ')

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
activ_lab <- read.csv(paste0(getwd(), '/'), "/activity_labels.txt",header = F,sep = ' ')
names(activ_lab) <- c('Y', 'ActivityLable')
final <- merge (activ_lab, data_mead_std, by='Y')

## 5- From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
tidy_data <- aggregate(final,by=list(Activity = final$ActivityLable, Subject=final$Subject), mean)
tidy_data$Y <- NULL
tidy_data$ActivityLable <- NULL
# save tidy data
write.table(tidy_data, paste0(getwd()), "/Tidy_Data.txt", sep="\t")



