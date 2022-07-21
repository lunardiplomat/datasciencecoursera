## ONE: 
## Let's merge the training and test data while retaining the names of the activities and features

## Activity and feature names
activity_labels<- read.table("UCI HAR Dataset/activity_labels.txt")
features<- read.table("UCI HAR Dataset/features.txt")

## Training
subject_train<- read.table("UCI HAR Dataset/train/subject_train.txt", header = FALSE)
x_train<- read.table("UCI HAR Dataset/train/X_train.txt", header = FALSE)
y_train<- read.table("UCI HAR Dataset/train/y_train.txt", header = FALSE)

## Test
subject_test<- read.table("UCI HAR Dataset/test/subject_test.txt", header = FALSE)
x_test<- read.table("UCI HAR Dataset/test/X_test.txt", header = FALSE)
y_test<- read.table("UCI HAR Dataset/test/Y_test.txt", header = FALSE)

## Binding
x<- rbind(x_train, x_test)
y<- rbind(y_train, y_test)
subjects<- rbind(subject_train, subject_test)

##TWO:
## Let's extract only the data we need for this project and organize it into a single workable object
## In this case we need only the mean and the std deviation.




