CodeBook for Coursera-Getting and Cleaning Data- Course Project
=
**A. Data Sconce:**
-
The data used in this project is data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained: 
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

And can be downloaded from:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

**B. The project requirements are:**
-
1.	Merges the training and the test sets to create one data set.
2.	Extracts only the measurements on the mean and standard deviation for each measurement. 
3.	Uses descriptive activity names to name the activities in the data set
4.	Appropriately labels the data set with descriptive variable names. 
5.	From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

**C. Instructions for reproducing the results:**
-
**1-** Download and unzip the data from the above link.

**2-** Read the readme.txt and featiures_info.txt file to understand the terms and contents of the data.

**3-** Download the “GCD_Project_megre.R” file and update the working directory path.

**4-** Run GCD_Project_megre.R: this will read and merge all the train and test datasets into an ALL dataset. The script will create directory structure for the ALL dataset similar to the train and test datasets and will save the merged files with exactly the same names with “all” replacing “train” and “test”. The script will print series of “TRUE”s indicating all the commands are executing correctly. Any other output indicates that something is wrong. 

**5-** Download the “GCD_Project_analyze.R” file and update the files paths.

**6-** Run GCD_Project_analyze.R: this will read and analyze the merged data and do the following:
	a. Appropriately labels the data set with descriptive variable names by reading the featuers.txt and use it as column names.
	
	b. Extracts only the measurements on the mean and standard deviation for each measurement and concatenates the subject and Y information to it.
	
	c. Uses descriptive activity names to name the activities in the data set by reading the activity_labels.txt file and replace the Y value with its corresponding activity label.
	
	d. Creates an independent tidy data set with the average of each variable for each activity and each subject and save it to the Tidy_Data.txt.
	





