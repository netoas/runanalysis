
####loadin the files###

subjecttest <- read.table("subject_test.txt")
subjecttrain <- read.table("subject_train.txt")
xtrain <- read.table("X_train.txt", sep="")
xtest<- read.table("X_test.txt", sep="")
activity <- read.table("activity_labels.txt")
ytest <- read.table("y_test.txt")
ytrain <- read.table("y_train.txt")
features <- read.table("features.txt", sep="")

###creating the general dataframe###

ytest <- merge(activity,ytest,by.ytest = "v1")
ytest <- cbind(subjecttest,ytest)
colnames(ytest) <- c("subject","cod","activity")
names(xtest) <- features[, 2]
xtest <- cbind(ytest,xtest)
ytrain <- merge(activity,ytrain,by.ytrain = "v1")
ytrain <- cbind(subjecttrain,ytrain)
colnames(ytrain) <- c("subject","cod","activity")
names(xtrain) <- features[, 2]
xtrain <- cbind(ytrain,xtrain)
df <- rbind(xtest,xtrain) # general data set


###correcting the names of variables###

names(df) <- gsub("[(),-]","",names(df))
names(df) <- tolower(names(df))

### subsetting the variables, by "mean" and "std"###

my <- grep("mean|std",names(df))
mydata <- df[,my] #mean.std data set

###creatinng the second tidy data set ###

install.packages("reshape2")
library(reshape2)
z <- melt(df, id.vars = c("cod","activity","subject"))
tidy <- dcast(z, cod+activity+subject ~ variable, fun.aggregate = mean)
write.table(tidy, "tidy.txt", sep="\t")
          
    




 












