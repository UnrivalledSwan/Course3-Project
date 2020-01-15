---
title: "README"
author: "Andy Sullivan"
date: "1/15/2020"
output: html_document
---

## Introduction

One of the most exciting areas in all of data science right now is wearable computing - see for example [this article](http://www.insideactivitytracking.com/data-science-activity-tracking-and-the-battle-for-the-worlds-top-sports-brand/) . Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Here are the data for the project:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

You should create one R script called run_analysis.R that does the following.

  1.  Merges the training and the test sets to create one data set.
  
    # Step 1: Download the Dataset
    #      a: Determine if the Directory Exists for the Course Project
    #      b: Determine if we have downloaded the file
    #      c: Determine if the Directory exists for the dataset
    # Step 2: Load the data
    #      a: The features (features.txt) data frame comes from the accelerometer and gyroscope 3-axial raw signals 
    #         tAcc-XYZ and tGyro-XYZ.  Each are prefixed with a 't' to denote time
    #      b: The activities (actvity_labels.txt) data frame contains the activity names that we will study
    #      c: The subject_test (test/sbject_test.txt) data frame identifies the subject who performed the activity
    #         for each window sample. Its range is from 1 to 30.
    #      d: The subject_train (train/sbject_train.txt) data frame identifies the subject who performed the activity
    #         for each window sample. Its range is from 1 to 30.
    #      e: The x_test (./test/X_test.txt) data frame is the test set
    #         set the columns equal to the values in the functions column in features
    #      f: The y_test (./test/y_test.txt) data frame are all the activity codes for test
    #      g: The x_train (./train/X_train.txt) data frame is the training set
    #         set the columns equal to the values in the functions column in features
    #      h: The y_train (./train/y_train.txt) data frame are all the activity codes for training
    # Step 3: Merge the data
    #      a: Merge data in x_test and x_train using the rbind() command
    #      b: Merge data in y_test and y_train using the rbind() command
    #      c: Merge data in subject_test and subject_train using the rbind() command
    #      d: Merge all 3 data sets created in a, b, and c using the cbind() command
    
  2.  Extracts only the measurements on the mean and standard deviation for each measurement.

    #      Create a Summary Data Frame
    #      The Summary Data Frame contains the Subject and code columns as well as any columns that contain the words
    #      "mean" or "std".  We will put the information in a data frame called SummaryDF
    
  3.  Uses descriptive activity names to name the activities in the data set
  
    #      The Decriptive activity names are in the activities data frame
    #      Set the code value in the SummaryDF data frame equal to the activity_name in the activities data
    #      frame. 

  4.  Appropriately labels the data set with descriptive variable names.
  
    #      Rules for My Descriptive Variable Names
    #      1. Columns that begin with a "t" will begin with the word "Time"
    #      2. Columns that begin with a "f" will begin with the word "Frequency"
    #      3. Columns that begin with "angle" will begin with the word "Angle"
    #      4. Column subject will change to SubjectID
    #      5. Column code will change to Activity
    #      6. Columns that contain "BodyBody" will change to "Body"
    #      7. Columns that contain "Acc" will change to "Accelerometer"
    #      8. Columns that contain "Gyro" will change to "Gyroscope"
    #      9. Columns that contain "Mag" will change to "Magnitude"
    #     10. Columns that contain "tBody" will change to "TimeBody"
    #     11. Columns that contain "gravity" will change to "Gravity"
    #     12. Columns that contain "meanFreq" will change to "meanFrequency"
    #     13. Columns that contain "mean" will change to "Mean"
    #     14. Columns that contain ".std" will change to ".STD" (Ignore Case)
    
  5.  From the data set in step 4, create a second, independent tidy data set with the average of 
      each variable for each activity and each subject.
      
    #      My Tidy Data Set is named ReturnDF and returns a file named Summary.csv

## Requirements

  1.  The submitted data set is tidy.
  2.  The Github repo contains the required scripts.
  3.  GitHub contains a code book that modifies and updates the available codebooks with the data to indicate all the       variables and summaries calculated, along with units, and any other relevant information.
  4.  The README that explains the analysis files is clear and understandable.
  5.  The work submitted for this project is the work of the student who submitted it.
  
## Resposity Contents

The Repository contains the following:

  1.  `README.md` - This is a file that explains the project, requirements, and contents
  2.  `CodeBok.md` - This is a file that contains the Information about what we can find in the output file
  3.  `run_analysis.R` - This is the script that will generate the output file.
  4.  `Summary.csv` - This is the output file
