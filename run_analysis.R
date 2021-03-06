Victor_The_Cleaner<-function(){
        ## The following files read the required data tables
        test_X<-read.table("./UCI HAR Dataset/test/X_test.txt")
        test_Y<-read.table("./UCI HAR Dataset/test/y_test.txt")
        test_subj<-read.table("./UCI HAR Dataset/test/subject_test.txt")
        train_X<-read.table("./UCI HAR Dataset/train/X_train.txt")
        train_Y<-read.table("./UCI HAR Dataset/train/y_train.txt")
        train_subj<-read.table("./UCI HAR Dataset/train/subject_train.txt")      
        names<-read.table("./UCI HAR Dataset/features.txt")
        ## The following gives headers to the raw data
        colnames(test_X)<-names$V2
        colnames(train_X)<-names$V2
        ## gives the Activity Codes proper names
        for(i in seq_along(test_Y$V1)){
                if(test_Y[i,1]=="1"){
                        test_Y[i,1]<-"WALKING"
                }
                if(test_Y[i,1]=="2"){
                        test_Y[i,1]<-"WALKING_UPSTAIRS"
                }
                if(test_Y[i,1]=="3"){
                        test_Y[i,1]<-"WALKING_DOWNSTAIRS"
                }
                if(test_Y[i,1]=="4"){
                        test_Y[i,1]<-"SITTING"
                }
                if(test_Y[i,1]=="5"){
                        test_Y[i,1]<-"STANDING"
                }
                if(test_Y[i,1]=="6"){
                        test_Y[i,1]<-"LAYING"
                }
        }
        
        for(i in seq_along(train_Y$V1)){
                if(train_Y[i,1]=="1"){
                        train_Y[i,1]<-"WALKING"
                }
                if(train_Y[i,1]=="2"){
                        train_Y[i,1]<-"WALKING_UPSTAIRS"
                }
                if(train_Y[i,1]=="3"){
                        train_Y[i,1]<-"WALKING_DOWNSTAIRS"
                }
                if(train_Y[i,1]=="4"){
                        train_Y[i,1]<-"SITTING"
                }
                if(train_Y[i,1]=="5"){
                        train_Y[i,1]<-"STANDING"
                }
                if(train_Y[i,1]=="6"){
                        train_Y[i,1]<-"LAYING"
                }
        }
        #Headers are provided for the subject and activity files
        colnames(test_subj)<-"subject"
        colnames(train_subj)<-"subject"
        colnames(test_Y)<-"activity"
        colnames(train_Y)<-"activity"
        ## a new variable is created identifying subject groups
        ## all training and test variables are bound
        Training<-cbind(train_subj,train_Y,"group"=rep("TRAINING",times=seq_along(nrow(train_Y))))
        Test<-cbind(test_subj,test_Y,"group"=rep("TEST",times=seq_along(nrow(test_Y))))
        full_Training<-cbind(Training,train_X)
        full_Test<-cbind(Test,test_X)
        ## training and test data sets are merged
        merged_set<-rbind(full_Training,full_Test)
        ## variable headers are cleand up
        test_names<-grep("mean\\(\\)",names(merged_set))
        test_names2<-grep("std\\(\\)",names(merged_set))
        test_names3<-sort(c(test_names,test_names2))
        col_names<-names(merged_set[test_names3])
        large_merged<-merged_set[,c(1:3,test_names3)]
        names(large_merged)<-gsub("\\()","",names(large_merged))
        names(large_merged)<-gsub("-","",names(large_merged))
        ## a smaller tidy data set is created using activity averages per subject
        Tidy_data<<-summarise_each(group_by(large_merged,subject,activity,group),funs(mean))
}
