## gettingcleaningdataproject
## In general to explain what the script will do:
1. Load data sets from txt files; 
2. Merges the training and the test sets to create one data set;
3. Extracts only the measurements on the mean and standard deviation for each measurement;
4. Uses descriptive activity (by default) names to name the activities in the data set;
5. Appropriately labels the data set with descriptive variable names;
6. From the data set in step 5, creates a second, independent tidy data set with the average of each variable for each activity and each # subject.


## please refer to below for detailed explanation of the script
1) library "dplyr" package;
2) record the dplyr package version and R version;
3) download the zip file from the provided web link;
4) unzip the zip file to my data directory; 
5) load activity lables from the file, the file is only for reading, not used next;
6) load the test data set and its activities and subjects into individual dataframes;
7) rename variable names to "activity" and "subject";
8) bind the test data set with activity and suject sets;
9) reorder the column names by using "select";
10) load the train data set and its activities and subjects into individual dataframes;
11) rename variable names to "activity" and "subject";
12) bind the train data set with activity and suject sets;
13) reorder the column names by using "select"
14) merge test and train data sets into total1;
15) read from the feature table;
16) grep all features that have "mean" and "std" by their row numbers and give them to "n";
17) sort "n" in the increasing order;
18) get the character list for required features;
19) set "m" to be equal to "n+2" for subsetting required columns from total1;
20) select required columns from total1;
21) rename slected columns by using "featureneed" list;
22) labels the data set with descriptive variable names;
23) uses descriptive activity names to name the activities in the data set;
24) creates a new data set, the data set is with the average of each variable for each activity and each subject;
25) write the final table into a txt file.
