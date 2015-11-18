# Information on the run_analysis.R script.

###the run_analysis.R script downloads, processes and transforms data collected from the accelerometers from the Samsung Galaxy S smartphone.


A full description is available at the site where the data was obtained: 

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

Here are the data for the project: 

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip


first the script downloads and unzips the files and then loads the different tables that are organized in this way in the UCI HAR Dataset working directory:
activity_labels.txt are the descriptive names and id for the activity types found in the train and test data sets.
features.txt are the descriptive names of the variables found in the train and test data sets

##These are the steps used to create the new dataset activityData.txt:

###1. Merge the test and train data.
-load the data 
-assign the descriptive labels to the test and train data sets
-assemble the the different parts of the test data sets (data , subject id and activity id)
-assemble the the different parts of the train data sets (data , subject id and activity id)
-merge the test and train data sets by binding their rows (rbind)

###2. Subset all the mean and standard deviation measurements.

-identify all the mean and standard deviation measurements using grep
-subset subject id, activity id and the identified STD and Mean columns

###3. Make the the data more readable by adding and modifying descriptive variables and values.

-load and merge activity_labels.txt with the subseted data (descriptiveData) by activity.id
-use gsub to replace -std, -mean, bodybody  and - with Std, Mean, body. remove () and -.

###4. Reshape the data set with the average of each variable for each activity and each subject.

-use the library reshape 2 to melt the data by subject.id, activity.name and activity.id
-using the reshaped data create the final data set representing the mean of the reaped data variables
-save the table in .txt format in the working directory with the name activityData.txt