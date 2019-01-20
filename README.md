## gettingcleaningdataproject
## please refer to below for detailed explanation of the script

1) download the zip file from the provided web link;
2) unzip the zip file to my working directory;
3) check readme and explanation documents to understand the data;
4) library "dplyr" package, record the package version and R version;
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
