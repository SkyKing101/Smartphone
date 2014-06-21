### RUN_ANALYSIS.R
### DATA ANALYSIS SEQUENCE 3 -- GETTING AND CLEANING DATA, PROJECT


## Directions
# You should create one R script called run_analysis.R that does the following. 
#   Merges the training and the test sets to create one data set.
#   Extracts only the measurements on the mean and standard deviation for each measurement. 
#   Uses descriptive activity names to name the activities in the data set
#   Appropriately labels the data set with descriptive variable names. 
#   Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 


## LOAD THE DATA SETS.
    # Load the training measurements data set.
    x.train = read.table(file="DAS3CProjX_train.txt")
    # Load the test measurements data set.
    x.test = read.table(file="DAS3CProjX_test.txt")
    # Load the training subject identifiers data set.
    s.train = read.table(file="DAS3CProjsubject_train.txt")
    # Load the test subject identifiers data set.
    s.test = read.table(file="DAS3CProjsubject_test.txt")
    # Load the training activity labels data set.
    a.train = read.table(file="DAS3CProjy_train.txt")
    # Load the test activity labels data set.
    a.test = read.table(file="DAS3CProjy_test.txt")
    # Load the variables(columns) names data set.
    variable.list = read.table(file="DAS3CProjFeatures.txt")


## CHECK TO SEE THAT THE DATA SETS WERE CORRECTLY LOADED
    # Check the number of columns in the training and test sets.
    length(names(x.train))
    # [1] 561
    length(names(x.test))
    # [1] 561
    # Check the number of rows in the training and test sets.
    nrow(x.train)
    # [1] 7352
    nrow(x.test)
    # [1] 2947
    # Check that the variables in the training and test sets match.
    variable.name.match=ifelse(names(x.train)== names(x.test),T,F)
    sum(variable.name.match)
    # [1] 561
    # Check the number of rows in the subject identifiers for the training and test sets.
    nrow(s.train)
    # [1] 7352
    nrow(s.test)
    # [1] 2947
    # Check the number of rows in the activity labels for the training and test sets.
    nrow(a.train)
    # [1] 7352
    nrow(a.test)
    # [1] 2947


## ADD THE SUBJECT IDENTIFIERS AND ACTIVITY LABELS VARIABLES(COLUMNS) TO THE TRAINING AND TEST DATA SETS.
    # Create copies of the training and test data sets to preserve documentation of changes.
    x.train2 = x.train
    x.test2 = x.test
    # Add variables(columns) for subject identifiers and activity labels to the training and test data sets.
    x.train2[,562] = s.train
    x.train2[,563] = a.train
    x.test2[,562] = s.test
    x.test2[,563] = a.test
    # Check that changes were correctly made.
    head(x.train2)
    head(x.test2)
    names(x.train2)
    names(x.test2)


## MERGE THE TRAINING AND TEST DATA SETS AND CHECK THE RESULTS.
    # Create copies of the training and test data set to preserve documentation of changes.
    x.train3 = x.train2
    x.test3 = x.test2
    # Check dimensions of training and test data sets before merge.
    dim(x.train3)
    # [1] 7352  563
    dim(x.test3)
    # [1] 2947  563
    # Check that the variables(columns) in the training and test data sets match.
    variable.name.match=ifelse(names(x.train3)== names(x.test3),T,F)
    sum(variable.name.match)
    # [1] 563
    # Merge training and test data sets.
    merged = rbind(x.train3,x.test3)
    # Check to see that the number of rows of the merged file match the source files.
    nrow(x.train3) + nrow(x.test3)
    # [1] 10299
    nrow(merged)
    # [1] 10299


## IDENTIFY THE VARIABLES(COLUMNS) THAT CONTAIN MEAN AND STD MEASUREMENTS.
    # Identify the variables (columns) for "mean()" and "std()" measurements in the variables names data set.
    variable.list.cols1 = grep("*mean\\(\\)|*std\\(\\)",variable.list[,2])
    variable.list.cols1
    # [1]   1   2   3   4   5   6  41  42  43  44  45  46  81  82  83  84  85  86 121 122 123 124 125 126 161 162 163 164 165 166
    # [31] 201 202 214 215 227 228 240 241 253 254 266 267 268 269 270 271 345 346 347 348 349 350 424 425 426 427 428 429 503 504
    # [61] 516 517 529 530 542 543
    # Check to see that the correct variables(columns), for mean() and std() measurements, were identified.
    variable.list[variable.list.cols1,]
    nrow(variable.list[variable.list.cols1,])
    # [1] 66


## EXTRACT FROM THE MERGED DATA SET THE VARIABLES(COLUMNS) FOR MEAN AND STD MEASUREMENTS.
    # Create copy of the merged data set to preserve documentation of changes.
    merged2 = merged
    # Extract the variables(columns) for mean and std measurements and include columns 562 and 563, which contain the 
    #       variables for subject identifiers and activity levels.
    merged2 = merged[,c(variable.list.cols1,562,563)]
    # Check that the correct variables(columns) were extracted from the training and test data sets.
    variable.list.cols1
    # [1]   1   2   3   4   5   6  41  42  43  44  45  46  81  82  83  84  85  86 121 122 123 124 125 126 161 162 163 164 165 166
    # [31] 201 202 214 215 227 228 240 241 253 254 266 267 268 269 270 271 345 346 347 348 349 350 424 425 426 427 428 429 503 504
    # [61] 516 517 529 530 542 543
    names(merged2)
    dim(merged2)
    # [1] 10299    68


