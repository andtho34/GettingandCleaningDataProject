# GettingandCleaningDataProject
## This is the repo for files related to the course project in the class Getting and Cleaning Data

This repo contains four files

* run_analysis.R  The r function that loads the data into R, manipulates the data, and writes the
clean dataset to a text file.  

*Codebook.md  This markdown file defines the variables in the outputted clean data file, "summaryData.txt"

*summaryData.txt  This file contains the clean data set.  It contains the means of all feature variables
with respect to subject and activity type. Note:  The data is not easily viewed in a text editor, so it is
recommended that it be read into R using read.table("./summaryData.txt")

*README.md  Read me markdowm file defining files in the repo, and explaining what the R function does

### Description of run_analysis.R

The run_analysis.R  function leads the data from the UCI HAR dataset.  It then 
combines the testing and training data into one single data.frame, with the training 
data first, followed by the testing data.  The function then subsets the data.frame
to contain only features involving a mean or a standard deviation.  It then adds
variables for activity type, and subject id.  Then the data.frame is grouped by 
activity and subject id, and the mean of each feature is calculated with regards
to the activity and subject id variables.  This final matrix is then written to the 
text file summaryData.txt, if the file does not already exist.
