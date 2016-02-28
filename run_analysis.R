run_analysis <- function() {

#Bind the training and the test sets to create one data set

features <- read.table( "features.txt", col.names=c("featureId", "featureName"))
test_X <- read.table("test/X_test.txt", col.names=features$featureName)
train_X <- read.table("train/X_train.txt", col.names=features$featureName)
X<- rbind( test_X,train_X )

#Extracts only the measurements on the mean and standard deviation for 
#each measurement

features$featureName <- names( X )
features_selected <-grep ( "mean|std", features$featureName, value=T )
X_selected <-  X[, features_selected]

#Bind the test and train activity data set into one

test_y <- read.table("test/y_test.txt")
train_y <- read.table("train/y_train.txt")
y<- rbind ( test_y , train_y )
 names(y ) <- "ActivityId"

#Bind  the test and train subject data sets into one 
test_subject <- read.table("test/subject_test.txt")
train_subject <- read.table("train/subject_train.txt")
subject <-rbind( test_subject, train_subject )
 names( subject ) <- "subjectId"

# Binding   subject, X, activity into one data frame
resultant <-cbind(  subject, X_selected , y )
write.table( resultant_label, "transfomed_data.txt")

# result from the previous step is grouped by ActivityId and subjectId , mean of each variable is determined
result2<- summarize_each(  group_by(resultant, ActivityId,subjectId ), funs(mean) )
#names(result2 )<-   sapply( names(result2 ) , function(x){ paste("Averaged",x,sep=":")})
activity_labels <- read.table("activity_labels.txt", col.names=c("ActivityId","Activity"))
result2_with_label <-merge( activity_labels ,result2, by="ActivityId" )
write.table( result2_with_label, "Averaged_data.txt" ,row.name=FALSE)
}
