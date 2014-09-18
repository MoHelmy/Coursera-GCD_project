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
