---
title: "Read Me File: Selected Averages Calculated from the Smartphone Human Activity Recognition Data Set"
output: word_document
---

This data set consists of averages of data taken from another data set.  The other data set is the Smartphone Human Activity Recognition Data Set, for which a reference is provided below.  

The Smartphone data set includes motion-sensor measurements of individuals as they were performing common physical activities.  The activities include walking, sitting, standing and lying.  The purpose of the Smartphone data set is provide data to see if it is possible to predict the activities the individuals were engaging in based on the motion-sensor measurements.  The measurements were made by two kinds of motion sensors, an accelerometer and a gyroscope.  The motion sensors were located inside a particular brand of smartphones held on the bodies of the individuals as they were performing the actions. Besides the motion-sensor measurements, the Smartphone data set also includes statistical estimates of these measurements such as means and standard deviations.

The Smartphone data set is huge: It involves 561 estimates for each of 30 individuals engaged in each of six different activities.  While much smaller than the Smartphone data set, this data set is still fairly large.  This data set includes averages of 66 of the Smartphone data set estimates for the 30 individuals engaged in the six different activities.  The 66 estimates in this data set consist of the estimates for mean and standard deviation among the 561 estimates of the larger Smartphone data set.

Here are some additional details about how the Smartphone data set was created.  The Smartphone estimates were obtained in experiments with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (walking, walking upstairs, walking downstairs, sitting, standing, and lying) while wearing a Samsung Galaxy S II smartphone on his or her waist. Using the smartphone's embedded accelerometer and gyroscope,measurements were captured for 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments were video-recorded to label the data manually. Originally, the Smartphone data set was randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. In this set of data taken from the Smartphone dataset, the training and test data were combined into a single data set and then averages were taken from the combined data set.

Also regarding the Smartphone experiments, the sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.  

Data obtained in each observation of the Smartphone experiment
==============================================================

- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- Averages were made  561-measurement vector with time and frequency domain variables upon which means and standard deviations were calculated.
- Its activity label. 
- An identifier of the subject who carried out the experiment.

Steps in the R script to generate the output for this data set
==============================================================

An R script, run_analysis.R, is provided to show how the output of calculated averages, which form this data set, was created.  The R script performs the following steps.

* The data is loaded.  The original Smartphone data set of training and test data sets is loaded into R, along with the subject identifiers, activity labels, and variable names. In the original training set, 7352 observations were included.  In the original test set, 2947 observations were included. For both the training and test data sets, 561 variables were included.
* The data is checked to see that it is properly loaded.  Several tests are performed to determine that the data is properly loaded.
* The subject identifiers and activity labels variables are added to the training and data sets.  These variables are crucial to determining the later calculations of averages for each subject and activity in the data set.
* The Smartphone training and test data sets are merged into one data set for analysis here.
* The 561 variables in the Smartphone data set are pared down to the 66 variables which are means and standard deviations of the various measurements.  The actual selection of the variables is done in R using regular expressions, which are found in the script.  
* Using the pared down set of 66 variables, data for processing in this data set is extracted from the merged data set.  The subject identifiers and activity labels variables were included, resulting in a total of 68 variables for use in processing this data set.
* More descriptive names for the data set variables are added to the data set.  At first, it seemed that the best descriptive names for the data set variables were full verbal expressions of the original data set variables, which initially seemed cryptic and obscure.  But on reflection, the original data set variables offered much more advantage due to their succinctness than the lengthier descriptive names originally planned.  So there is little modification of the variable names, but the succinctness that they offered is preserved. Also, descriptive names are added to the subject identifiers and activity labels variables.
* More descriptive levels are created for the activity levels.  Originally, the activity levels were just numbers, like 1 for walking, 2 for walking downstairs, 3 for walking upstairs, 4 for sitting, 5 for standing, and 6 for lying.  Here words are used instead of numbers to increase the readability of the resulting output.
* Averages are calculated for each subject and for each activity for each of the 66 measurement variables.  The subject identifiers and activity labels for each calculation are included.
* The calculated averages which make up this data set are output to a file, "output.txt."
* In each major step, repeated safety checks are performed in R to verify that the intended R script result is actually achieved.

This data set includes the following files
==========================================

- 'ReadMe.md': Provides a description of how this data set was created.

- 'Codebook.md': Provides information about the variables in this data set.

- 'run_analysis.R': Provides the R script used to process the Smartphone Human Activity Recognition Data Set.

- 'output.txt': Provides the output data file generated by the R script run_analysis.R.

Reference
=========

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012
