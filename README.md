# GettingAndCleaningDataProject
Coursera Getting and Cleaning Data Course Project
This repository contains the work completed for the Coursera Getting and Cleaning Data course project. The purpose of the project is to demonstrate the ability to collect, clean, and prepare data for later analysis using R.

The dataset used is the UCI Human Activity Recognition (HAR) Dataset, which includes accelerometer and gyroscope measurements collected from Samsung Galaxy S smartphones worn by 30 participants performing six different activities.

## Repository Contents
| File | Description |
| --- | --- |
| **run_analysis.R** | R script that performs all required data cleaning and transformation steps. |
| **tidy_data.txt** | Final tidy dataset produced by the script. |
| **CodeBook.md** | Documentation describing variables, data sources, and transformations. |
| **README.md** | Explanation of the project and how the analysis was performed. |

## How the Analysis Works
The script run_analysis.R performs the following steps:
1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set.
4. Appropriately labels the data set with descriptive variable names.
5. Create a second independent tidy dataset
6. Exports the final dataset to tidy_data.txt

## How to Run the Script
1. Download and unzip the UCI HAR Dataset
2. Place the folder in your R working directory
3. Run the script

   #### /b Notes /b
   - The script uses /b dplyr /b for data manipulation
   - The final dataset follows tidy data principles:
     - Each variable is a column
     - Each observation is a row
     - Each type of data is stored in its own table
