rm(list=ls())
library(ggplot2)
dataset = read.csv('C:/Users/Praahas/Projects/R-Lab/Demographic-Data/P2-Demographic-Data.csv')
#View the Dataset after reading it
View(dataset)

#Scatterplot illustrating Birth Rate and Internet Usage statistics by Country categorizing by Countries’ Income Groups.
qplot(data=dataset,x=Internet.users,y=Birth.rate,size=I(4),colour=Income.Group)

merged_df<-merge(dataset,df,by.x="Country.Code",by.y="Code")
merged_df$Country<-NULL

#Setting Transparency to 50% so that overlapping datapoints are visible. Shape can be set with values from (#Scatterplot illustrating Birth Rate and Internet Usage statistics by Country categorizing by Countries’ Regions. Additional data required is present in Vectors
#Building DataFrame from Vectors and setting column names to Country, Code and Region
df<-data.frame(Country=Countries_2012_Dataset,Code=Codes_2012_Dataset,Region=Regions_2012_Dataset)

#Merge the DataFrame df with original dataset and remove any columns with repeated information 0-25)
qplot(data=merged_df,x=Internet.users,y=Birth.rate,colour=Region,size=I(5),shape=I(17),alpha=I(0.5),main="Birth Rate vs Internet Users")

# Scatterplot depicting Life Expectancy and Fertility Rate statistics by Country categorizing by Countries’ Regions.
dataset = read.csv('C:/Users/Praahas/Projects/R-Lab/Demographic-Data/P2-Demographic-Data_2.csv')
#View the Dataset after reading it
# Splitting the data frame into two: data1960 and data2013.
data1960<-dataset[dataset$Year==1960,]
data2013<-dataset[dataset$Year==2013,]
#Build DataFrame from Data Vectors
add1960<-data.frame(Code=Country_Code,Life.Exp=Life_Expectancy_At_Birth_1960)
add2013<-data.frame(Code=Country_Code,Life.Exp=Life_Expectancy_At_Birth_2013)

#Merge the DataFrames & remove repeated columns
merged1960<-merge(data1960,add1960,by.x="Country.Code",by.y="Code")
merged2013<-merge(data2013,add2013,by.x="Country.Code",by.y="Code")
merged1960$Year<-NULL
merged2013$Year<-NULL
qplot(data=merged1960,x=Fertility.Rate,y=Life.Exp,colour=Region,size=I(5),shape=I(17),alpha=I(0.5),main="Fertility Rate vs Life Expectancy (1960)")
qplot(data=merged2013,x=Fertility.Rate,y=Life.Exp,colour=Region,size=I(5),shape=I(17),alpha=I(0.5),main="Fertility Rate vs Life Expectancy (2013)")
