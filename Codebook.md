---
title: "Code Book: Selected Averages Calculated from the Smartphone Human Activity Recognition Data Set"
output: word_document
---

Background Information
======================

This is a 180 X 68 data set.  It consists of averages of estimates of means and standard deviations taken from the Smartphone Human Activity Recognition Data Set.  The 180 rows in this data set consist of averages of estimates made on 30 different people performing six different activities.  The 68 columns in this data set consist of a column of subject identifiers, a column of activity labels, and 66 columns of averages of mean and standard deviation estimates from the Smartphone data set.

The subject identifiers for the 30 people are numbers from 1 to 30.  These subject identifiers are located in the first column of the data set.  The activity labels for the activities that each of the 30 people perform include walking, walking upstairs, walking downstairs, sitting, standing, and lying. These activity labels are located in the second column of the data set.

The smartphone measurements were made by 3-axial accelerometer and gyroscope sensors inside the smartphones.  These two sensor measurements are designated by Acc-XYZ and Gyro-XYZ. The variable names for the time domain measurements have a t-prefix, like tAcc-XYZ, and the variable names for the frequency domain measurements have an f-prefix, like fAcc-XYZ.  The time domain measurements were captured at 50 Hz and filtered with a Buterworth filter to remove noise. The acceleration measurement was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

Measurements Recorded in the Smartphone Data Set
================================================

In the Smartphone data set, the some measurements were recorded, with '-XYZ,' denoting signals in the X, Y and Z directions.  Estimates based on these measurements, such as means and standard deviations, were calculated in the Smartphone data set, and some of the estimates were selected for this data set.  Estimates of mean frequency were made in the Smartphone, but these estimates were not selected for this data set because they are not "means" in the same statistical sense.  In this data set, averages of the Smartphone estimates were made.


* tBodyAcc-XYZ
* tGravityAcc-XYZ
* tBodyAccJerk-XYZ
* tBodyGyro-XYZ
* tBodyGyroJerk-XYZ
* tBodyAccMag
* tGravityAccMag
* tBodyAccJerkMag
* tBodyGyroMag
* tBodyGyroJerkMag
* fBodyAcc-XYZ
* fBodyAccJerk-XYZ
* fBodyGyro-XYZ
* fBodyAccMag
* fBodyAccJerkMag
* fBodyGyroMag
* fBodyGyroJerkMag


Variable Names for This Data Set
================================

For this data set, the actual column numbers and variable names for the 68 columns are as below.

* "1" "Subject"
* "2" "Activity"
* "3" "tBodyAcc-mean()-X"
* "4" "tBodyAcc-mean()-Y"
* "5" "tBodyAcc-mean()-Z"
* "6" "tBodyAcc-std()-X"
* "7" "tBodyAcc-std()-Y"
* "8" "tBodyAcc-std()-Z"
* "9" "tGravityAcc-mean()-X"
* "10" "tGravityAcc-mean()-Y"
* "11" "tGravityAcc-mean()-Z"
* "12" "tGravityAcc-std()-X"
* "13" "tGravityAcc-std()-Y"
* "14" "tGravityAcc-std()-Z"
* "15" "tBodyAccJerk-mean()-X"
* "16" "tBodyAccJerk-mean()-Y"
* "17" "tBodyAccJerk-mean()-Z"
* "18" "tBodyAccJerk-std()-X"
* "19" "tBodyAccJerk-std()-Y"
* "20" "tBodyAccJerk-std()-Z"
* "21" "tBodyGyro-mean()-X"
* "22" "tBodyGyro-mean()-Y"
* "23" "tBodyGyro-mean()-Z"
* "24" "tBodyGyro-std()-X"
* "25" "tBodyGyro-std()-Y"
* "26" "tBodyGyro-std()-Z"
* "27" "tBodyGyroJerk-mean()-X"
* "28" "tBodyGyroJerk-mean()-Y"
* "29" "tBodyGyroJerk-mean()-Z"
* "30" "tBodyGyroJerk-std()-X"
* "31" "tBodyGyroJerk-std()-Y"
* "32" "tBodyGyroJerk-std()-Z"
* "33" "tBodyAccMag-mean()"
* "34" "tBodyAccMag-std()"
* "35" "tGravityAccMag-mean()"
* "36" "tGravityAccMag-std()"
* "37" "tBodyAccJerkMag-mean()"
* "38" "tBodyAccJerkMag-std()"
* "39" "tBodyGyroMag-mean()"
* "40" "tBodyGyroMag-std()"
* "41" "tBodyGyroJerkMag-mean()"
* "42" "tBodyGyroJerkMag-std()"
* "43" "fBodyAcc-mean()-X"
* "44" "fBodyAcc-mean()-Y"
* "45" "fBodyAcc-mean()-Z"
* "46" "fBodyAcc-std()-X"
* "47" "fBodyAcc-std()-Y"
* "48" "fBodyAcc-std()-Z"
* "49" "fBodyAccJerk-mean()-X"
* "50" "fBodyAccJerk-mean()-Y"
* "51" "fBodyAccJerk-mean()-Z"
* "52" "fBodyAccJerk-std()-X"
* "53" "fBodyAccJerk-std()-Y"
* "54" "fBodyAccJerk-std()-Z"
* "55" "fBodyGyro-mean()-X"
* "56" "fBodyGyro-mean()-Y"
* "57" "fBodyGyro-mean()-Z"
* "58" "fBodyGyro-std()-X"
* "59" "fBodyGyro-std()-Y"
* "60" "fBodyGyro-std()-Z"
* "61" "fBodyAccMag-mean()"
* "62" "fBodyAccMag-std()"
* "63" "fBodyBodyAccJerkMag-mean()"
* "64" "fBodyBodyAccJerkMag-std()"
* "65" "fBodyBodyGyroMag-mean()"
* "66" "fBodyBodyGyroMag-std()"
* "67" "fBodyBodyGyroJerkMag-mean()"
* "68" "fBodyBodyGyroJerkMag-std()"

