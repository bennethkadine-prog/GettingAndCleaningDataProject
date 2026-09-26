library(dplyr)
# -----------------------------------------------------------
# 1. Load Data
# -----------------------------------------------------------
# Path to the unzipped UCI HAR Dataset folder
path <- "UCI HAR Dataset"

# Read feature names and activity labels from path
features <- read.table(file.path(path, "features.txt"), col.names = c("index", "feature"))
activities <- read.table(file.path(path, "activity_labels.txt"),col.names = c("code", "activity"))

# Read training data from path
x_train <- read.table(file.path(path, "train", "X_train.txt"))
y_train <- read.table(file.path(path, "train", "y_train.txt"), col.names = "activity_code")
subject_train <- read.table(file.path(path, "train", "subject_train.txt"), col.names = "subject")
 
# Read test data from path
x_test <- read.table(file.path(path, "test", "X_test.txt"))
y_test <- read.table(file.path(path, "test", "y_test.txt"), col.names = "activity_code")
subject_test <- read.table(file.path(path, "test", "subject_test.txt"), col.names = "subject")
        
# -----------------------------------------------------------
# 2. Merge Training + Test Sets
# -----------------------------------------------------------
        
# Assign feature names to columns
colnames(x_train) <- features$feature
colnames(x_test) <- features$feature
          
# Combine training and test data
train <- cbind(subject_train, y_train, x_train)
test <- cbind(subject_test, y_test, x_test)
            
merged_data <- rbind(train, test)
              
# -----------------------------------------------------------
# 3. Extract Mean and Standard Deviation Measurements
# -----------------------------------------------------------
              
mean_std_columns <- grep("mean\\(\\)|std\\(\\)", features$feature, value = TRUE)
tidy_data <- merged_data[, c("subject", "activity_code", mean_std_columns)]
                
# -----------------------------------------------------------
# 4. Use Descriptive Activity Names
# -----------------------------------------------------------
            
tidy_data <- merge(tidy_data, activities, by.x = "activity_code", by.y = "code")
tidy_data$activity_code <- NULL  # remove numeric code
tidy_data <- tidy_data %>% relocate(activity) # bring the activity column forward

# -----------------------------------------------------------
# 5. Label Variables with Descriptive Names
# -----------------------------------------------------------
# Making substitutes in the column names               
names(tidy_data) <- gsub("^t", "Time_", names(tidy_data))
names(tidy_data) <- gsub("^f", "Frequency_", names(tidy_data))
names(tidy_data) <- gsub("Acc", "Accelerometer", names(tidy_data))
names(tidy_data) <- gsub("Gyro", "Gyroscope", names(tidy_data))
names(tidy_data) <- gsub("Mag", "Magnitude", names(tidy_data))
names(tidy_data) <- gsub("-mean\\(\\)", "_Mean", names(tidy_data))
names(tidy_data) <- gsub("-std\\(\\)", "_STD", names(tidy_data))
names(tidy_data) <- gsub("-", "_", names(tidy_data))
                    
# -----------------------------------------------------------
# 6. Create Second Independent Tidy Dataset
# -----------------------------------------------------------
final_data <- tidy_data %>% group_by(subject, activity) %>% summarise_all(mean) %>% print
                   
View(final_data)
                    
#---------------------------------------------
# 7. Save the file
#---------------------------------------------
                    
write.table(final_data, "final_data.txt", row.names = FALSE)
                    
