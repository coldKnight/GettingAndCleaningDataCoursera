Guidelines to running the script
==============================

This script is submitted as part of the Peer Assessment for the Getting and Cleaning Data course on Coursera.

Note
====

The script run_analysis.R should be in the same directory as the three test, three train and the features file. All these seven files must be extracted from the zip file uploaded on course page and put in the working directory.

Guide to the script
===================

The line 4 of the code sets the working directory.

Lines 7 to 15 are basically reading the various data files into data frames.

Lines 18 to 24 are merging the different data frames into a big data frame using cbind().
However, the column names of this data frame called finalSet are not the variables specified in the features file, but are the default names put by R.

Lines 27 to 34 are used to convert the data in the features.txt file into a data frame which can be used for naming the columns in the finalSet data frame.

The namedFinalSet created in Line 37 has the correct column names.

Lines 40 to 45 use the description for activities given in activity_labels.txt to substitue numbers with the correct activity names.

Line 53 is extracting all the columns which give either mean or standard deviation of some variable.

The arrangedDataSet created in Line 56 has all the descriptive activity labels and column names. It is also arranged subject wise, with subject 1 and all his activities in alphabetical order followed by the subject 2 and so on till subject 30.
This data id saved in a file called "arrangedDataSet.csv"

Finally, we rearrange the datast as required in Part 5 according to the activity for each subject.
For this we use melt function with activity and subject as the ids.

The final output file is "tidyDataSet.csv". This file can then be opened using Microsoft Excel or Libre Office and published into pdf format for submission.

Tidy Data Format
================

The format of the tidy data is as shown below:
The first five rows and columns look like this

	subject	LAYING_tBodyAcc-mean()-X    LAYING_tBodyAcc-mean()-Y	LAYING_tBodyAcc-mean()-Z  
1	1	      0.221598244	                -0.040513953	          -0.113203554              
2	2	      0.281373404	                -0.01815874	            -0.10724561               
3	3	      0.275516853	                -0.018955679	          -0.101300478              
4	4	      0.263559215	                -0.015003184	          -0.11068815               
5	5	      0.278334326	                -0.018304212	          -0.107937604              



The first column is the serial number.
The second column is the subject number arranged in increasing order.
The subsequent columns give the average of each variable for each activity for the respective subject.
The activity can be identified with the help of column names.





