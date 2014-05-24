##Readme##

This script get data from the Samsung files and clean it, adding the separete files, transforming then into a tidy data set, and than summarizing it. 

This is due as an assignment to the Coursera class " Getting and Cleaning DATA".

The script was structured into five peaces:

##1. loading the files:## 

in this part, the files from Samsung are loaded into R. 

For each file is created an data frame, as following:

###file................dataframe###

*subject_test.txt .....subjecttest
*subject_train.txt.....subjecttrain
*X_train.txt...........xtrain
*X_test.txt............xtest
*activity_labels.txt...activity
*y_test.txt............ytest
*y_train.txt...........ytrain
*features.txt..........features

###2. creating the general dataframe:###

This part bring together all the data frames created before and the names of the variables previously given are changed by those extracted from the file "features.txt".
It also gives friends name for the first three columns. The output is a dataframe "df", that contain all the data, organized as follow:

###"subject" "cod" "activity" "nameofvariable1"...."nameofvariable561"###

###3. correcting the names of variables###

At this part, the names of the variables from the data frame "df" are transformed in a way to get then free of some characters that are note desireble. 

Additionaly, the uppercases are changed into lower cases.

###4.subsetting the variables, by "mean" and "std"###

In this part, we subset the "df" into a new data frame called "mydata". 

Only those variables that contain the expressions "mean" or "std" in treir names are taken.

###5.creating a second tidy data set###

Finally, this part create a new file from "df", the general dataframe. 

This new file presents the mean of all variables for each subject in each activity. 

Each row bring the means, all of them, for a specific subject in a specific activity.

