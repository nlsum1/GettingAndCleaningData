Getting and Cleaning Data Course Project
========================================

Cleaning process being done:
-----------------------------

The following process has been done to combine, cleaned and renamed variables of the involved datasets:

1. Merge the X training and X test (`X_train.txt` and `X_test.txt`) dataset together, as `dataX` dataset (10299 x 66 data frame)
2. Merge the Y training and Y test (`Y_train.txt` and `Y_test.txt`) dataset together, as `dataY` dataset (10299 X 1 data frame)
3. Merge the subject train and test (`subject_train.txt` and `subject_test.txt`) dataset together, as `subTrain` dataset (7325 x 1 data frame)
3. Extract the Feature names in `features.txt` (561 x 2 data frame), then extract only the ones with mean and standard deviation label, only 66 of them are required
4. Rename the `dataX` variable names with the feature names extracted.
5. Extract the Activities labels from activities_labels (6 x 2 data frame), then replace the `dataY` value with the activities labels.
6. Join the three dataset (`dataX`, `dataY` and `subTrain`) into one dataset, `cleaned` (10299 x 68 data frame)
7. Melt down the `cleaned` dataset with Subject, Activities against the rest of the variables (679734 x 4 data frame)
8. use dCast on the molten dataset to get the average value for each subject and each of their activities to return a final dataset, `finalData` (180 x 68 data frame)
9. Some other variables are also properly renamed for readability.
10. Write `finalData` into a txt file, as `average_final_data.txt`.


Final result:
-----------------

The final table written in `average_final_data.txt` contains a dataset of 180 x 68 data frame with the following columns:

* Subject - the subject involved (from subject 1 to subject 30)

* Activities - the activities perform by the subject, such as
>				LAYING
>				SITTING
>				STANDING
>				WALKING
>				WALKING DOWNSTAIRS
>				WALKING UPSTAIRS

* The columns from 3th to 68th (total of 66) are of the following variable names:

> 				tBodyAcc-mean-X
> 				tBodyAcc-mean-Y
> 				tBodyAcc-mean-Z
> 				tBodyAcc-std-X
> 				tBodyAcc-std-Y
> 				tBodyAcc-std-Z
> 				tGravityAcc-mean-X
> 				tGravityAcc-mean-Y
> 				tGravityAcc-mean-Z
> 				tGravityAcc-std-X
> 				tGravityAcc-std-Y
> 				tGravityAcc-std-Z
> 				tBodyAccJerk-mean-X
> 				tBodyAccJerk-mean-Y
> 				tBodyAccJerk-mean-Z
> 				tBodyAccJerk-std-X
> 				tBodyAccJerk-std-Y
> 				tBodyAccJerk-std-Z
> 				tBodyGyro-mean-X
> 				tBodyGyro-mean-Y
> 				tBodyGyro-mean-Z
> 				tBodyGyro-std-X
> 				tBodyGyro-std-Y
> 				tBodyGyro-std-Z
> 				tBodyGyroJerk-mean-X
> 				tBodyGyroJerk-mean-Y
> 				tBodyGyroJerk-mean-Z
> 				tBodyGyroJerk-std-X
> 				tBodyGyroJerk-std-Y
> 				tBodyGyroJerk-std-Z
> 				tBodyAccMag-mean
> 				tBodyAccMag-std
> 				tGravityAccMag-mean
> 				tGravityAccMag-std
> 				tBodyAccJerkMag-mean
> 				tBodyAccJerkMag-std
> 				tBodyGyroMag-mean
> 				tBodyGyroMag-std
> 				tBodyGyroJerkMag-mean
> 				tBodyGyroJerkMag-std
> 				fBodyAcc-mean-X
> 				fBodyAcc-mean-Y
> 				fBodyAcc-mean-Z
> 				fBodyAcc-std-X
> 				fBodyAcc-std-Y
> 				fBodyAcc-std-Z
> 				fBodyAccJerk-mean-X
> 				fBodyAccJerk-mean-Y
> 				fBodyAccJerk-mean-Z
> 				fBodyAccJerk-std-X
> 				fBodyAccJerk-std-Y
> 				fBodyAccJerk-std-Z
> 				fBodyGyro-mean-X
> 				fBodyGyro-mean-Y
> 				fBodyGyro-mean-Z
> 				fBodyGyro-std-X
> 				fBodyGyro-std-Y
> 				fBodyGyro-std-Z
> 				fBodyAccMag-mean
> 				fBodyAccMag-std
> 				fBodyBodyAccJerkMag-mean
> 				fBodyBodyAccJerkMag-std
> 				fBodyBodyGyroMag-mean
> 				fBodyBodyGyroMag-std
> 				fBodyBodyGyroJerkMag-mean
> 				fBodyBodyGyroJerkMag-std"
