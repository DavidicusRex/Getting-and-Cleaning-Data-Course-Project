Victor_The_Cleaner() function was named after a character in the Luc Besson film "La Femme Nikita".

Required Packages: Please note that the run_analysis.R script requires the following packages to be installed in R in order to function: dplyr, plyr

I. The first commands in the function (lines 2-9) load the necessary data sets into R.  Note that the file "UCI HAR Dataset" must be in your working directory for it to work.

The necessary data files are as follows:

1) X_test.txt — this contains the observational results for subjects in the test group.

2) y_test.txt — this contains the activity codes for the observations of subjects in the test group.

3) subject_test.txt — this contains the subject identity numbers for the observations in the test group.

4) X_train.txt — this contains the observational results for subjects in the training group.

5) y_train.txt — this contains the activity codes for the observations of subjects in the training group.

6) subject_train.txt — this contains the subject identity numbers for the observations in the training group.

7) features.txt — this file contains the variable names for the observational results

II. Once the relevant files are uploaded, headers are applied to the raw data, and the activity codes listed in the "y-train" and "y-test" files are replaced by names of the actual activities performed by the subjects: Walking, Walking Upstairs, Walking Downstairs, Sitting, Standing, and Laying.

Afterwards, headers are created to identify the Subject and Activity variable columns.

III. Before merging, the X_test, y_test, subject_test files were joined using the cbind command, as were the X_train, y_train, and subject_train files.  Also, a new variable was created, "group" so that subjects may be identified as members of either the "training" or "test" groups.

IV. At this point the two files were merged using the rbind command.

V. Cleaning: Within the larger merged file, all columns not related to reading means or standard deviations were removed, reducing the number of observational variables from 561 to 66.Other characters, such as dashes and parentheses were also removed to make the variables more readable.  After due consideration, the capital letters were left in order for the reader to differentiate key words.

VI. The smaller tidy data set was then created by grouping the data using the dplyr package by subject and activity, and summarizing data by presenting the averages of the means and standard deviations of the variables in questions.
