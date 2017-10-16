# GettingAndCleaningData

Getting and Cleaning Data - Coursera

This repository contains the components of the Getting and Cleaning Data assignment for the Coursera project, containing:

1. README.md file
2. Codebook.md - this codebook describes the variables and components of the data set.
3. run.analysis.R - this code downloads, cleans up, and creates the dataset & tidy data for this project, by merging test and trial data sets, removing non-average or standard deviation data points, and labeling data.
4. tidyData.txt - a tidy data set aggregated. Takes average of all the average & standard deviation variables.

For this analysis, we combined the test and trial data into one data set. Below is a desription of how the study was conducted:

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 




