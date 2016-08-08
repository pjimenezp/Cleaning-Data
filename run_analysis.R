##  Step 1 : Read data from files and Merge the training and the test sets to create one data set.

train.subject <- read.table("train/subject_train.txt")
train.set<- read.table("train/X_train.txt")
train.label<- read.table("train/y_train.txt")

test.subject <-read.table("test/subject_test.txt")
test.set<-read.table("test/X_test.txt")
test.label<-read.table("test/y_test.txt")

dtt <- rbind(cbind(test.subject,test.label,test.set),cbind(train.subject,train.label,train.set))

## Step 2: Read features file and Extract only the measurements on the mean and standard deviation for each measurement.

  features <- read.table("features.txt")
  ##Adding name to the columns
  names(features) <- c('fId', 'fName')
  idxFeatures <- grep("-mean\\(\\)|-std\\(\\)", features$fName) 
 
  dtt.ms <- dtt[, idxFeatures]
   
## Step 3: Read activity_labels file and Use descriptive activity names to name the activities in the data set
   
	activityNames <- read.table("activity_labels.txt")
    dtt.ms[,2] <- activityNames[dtt.ms[,2], 2]

## Step 4: Appropriately labels the data set with descriptive variable names.

	colnames(dtt)[1]<-"Subject"
	colnames(dtt)[2]<-"Activity"
	## newNames <- c("Subject","Activity",features$fName[idxFeatures]) It's printing the index instead of names
	colnames(dtt.ms)[1]<-"Subject"
	colnames(dtt.ms)[2]<-"Activity"
	
## Step 5: From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

      dtt.means <- aggregate(dtt.ms[,3:ncol(dtt.ms)],by=list(subject=dtt.ms[,1],label=dttl.ms[,2]),mean)
      
## Output TidyData

write.table(format(dtt.means, scientific=T), "TidyData.txt",
+             row.names=F, col.names=F, quote=2)


 
      