## ADD MORE DESCRIPTIVE NAMES TO THE VARIABLES(COLUMNS) OF THE MERGED DATA SET.
    # Create copy of the merged data set to preserve documentation of changes.
    merged3 = merged2
    # Create descriptive variable(column) names for the mean and std measurements.
    variable.list2 = as.character(variable.list[variable.list.cols1,][,2])
    class(variable.list2)
    # Create descriptive variable(column) names for the subject identifiers and activity labels.
    variable.list3 = c("Subject","Activity")
    # Add the descriptive variable(column) names to the merged data set.
    names(merged3) = c(variable.list2,variable.list3)
    # Check the variable(column) names for the merged data set.
    names(merged3)
    dim(merged3)
    # [1] 10299    68


## ADD MORE DESCRIPTIVE NAMES TO THE ACTIVITY LEVELS WITHIN THE ACTIVITY LEVEL VARIABLE(COLUMN) OF THE MERGED DATA SET.
    # Create copy of the merged data set to preserve documentation of changes.
    merged4 = merged3
    # Check class of the Activity variable(column) of the merged data set.
    class(merged4$Activity)
    # [1] "integer"
    # Change class of the Activity variable(column) of the merged data set to factor.
    merged4$Activity = as.factor(merged4$Activity)
    # Check the class of the Activity variable(column) of the merged data set.
    class(merged4$Activity)
    # [1] "factor"
    # Check the current levels of the Activity variable(column) of the merged data set.
    #   1 means walking, 2 means walking upstairs, 3 means walking downstairs, 4 means sitting, 5 means standing, 
    #   and 6 means lying.
    levels(merged4$Activity)
    # [1] "1" "2" "3" "4" "5" "6"
    table(merged4$Activity)
    #    1    2    3    4    5    6 
    # 1722 1544 1406 1777 1906 1944 
    # Change the factor labels for the Activity variable(column) of the merged data set.
    levels(merged4$Activity) = c("Walking","Walking Upstairs","Walking Downstairs","Sitting","Standing","Lying")
    # Check the change to the levels of the Activity variable(column) of the merged data set.
    levels(merged4$Activity)
    # [1] "Walking"            "Walking Upstairs"   "Walking Downstairs" "Sitting"            "Standing"          
    # [6] "Lying
    table(merged4$Activity)
    # Walking   Walking Upstairs Walking Downstairs            Sitting           Standing              Lying 
    #    1722               1544               1406               1777               1906               1944 


## CREATE A DATA SET THAT CONTAINS THE AVERAGE OF EACH VARIABLE FOR EACH SUBJECT IN EACH ACTIVITY.
    # Create copy of the merged data set to preserve documentation of changes.
    merged5 = merged4
    # Check the class of each variable in the merged data set.
    sapply(merged5,class)
    # Change the class of the Subject variable to factor.
    merged5$Subject = as.factor(merged4$Subject)
    class(merged5$Subject)
    # [1] "factor"
    # Create several short character-length data objects to simplify the typing of merged data set calculations 
    #   and extractions.
    d = merged5
    sapply(d,class)
    s = levels(d$Subject)
    a = levels(d$Activity)
    # Create a function to extract and then calculate average values for each measurement variable(column) for each 
    #       subject in each activity.
    mn = function(i,j,k) {
        mean(d[d$Subject == s[i] & d$Activity == a[j],k])
    }
    # Initialize a data frame to contain the calculated averages of the measurements.
    r=as.data.frame(matrix(rep(x=0,times=30*6*66),nrow=30*6,ncol=66))
    # Check to be sure that the initialization was done.
    head(r)
    # Calculate the averages for each measurement variable.  These loops are based on 30 subjects, 6 activities, and 66
    #       measurements.
    for(i in 1:30) {
        for(j in 1:6) {
            p = (i-1)*6 + j
            for(k in 1:66) { 
                r[p,k] = mn(i,j,k)
            }
        }
    }
    # Check to be sure that calculated averages were done correctly.
    head(r)
    dim(r)
    # [1] 180  66


## CREATE A DATA FRAME CONTAINING THE SUBJECT IDENTIFERS, THE ACTIVITY LABELS, AND THE CALCULATED AVERAGES.
    # Initialize subject and activity variables(columns) for the calculated averages data set.
    subj = vector("character",length=180)
    act = vector("character",length=180)
    for(i in 1:30) {
        for(j in 1:6) {
            p = (i-1)*6 + j
            act[p] = a[j]
            subj[p] = s[i]
        }
    }
    # Check the class of the subject identifiers and activity labels.
    class(act)
    # [1] "character"
    class(subj)
    # [1] "character"
    # Change the class from character to factors.
    actf = as.factor(act)
    subjf = as.factor(subj)
    # Check class of subject identifiers and activity labels.
    class(actf)
    # [1] "factor"
    class(subjf)
    # [1] "factor"
    # Create copy of the calculated averages data set to preserve documentation of changes.
    r1 = r
    # Create a data frame containing the calculated averages data set, the subject identifiers, and the activity labels.
    r2 = data.frame(r1,Subject=subjf,Activity=actf)
    # Check the data frame is correct.
    names(r2)
    head(r2)
    # Add descriptive variable(column) names to the data frame containing the calculated averages data set, the subject
    #   identifiers, and the activity labels.
    r3 = r2
    names(r3) = names(merged5) 
    # Check to see that the variable(column) names are correct.
    names(r3)
    # Shift the variables(columns) for subject identifers and activity labels to the far left to improve data readability.
    r4 = r3
    r4 = r3[,c(67,68,1:66)]
    # Check that changes were correctly made.
    head(r4)
    dim(r4)
    # [1] 180  68
    
    
## OUTPUT THE CALCULATED AVERAGES DATA SET.
    write.table(x=r4,file="output.txt")
    
    
### THE OUTPUT CALCULATED AVERAGES DATA SET IS FOUND IN THE R4 DATA OBJECT AND ALSO WRITTEN TO THE FILE "OUTPUT.TXT."
    








