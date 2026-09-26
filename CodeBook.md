# Code Book
This document describes the variables, data, and transformations performed to clean the UCI HAR Dataset.

## Raw Data Description
The original dataset includes:
- 561 features from smartphone accelerometer and gyroscope signals
- Subject identifiers (1–30)
- Activity labels (walking, sitting, standing, etc.)
- Separate training and test datasets

## Transformations performed
1. Merged training and test datasets using cbind() and rbind().
2. Extracted the mean and standard deviation columns using a regex pattern ("mean\\(\\)|std\\(\\)")
3. Replaced the numeric activity codes with descriptive activity names :
     - walking
     - walking_upstairs
     - walking_downstairs
     - sitting
     - standing
     - laying
4. Cleaned the variable names
| Original | Updated |
| --- | --- |
| ``tBodyAcc-mean()`` | ``Time_BodyAccelerometer_Mean`` |
| ``fBodyGyro-std()`` | ``Frequency_BodyGyroscope_STD`` |
| ``Mag`` | ``Magnitude`` |
| ``Acc`` | ``Accelerometer`` |
| ``Gyro`` | ``Gyroscope`` |   

5. Created a grouped summary dataset (average of each variable grouped by subject and activity)
6. The Final tidy dataset contains 180 rows, 68 columns, clean descriptive variable names, one row per subject/activity combination
   
