bdata<-read.csv(file.choose())
bdata
str(bdata)
colSums(is.na(bdata))

bdata$Survived <-as.factor(bdata$Survived )
bdata$Pclass<-as.factor(bdata$Pclass)
bdata$Sex<-as.factor(bdata$Sex)
bdata$SibSp<-as.factor(bdata$SibSp)
bdata$Parch<-as.factor(bdata$Parch)
bdata$Embarked<-as.factor(bdata$Embarked)
str(bdata)
library(caTools) 
library(e1071)
split<-sample.split(bdata$Survived,SplitRatio = 0.85)
split
train<-subset(bdata,split==TRUE)
test<-subset(bdata,split==FALSE)
dim(train)
dim(test)
train.fit<-naiveBayes(Survived~SibSp+Sex+Pclass,data=train)
P.train<-predict(train.fit,train)
table(P.train,train$Survived)
(398+209)/(403+203+64+88)
P.test<-predict(train.fit,test)
table(P.test,test$Survived)
(62+37)/(66+32+19+16)
# The combination of Sibsp , Gender ,Passenger class makes the most accurate 
# analysis of the existing survivals.
