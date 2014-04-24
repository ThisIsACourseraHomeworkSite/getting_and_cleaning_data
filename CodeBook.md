CodeBook
----------------------
### The run_analysis.R script downloads a dataset, transforms the data, and outputs a tidy data set. That dataset is a collection of measurements from Samsung Galaxy S smartphone accelerometers measuring 30 subjects engaged in one of 6 activities.
## Data Transformation
* Data was downloaded from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip , which is the data created for the following project: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones . Further information on the project can be found there.
* Data was downloaded in a zip file; test and training data, including both measurements and test subject/activity, was compiled together and properly labelled according to the original dataset.
* Data on means and standard deviations was selected from the dataset by searching for only those column names that contain strings of "mean()" or "std()". This resulted in 66 columns of measurements.
* The resulting data was split into groups based on every unique combination of subject and activity. 
* The mean value of each column in each group was calculated. 
* A tidy dataset was generated that includes a row for each available activity/subject combination, with each row including the activity id and label, the subject, and the mean of each of the 66 columns for that activity/subject combination.

## Variables
### All variables except subject_id, activity_id, and activity_label are derived from measurements from the accelerometers. The variables measure acceleration along the X, Y, or Z axis.

* subject_id - id number of the subject 
* activity_id - id number of the activity the subject engaged in
* activity_label - descriptive label of activity
* tBodyAcc-mean()-X
* tBodyAcc-mean()-Y
* tBodyAcc-mean()-Z
* tBodyAcc-std()-X
* tBodyAcc-std()-Y
* tBodyAcc-std()-Z
* tGravityAcc-mean()-X
* tGravityAcc-mean()-Y
* tGravityAcc-mean()-Z
* tGravityAcc-std()-X
* tGravityAcc-std()-Y
* tGravityAcc-std()-Z
* tBodyAccJerk-mean()-X
* tBodyAccJerk-mean()-Y
* tBodyAccJerk-mean()-Z
* tBodyAccJerk-std()-X
* tBodyAccJerk-std()-Y
* tBodyAccJerk-std()-Z
* tBodyGyro-mean()-X
* tBodyGyro-mean()-Y
* tBodyGyro-mean()-Z
* tBodyGyro-std()-X
* tBodyGyro-std()-Y
* tBodyGyro-std()-Z
* tBodyGyroJerk-mean()-X
* tBodyGyroJerk-mean()-Y
* tBodyGyroJerk-mean()-Z
* tBodyGyroJerk-std()-X
* tBodyGyroJerk-std()-Y
* tBodyGyroJerk-std()-Z
* tBodyAccMag-mean()
* tBodyAccMag-std()
* tGravityAccMag-mean()
* tGravityAccMag-std()
* tBodyAccJerkMag-mean()
* tBodyAccJerkMag-std()
* tBodyGyroMag-mean()
* tBodyGyroMag-std()
* tBodyGyroJerkMag-mean()
* tBodyGyroJerkMag-std()
* fBodyAcc-mean()-X
* fBodyAcc-mean()-Y
* fBodyAcc-mean()-Z
* fBodyAcc-std()-X
* fBodyAcc-std()-Y
* fBodyAcc-std()-Z
* fBodyAccJerk-mean()-X
* fBodyAccJerk-mean()-Y
* fBodyAccJerk-mean()-Z
* fBodyAccJerk-std()-X
* fBodyAccJerk-std()-Y
* fBodyAccJerk-std()-Z
* fBodyGyro-mean()-X
* fBodyGyro-mean()-Y
* fBodyGyro-mean()-Z
* fBodyGyro-std()-X
* fBodyGyro-std()-Y
* fBodyGyro-std()-Z
* fBodyAccMag-mean()
* fBodyAccMag-std()
* fBodyBodyAccJerkMag-mean()
* fBodyBodyAccJerkMag-std()
* fBodyBodyGyroMag-mean()
* fBodyBodyGyroMag-std()
* fBodyBodyGyroJerkMag-mean()
* fBodyBodyGyroJerkMag-std()
