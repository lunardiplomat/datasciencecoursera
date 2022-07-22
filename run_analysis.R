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

## Let's extract only the data we need for this project and organize it into a single workable object
## In this case we need only the mean and the std deviation.
featIdx<- grepl("mean|std", features)
xFeat<- x[,featIdx]

## Now let's incorporate our factor data into the set such that we have descriptive names
## for the variables of our new data set
colnames(activity_labels) <- c('Subject', 'Activity')
y$V1 = activity_labels[y$V1,2]

colnames(y)<- "Activity"
colnames(subjects)<- "Subject"

all<- cbind(subjects, y, x)

## Now that we have a single workable object that includes names and factors let's
## do some final tidying with the 'melt' and 'cast' functions from reshape2.
## Now we can finally do some analysis on what was once an unruly data set :)
meltAll<- melt(all, id=c("Subject","Activity"))
reAll<- dcast(meltAll, Subject+Activity ~ variable, mean)

## Let's export this
write.csv(reAll, "UCI HAR Data(Tidy).csv", row.names = FALSE)
