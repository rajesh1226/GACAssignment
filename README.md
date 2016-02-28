###    submission of Assignment of Getting and Cleaning Data

### # The following steps explains the functionality of run_analysis.R script :


### #  features data frame is created by reading features.txt using read.table to attain  
### #   the features or variables 
### #  test data set  test_X is read using read.table from  test/X_test.txt , columns names are set from features
### #  train data set train_X is read in similar fashion
### #  Binding by row id done from test_x and train_X

### #  grepping over  "mean|std" in features provides the features associated with mean and std among 561 fetures from raw data set
### #  X_selected  is data frame with the selected varialbes from above line

### #  test_y  is read from  test/y_test.txt 
### #  train_y is read from train/y_train.txt 
### #  rbind is applied  over test_y and train_y
### #  Appropriate names "ActivityId"  is set 


### #  test_subject is read from test/subject_test.txt
### #  train_subject is read from train/sujbect_train.txt
### #  rbind  applied over  test_subject and traing_subject
### #  appropriate name "subjectId" is set

### #  Result of the above three step are combined using  column bind operation 
### #  contents are written  to a file transformed_data.txt. This step is optional

### #  The above result data set is grouped by subjectid Activity Id, each variable mean is determined for each groups
### #  At this activity_label is read from Activity_labels.txt
### #  result data set is merged with activity_label in order to have addition column which is string description of the activity
### # content is written in Averaged_data.txt

