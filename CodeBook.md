Code Book
==================

Raw Data
==================
- 'features_info.txt': Shows information about the variables used on the feature vector.

- 'features.txt': List of all features.

- 'activity_labels.txt': Links the class labels with their activity name.

- 'train/X_train.txt': Training set.

- 'train/y_train.txt': Training labels.

- 'test/X_test.txt': Test set.

- 'test/y_test.txt': Test labels.

The following files are available for the train and test data. Their descriptions are equivalent. 

- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30.  
- 'test/subject_test.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 

Files/Folder not used
==================================================================
"Inertial Signals" folders were ignored.

Processing Steps
=================================================================
Processing steps

1. Data files were read into data frames,  column headers were added from features.txt along with subjectId and activity
2. training and test sets were combined into a single data set.
3 . Only columns containing mean and std in their names were retained by using grepl.
4. The activity column was converted from a integer to a factor labels.
5. A tidy data set was created containing the mean of each feature for each subject and each activity. 
The tidy data set was output to a text file.

Output
===================================================================
The tidy data set was output to a text file.
Output.txt contains 1 record for each activity for each subject. So there are 6 records for each subject and in all 180 rows.