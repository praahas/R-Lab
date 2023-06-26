setwd('C:/Users/Praahas/Projects/R-Lab/Movie-Ratings')
movies<-read.csv('movie1.csv')
colnames(movies)<-c("Film","Genre","CriticRating","AudienceRating","BudgetMillions","Year")
str(movies)
movies$Genre<-as.factor(movies$Genre)
movies$Year<-as.factor(movies$Year)
summary(movies)

library(ggplot2)
p<-ggplot(data=movies,aes(x=CriticRating,y=AudienceRating,colour=Genre,size=BudgetMillions))
p + geom_point()
#>>>This graph1 can be improved 

#Overriding Aesthetics
q<-ggplot(data=movies,aes(x=CriticRating,y=AudienceRating,colour=Genre,size=BudgetMillions))
q+geom_point(aes(x=BudgetMillions))+
  xlab("Budget MIllions $$$")
#>>>This graph2 

#histogram and density charts
s<-ggplot(data=movies,aes(x=BudgetMillions))
s+geom_histogram(binwidth=10,aes(fill=Genre),colour="Black")
#>>>This graph3 which can be improved


t<-ggplot(data=movies)
t+geom_histogram(binwidth = 10,aes(x=AudienceRating),fill="White",colour="Blue")
t+geom_histogram(binwidth = 10,aes(x=CriticRating),fill="White",colour="Blue")
#>>>This is graph4 and Graph5

u<-ggplot(data=movies,aes(x=Genre, y=AudienceRating,colour=Genre))
u+geom_jitter()+geom_boxplot(size=1.2,alpha=0.3)
#>>>This is Graph6

w<-ggplot(data=movies,aes(x=CriticRating,y=AudienceRating,colour=Genre))
w+geom_point(aes(size=BudgetMillions))+
  geom_smooth()+
  facet_grid(Genre~Year)+
  coord_cartesian(ylim=c(0,100))
#>>>This is an improvement to graph1 

o<-ggplot(data=movies,aes(x=BudgetMillions))
h<-o+geom_histogram(binwidth=10,aes(fill=Genre),colour="Black")
h+xlab("Money Axis")+
  ylab("Number of Movies")+
  ggtitle("Movie Budget Distribution")+
  theme(axis.title.x= element_text(colour="DarkGreen",size=30),
        axis.title.y = element_text(colour="Red",size=30),
        axis.text.x=element_text(size=20),
        axis.text.y=element_text(size=20),
        legend.title=element_text(size=30),
        legend.text=element_text(size=20),
        legend.position=c(1,1),
        legend.justification=c(1,1),
        plot.title = element_text(colour="DarkBlue",
                                  size=40,
                                  family="Courier"))
#>>>THis is an improvement to Graph3


setwd('C:/Users/Praahas/Projects/R-Lab/Movie-Ratings')
movies<-read.csv('movie2.csv')
View(movies)
str(movies)
#Genre,gross%US,aes - Budget,Studio
colnames(movies)
colnames(movies)<-c("Day.of.Week","Director","Genre","Movie.Title","Release.Date","Studio",
                    "Adjusted.Gross.mill","Budget.mill","Gross.mill","IMDb.Rating",
                    "MovieLens.Rating","Overseas.mill","Overseas","Profit.mill","Profit",
                    "Runtime.min","US.mill","Gross.US")
library(ggplot2)

#Interesting insight
ggplot(data=movies,aes(x=Day.of.Week))+
  geom_bar()

#Observe that no movie relkeased on Monday
colnames(movies$Studio)
filter1<-(movies$Genre=="action")|(movies$Genre=="adventure")|(movies$Genre=="animation")|(movies$Genre=="comedy")|(movies$Genre=="drama")
filter2<-(movies$Studio %in% c("Buena Vista Studios","WB","Fox","Universal","Sony","Paramount Pictures"))
movies2<-movies[filter1&filter2,]
p<-ggplot(data=movies2,aes(x=Genre,y=Gross.US))
q<-p+geom_jitter(aes(size=Budget.mill,colour=Studio))+
  geom_boxplot(alpha=0.7,outlier.colour=NA)
#non data ink
q<-q+
  xlab("Genre")+
  ylab("Gross% US")+
  ggtitle("Domestic Gross % by Genre")

#install.packages('extrafont')
library(extrafont)
#y
#font_import()
#loadfonts(device = "win")
q<-q+theme(axis.title.x = element_text(colour="Blue",size=30),
           axis.title.y = element_text(colour="Blue",size=30),
           axis.text.x = element_text(size=20),
           axis.text.y = element_text(size=20),
           plot.title=element_text(size=40),
           legend.title=element_text(size=20),
           legend.text=element_text(size=20),
           text=element_text(family="Comic Sans MS"))

q$labels$size<-"Budget $M"
q
