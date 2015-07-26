# Getting-and-Cleaning-Data-Project
Manipulating data and getting them cleaned before carrying on further analysis

## First, reading data
The first thing the Analysis file does is it reads data and store it in variables, each of the 6 provided data files is assigned to a different variable.

## secondly, it merges the test and train data sets
using the rbind function it makes both test and train data into a new variable -> MergedData

## Next, extracting  the measurements of interest. 
Using the features.txt documet to identify the indices of the mean and standard deviation for each measurement, then use those indices to subset the data frame of interest from the whole set of data and store it in -> DataMeanAndStd

## Adding Activity and Subject columns
* First combinig the train and the test data of both subject and variable in the same order as MergedData
* Then using cbind function to add them to the DataMeanAndStd and store the resulting data frame to -> dataFull

## Renaming activities
by changing the integer vector of Activity into factor and utilizing the dual nature of factors, then changing the levels name in accordance with the activity_labels provided. Lastly chnging the factor into a charecter vector and saving all the changes all along in the activity column

## Then, relabeling variables
Using the features.txt provided to import the variable names and subsetting the name of the variables of interest usin the same indices as those used in subsetting DataMeanAndStd from MergedData. Then adding the names of the Subject and activity variables and assigning it as the column names of the whole data frame

## Creating independent tidy data
by using the reshape2 library utilizing the melt function to identify id and variable measures, then using dcast function to create a data set with the average of each variable for each activity and each subject.

## Lastly, write the result data set into a txt file
using the write.table function to save the result of the analysis to a txt file


