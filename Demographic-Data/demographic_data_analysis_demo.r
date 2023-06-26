rm(list=ls())
# Importing the dataset
#dataset = read.csv('C:/Users/Praahas/Projects/R-Lab/R-Lab/Demographic-Data/P2-Demographic-Data.csv')
#dataset<-read.csv(file.choose())
#dataset
#View(dataset)
#getwd()
setwd('C:/Users/Praahas/Projects/R-Lab//Demographic-Data')
dataset<-read.csv('P2-Demographic-Data.csv')
View(dataset)

#Exploring Data
nrow(dataset)#Gives number of rows in dataset
ncol(dataset)#Gives number of columns in dataset
head(dataset)#Top 6 rows
tail(dataset)#Bottom 6 rows
head(dataset,n=10)#Top n rows
tail(dataset,n=10)#Bottom n rows
str(dataset)#Structure of dataset
summary(dataset)

dataset[3,3]
dataset[3,"Birth.rate"]
dataset$Internet.users 
dataset[,"Internet.users"] 
str(dataset)#Structure

#Basic Operations with DataFrame
dataset[1:10,]
dataset[3:9,] #oBSERVE THE numbering in teh terminal
dataset[c(4,100),]
dataset[,1]
is.data.frame(dataset[1,])
is.data.frame(dataset[,1])
is.data.frame(dataset[,1,drop=F])
dataset[,1,drop=F]
#Add Column
dataset$MyCalculation<-dataset$Birth.rate*2
dataset
dataset$xyz<-1:5
head(dataset,n=10) #Observe xyz column
#(observe data values getting recycled)

#Removing Columns
dataset$MyCalculation<-NULL
dataset$xyz<-NULL

#Filtering DatFrames
filter<-dataset$Internet.users<2
dataset[filter,]
dataset[dataset$Internet.users<2,]

dataset[dataset$Birth.rate>40,2,drop=F]

dataset[dataset$Birth.rate>40 & dataset$Internet.users<2,]
dataset[dataset$Income.Group=="High income",]

library(ggplot2)
qplot(data=dataset,x=Internet.users)
qplot(data=dataset,x=Income.Group,y=Birth.rate,size=I(3))
qplot(data=dataset,x=Income.Group,y=Birth.rate,size=I(3),colour=I("blue"))
qplot(data=dataset,x=Income.Group,y=Birth.rate,geom="boxplot")
qplot(data=dataset,x=Internet.users,y=Birth.rate,size=I(4),colour=I("red"))
qplot(data=dataset,x=Internet.users,y=Birth.rate,size=I(4),colour=Income.Group,main="Birth Rate vs Internet Users")

#Building Dataframes
df<-data.frame(Countries_2012_Dataset,Codes_2012_Dataset,Regions_2012_Dataset)
View(df)
head(df)
colnames(df)<-c("Country","Code","Region")
head(df)
rm(df)

#Same operation in one function
df<-data.frame(Country=Countries_2012_Dataset,Code=Codes_2012_Dataset,Region=Regions_2012_Dataset)
df

#Merging DataFrames
head(dataset)
head(df)

merged_df<-merge(dataset,df,by.x="Country.Code",by.y="Code")
View(merged_df)
dataset
merged_df$Country<-NULL
str(merged_df)

#Visualization
qplot(data=merged_df,x=Internet.users,y=Birth.rate)
qplot(data=merged_df,x=Internet.users,y=Birth.rate,size=I(4),colour=Region)

#Shapes (0-25) 
qplot(data=merged_df,x=Internet.users,y=Birth.rate,colour=Region,size=I(5),shape=I(17))
qplot(data=merged_df,x=Internet.users,y=Birth.rate,colour=Region,size=I(5),shape=I(2))

#Transparency(0-1)
qplot(data=merged_df,x=Internet.users,y=Birth.rate,colour=Region,size=I(5),shape=I(17),alpha=I(0.5),main="Birth Rate vs Internet Users")


#Second Task:
setwd('C:/Users/Praahas/Projects/R-Lab/R-Lab/Demographic-Data')
dataset<-read.csv('P2-Demographic-Data_2.csv')
head(dataset)
tail(dataset)
str(dataset)
summary(dataset)

dataset$Year
temp<-factor(dataset$Year)
levels(temp)

#filter dataframe
data1960<-dataset[dataset$Year==1960,]
data2013<-dataset[dataset$Year==2013,]

#observe Equal Split
nrow(data1960)
nrow(data2013)
add1960<-data.frame(Code=Country_Code,Life.Exp=Life_Expectancy_At_Birth_1960)
add2013<-data.frame(Code=Country_Code,Life.Exp=Life_Expectancy_At_Birth_2013)
summary(add1960)
summary(add2013)

#Merge Dataframe
merged1960<-merge(data1960,add1960,by.x="Country.Code",by.y="Code")
merged2013<-merge(data2013,add2013,by.x="Country.Code",by.y="Code")

merged1960$Year<-NULL
merged2013$Year<-NULL

library(ggplot2)
qplot(data=merged1960,x=Fertility.Rate,y=Life.Exp,colour=Region,size=I(5),shape=I(17),alpha=I(0.5),main="Life Expectancy vs Fertility Rate (1960)")
qplot(data=merged2013,x=Fertility.Rate,y=Life.Exp,colour=Region,size=I(5),shape=I(17),alpha=I(0.5),main="Life Expectancy vs Fertility Rate (2013)")
