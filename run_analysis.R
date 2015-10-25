run_analysis <- function(){
        #This function loads the data from the UCI HAR dataset.  It
        #then combines the testing and training data into one data.frame,
        #retains only the features involving mean or standard deviation, 
        #adds variables for subject ID and activity name, and then groups the 
        #data by activity and subject.  Finally, the function writes a table
        #which gives the mean of each remaining feature with respect to each
        #subject and each activity
        
        #Note: the user should modify this line to the directory that
        #contains the dataset
        setwd("~/Programming/R/GettingandCleaningData/UCI HAR Dataset")
        
        x_test<-read.table("./test/X_test.txt")
        y_test<-read.table("./test/y_test.txt")
        x_train<-read.table("./train/X_train.txt")
        y_train<-read.table("./train/y_train.txt")
        allData<-rbind(x_train, x_test)
        allLabels<-rbind(y_train, y_test)
        featureNames<-read.table("./features.txt")
        colnames(allData)<-featureNames[,2]
        activityNames<-read.table("./activity_labels.txt")
        colnames(allLabels)<-"Activity"
        allLabels$Activity<-as.factor(allLabels$Activity)
        levels(allLabels$Activity)<-activityNames$V2
        subject_test<-read.table("./test/subject_test.txt")
        subject_train<-read.table("./train/subject_train.txt")
        allSubjects<-rbind(subject_train, subject_test)
        colnames(allSubjects)<-"SubjectID"
        containsMean<-grepl("mean", names(allData), ignore.case=TRUE)
        containsSTD<-grepl("std", names(allData), ignore.case=TRUE)
        inds<-which(containsMean | containsSTD)
        allData<-allData[,inds]
        allData<-cbind(allData, allLabels)
        allData<-cbind(allData, allSubjects)
        grouped<-group_by(allData, Activity, SubjectID)
        meansByActandSub<-summarize_each(grouped, funs(mean))
        if(!file.exists("summaryData.txt")){
                write.table(meansByActandSub, "summaryData.txt")
        }
}

