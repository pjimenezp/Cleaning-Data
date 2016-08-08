Getting and cleaning data

For creating a tidy data set of wearable computing data originally from http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Files included:
	•	README.md 
	•	CodeBook.md : codebook describing variables/columns
	•	run_analysis.R : R Script
	•	TidyData.txt : Exported tidy data

run_analysis.R Script Goals

This script perform the following:

Step 1 : Read data from files and Merge the training and the test sets to create one data set.

Step 2: Read features file and Extract only the measurements on the mean and standard deviation for each measurement.
   
Step 3: Read activity_labels file and Use descriptive activity names to name the activities in the data set

Step 4: Appropriately labels the data set with descriptive variable names.

Step 5: From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

The working directory is UCI HAR Dataset that contains the following files and folders:
	•	activity_labels.txt
	•	features_info.txt
	•	features.txt
	•	README.txt
	•	test/
	•	train/
