# downloads zip file and loads training and test data, 
# as well as label names, into memory

temp = tempfile()
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip", temp)
Xtrain = read.table(unz(temp, "UCI HAR Dataset/train/X_train.txt" ))
Ytrain = read.table(unz(temp, "UCI HAR Dataset/train/y_train.txt" ))
Xtest = read.table(unz(temp, "UCI HAR Dataset/test/X_test.txt" ))
Ytest = read.table(unz(temp, "UCI HAR Dataset/test/y_test.txt" ))
activity_labels = read.table(unz(temp, "UCI HAR Dataset/activity_labels.txt" ))
subj_test = read.table(unz(temp, "UCI HAR Dataset/test/subject_test.txt" ))
subj_train = read.table(unz(temp, "UCI HAR Dataset/train/subject_train.txt" ))
features = read.table(unz(temp, "UCI HAR Dataset/features.txt" ))
unlink(temp)

# combines all X data; renames features with descriptive names from 
# features.txt file

allX = rbind(Xtrain, Xtest)
names(allX) = features[,2]

# combines all subject data

allsubj = rbind(subj_train, subj_test)
names(allsubj)= "subject_id"

# creates logical vectors of features that contain the strings
# "mean()" or "std()", then excludes all features except those 
# included in one of those logical vectors

means = grepl("mean\\(\\)", features[,2])
sds = grepl("std\\(\\)", features[,2])
only_mean_sd_X = allX[sds | means]

# combines Y data, then merges Y data with activity_labels to 
# label each row with a human readable activity

allY = rbind(Ytrain, Ytest)
names(allY) = "activity_id"
names(activity_labels)= c("activity_code","activity_label")
labeledY = merge(allY, activity_labels, by.x="activity_id", by.y="activity_code")

# combines X data (which has only mean() and std()), Y data (which has
# labels of activities), and subject data

alldata = cbind (only_mean_sd_X, labeledY, allsubj)

# creates a tidy data set from alldata. This is accomplished by splitting
# alldata into groups by activity and subject, then finding the mean of
# each column for each group, and then re-assembling those vectors into
# a single data frame with each row properly labeled. Each combination of 
# subject and activity found in the data set has it's own row.

splits = split(alldata,list(alldata$activity_id, alldata$subject))
results = vector("list", length(splits))
subject_id = vector()
activity_id = vector()
for(i in seq_along(splits)) {
  sc = strsplit(names(splits[i]), '\\.')
  subject_id = c(subject_id, as.numeric(sc[[1]][2]))
  activity_id = c(activity_id, as.numeric(sc[[1]][1]))
  sp = splits[[i]]  
  results[[i]] = colMeans(sp[,1:66])
}
subj_act = cbind(subject_id, activity_id)
subj_act = merge(subj_act, activity_labels, by.x="activity_id", by.y="activity_code")
results = as.data.frame(do.call("rbind", results))
results = cbind(subj_act, results)
results = results[complete.cases(results),]


# the resulting tidy dataset is then written to the current 
# working directory as a csv file, though with a "txt" extension
# because that's what the coursera website requires.

write.csv(results,file="coursera_clean_data.txt", row.names = FALSE)
