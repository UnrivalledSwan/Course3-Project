# ------------------------------
# Process 1: Merges the training and the test sets to create one data set.
# ------------------------------

    # ------------------------------
    # Step 1: Download the Dataset
    #      a: Determine if the Directory Exists for the Course Project
    #      b: Determine if we have downloaded the file
    #      c: Determine if the Directory exists for the dataset
    # ------------------------------
    
        # Determine if the Directory Exists for the Course Project
        if (!file.exists('./Course Project')) {
            # if it does not exist, create it
            dir.create('./Course Project')
        }
        
        # Determine if we have downloaded the file
        if (!file.exists('./Course Project/Dataset.zip')) {
            #if the file does not exist, create it
            download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip","./Course Project/Dataset.zip")
        }
        
        # Determine if the Directory exists for the dataset
        if (!file.exists("./Course Project/UCI HAR Dataset")) { 
            unzip('./Course Project/Dataset.zip',exdir = './Course Project') 
        }
        
        if (file.exists('./Course Project/UCI HAR Dataset')) {
            setwd('./Course Project/UCI HAR Dataset')
        } else {
            errorCondition('The Directory Does not Exist')
        }
    # ------------------------------
    # End Step 1
    # ------------------------------
    
    # ------------------------------
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
    # ------------------------------
        features <- read.table("features.txt", col.names = c("id","functions"))
        activities <- read.table("activity_labels.txt", col.names = c("code","activity_name"))
        subject_test <- read.table("./test/subject_test.txt", col.names = "subject")
        subject_train <- read.table("./train/subject_train.txt", col.names = "subject")
        
        x_test <- read.table("./test/X_test.txt", col.names = features$functions)
        y_test <- read.table("./test/y_test.txt", col.names = "code")
        
        x_train <- read.table("./train/X_train.txt", col.names = features$functions)
        y_train <- read.table("./train/y_train.txt", col.names = "code")
    
    # ------------------------------
    # End Step 2
    # ------------------------------
    
    # ------------------------------
    # Step 3: Merge the data
    #      a: Merge data in x_test and x_train using the rbind() command
    #      b: Merge data in y_test and y_train using the rbind() command
    #      c: Merge data in subject_test and subject_train using the rbind() command
    #      d: Merge all 3 data sets created in a, b, and c using the cbind() command
    # ------------------------------
    
        xDF <- rbind(x_test,x_train)
        yDF <- rbind(y_test,y_train)
        subjects <- rbind(subject_test, subject_train)
        mergedDF <- cbind(subjects,yDF,xDF)
    
    # ------------------------------
    # End Step 3
    # ------------------------------
# ------------------------------
# End Process 1
# ------------------------------
        
# ------------------------------
# Process 2: Extract only the measurements on the mean and standard deviation for each measurement.
#            Create a Summary Data Frame
#            The Summary Data Frame will Subject and code columns as well as any columns that contain the words
#            "mean" or "std".  We will put the information in a data frame called SummaryDF
# ------------------------------
        
    library(dplyr)
    SummaryDF <- mergedDF %>% select(subject, code, contains("mean"), contains("std"))
    
# ------------------------------
# End Process 2
# ------------------------------
        
# ------------------------------
# Process 3: Uses descriptive activity names to name the activities in the data set
#            The Decriptive activity names are in the activities data frame
#            Set the code value in the SummaryDF data frame equal to the activity_name in the activities data
#            frame.  
# ------------------------------
    
    SummaryDF$code <- activities[SummaryDF$code, 2] # 2 is the activity Code column

# ------------------------------
# End Process 3
# ------------------------------
    
# ------------------------------
# Process 4: Appropriately labels the data set with descriptive variable names.
#            Rules for My Descriptive Variable Names
#            1. Columns that begin with a "t" will begin with the word "Time"
#            2. Columns that begin with a "f" will begin with the word "Frequency"
#            3. Columns that begin with "angle" will begin with the word "Angle"
#            4. Column subject will change to SubjectID
#            5. Column code will change to Activity
#            6. Columns that contain "BodyBody" will change to "Body"
#            7. Columns that contain "Acc" will change to "Accelerometer"
#            8. Columns that contain "Gyro" will change to "Gyroscope"
#            9. Columns that contain "Mag" will change to "Magnitude"
#           10. Columns that contain "tBody" will change to "TimeBody"
#           11. Columns that contain "gravity" will change to "Gravity"
#           12. Columns that contain "meanFreq" will change to "meanFrequency"
#           13. Columns that contain "mean" will change to "Mean"
#           14. Columns that contain ".std" will change to ".STD" (Ignore Case)
# ------------------------------
    names(SummaryDF)<-gsub("^t", "Time", names(SummaryDF))
    names(SummaryDF)<-gsub("^f", "Frequency", names(SummaryDF))
    names(SummaryDF)<-gsub("^angle", "Angle", names(SummaryDF))
    names(SummaryDF)<-gsub("subject", "SubjectID", names(SummaryDF))
    names(SummaryDF)<-gsub("^code", "Activity", names(SummaryDF))
    names(SummaryDF)<-gsub("BodyBody", "Body", names(SummaryDF))
    names(SummaryDF)<-gsub("Acc", "Accelerometer", names(SummaryDF))
    names(SummaryDF)<-gsub("Gyro", "Gyroscope", names(SummaryDF))
    names(SummaryDF)<-gsub("Mag", "Magnitude", names(SummaryDF))
    names(SummaryDF)<-gsub("tBody", "TimeBody", names(SummaryDF))
    names(SummaryDF)<-gsub("gravity", "Gravity", names(SummaryDF))
    names(SummaryDF)<-gsub("meanFreq", "meanFrequency", names(SummaryDF))
    names(SummaryDF)<-gsub("mean", "Mean", names(SummaryDF))
    names(SummaryDF)<-gsub(".std", ".STD", names(SummaryDF), ignore.case = TRUE)

# ------------------------------
# End Process 4
# ------------------------------    
    
# ------------------------------
# Process 5: From the data set in step 4, creates a second, independent tidy data
#            set with the average of each variable for each Activity and each SubjectID.
# ------------------------------
    
    ReturnDF <- SummaryDF %>% group_by(SubjectID, Activity) %>% summarise_all(list(mean = mean))
    write.csv(ReturnDF,"../Summary.csv")
    
# ------------------------------
# End Process 5
# ------------------------------    