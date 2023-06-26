setwd('C:/Users/Praahas/Projects/R-Lab/Movie-Ratings')
# Grammar of Graphics
#Data
#Aesthetics - things we see axes,color, size 
#Geometries  - square, dot, circle, triangle
#Statistics 
#Facets
#Co-Ordinates
#Theme

movies<-read.csv('movie1.csv')
movies
colnames(movies)
colnames(movies)<-c("Film","Genre","CriticRating","AudienceRating","BudgetMillions","Year")
str(movies)
movies$Genre<-as.factor(movies$Genre)
movies$Year<-as.factor(movies$Year)
summary(movies)

#Aesthetics
library(ggplot2)
#Add Geometry
ggplot(data=movies,aes(x=CriticRating,y=AudienceRating))+
  geom_point()

#Add color
ggplot(data=movies,aes(x=CriticRating,y=AudienceRating,colour=Genre))+
  geom_point()

#Add Size
ggplot(data=movies,aes(x=CriticRating,y=AudienceRating,colour=Genre,size=BudgetMillions))+
  geom_point()

#Example to see working of LAyer by layer plotting of ggplot
p<-ggplot(data=movies,aes(x=CriticRating,y=AudienceRating,colour=Genre,size=BudgetMillions))
p + geom_point()
p + geom_line()
p+geom_line()+geom_point()

#Overriding Aesthetics
q<-ggplot(data=movies,aes(x=CriticRating,y=AudienceRating,colour=Genre,size=BudgetMillions))
#Add Geom Layer
q+geom_point()
#Overriding aesthetics
q+geom_point(aes(size=CriticRating))

q+geom_point(aes(colour=BudgetMillions))

q+geom_point()#q object remains as it is. we only modified teh layers by overriding it

#Overriding axes
q+geom_point(aes(x=BudgetMillions))+
  xlab("Budget MIllions $$$")


#Till here we mapped aesthetitics. Now we shall set aesthetics here
q+geom_line(size=1)+geom_point()#Setting Aesthetics

#mapping vs Setting
r<-ggplot(data=movies,aes(x=CriticRating,y=AudienceRating))
r+geom_point()
#add color
r+geom_point(aes(colour=Genre))# use aes() function when mappingh to a variable
r+geom_point(colour="DarkGreen")#setting

r+geom_point(size=10)# use aes() function when mappingh to a variable
r+geom_point(aes(size=10))#Error

#histogram and density charts
s<-ggplot(data=movies,aes(x=BudgetMillions))
s+geom_histogram(binwidth = 10)
#Histogram - binwidth controls how wide each bar is. Each bar tells how many movie falls under that category

#addcolor
s+geom_histogram(binwidth=10,aes(fill=Genre))

s+geom_histogram(binwidth=10,aes(fill=Genre),colour="Black")

s+geom_histogram(binwidth=10,aes(fill=Genre),colour="Black")

s+geom_density(aes(fill=Genre),position="stack")

#Starting Layer 
t<-ggplot(data=movies,aes(x=AudienceRating))

#alternate way
t<-ggplot(data=movies)
t+geom_histogram(binwidth=10,aes(x=AudienceRating),fill="White",colour="Blue")
t+geom_histogram(binwidth=10,fill="White",colour="Blue")

t<-ggplot(data=movies)
t+geom_histogram(binwidth = 10,aes(x=AudienceRating),fill="White",colour="Blue")
t+geom_histogram(binwidth = 10,aes(x=CriticRating),fill="White",colour="Blue")

#Critic Rating Looks UNiformly distributed because They review movies based on technical parameters, camera work, acting, sound work etc
#Audience Rating is normal distributed because of biases

#Skeleton Plot
t<-ggplot()

#Statistical Transformations
?geom_smooth

u<-ggplot(data=movies,aes(x=CriticRating,y=AudienceRating,colour=Genre))
u+geom_point()+geom_smooth(fill=NA)
#Observe - If critics give an action movie and a horror movie a score of 75, then statistically it is very likely that theaudience wioul rate the action movie higher.
#this is observed in the graph

#boxplots
u<-ggplot(data=movies,aes(x=Genre, y=AudienceRating,colour=Genre))
u+geom_boxplot()
u+geom_boxplot(size=1.2)
u+geom_boxplot(size=1.2)+geom_point()

#tip/hack
u+geom_boxplot(size=1.2)+geom_point()+geom_jitter()

u+geom_jitter()+geom_boxplot(size=1.2,alpha=0.3)
#Meaning of Boxplots
#BAsed on genre where is teh mean and what is the statistically likely rating a movie will get
#THriller has the narrowest box ie variance is low and gets the best rating
#IF a movie is made then depending on the genre, 
#Actiopn movie may get somewhere around 60-57
#Horror has the lowest
#ROmance and Drama is pretty good

#boxplots
u<-ggplot(data=movies,aes(x=Genre, y=CriticRating,colour=Genre))
u+geom_boxplot()
u+geom_boxplot(size=1.2)
u+geom_boxplot(size=1.2)+geom_point()

#tip/hack
u+geom_boxplot(size=1.2)+geom_point()+geom_jitter()

u+geom_jitter()+geom_boxplot(size=1.2,alpha=0.3)


#Facets
v<-ggplot(data=movies,aes(x=BudgetMillions))
v+geom_histogram(binwidth=10,aes(fill=Genre),colour="Black")

v<-ggplot(data=movies,aes(x=BudgetMillions))
v+geom_histogram(binwidth=10,aes(fill=Genre),colour="Black")+
  facet_grid(Genre~.)

v<-ggplot(data=movies,aes(x=BudgetMillions))
v+geom_histogram(binwidth=10,aes(fill=Genre),colour="Black")+
  facet_grid(Genre~.,scales="free")

#scatterplots
w<-ggplot(data=movies,aes(x=CriticRating,y=AudienceRating,colour=Genre))
w+geom_point(size=3)

#facets
w+geom_point(size=3)+
  facet_grid(Genre~.)

w+geom_point(size=3)+
  facet_grid(Year~.)

w+geom_point(size=3)+
  facet_grid(Genre~Year)

w+geom_point(size=3)+
  geom_smooth()+
  facet_grid(Genre~Year)

w+geom_point(aes(size=BudgetMillions))+
  geom_smooth()+
  facet_grid(Genre~Year)

#Co-ordinates - settign co-ordinates
m<-ggplot(data=movies,aes(x=CriticRating,y=AudienceRating,size=BudgetMillions,colour=Genre))
m+geom_point()

m+geom_point()+
  xlim(50,100)+
  ylim(50,100)
#Above method wont work well always as shown below

n<-ggplot(data=movies,aes(x=BudgetMillions))
n+geom_histogram(binwidth=10,aes(fill=Genre),colour="Black")+
  ylim(0,50)

#instead use zoom
n+geom_histogram(binwidth=10,aes(fill=Genre),colour="Black")+
  coord_cartesian(ylim=c(0,50))

w<-ggplot(data=movies,aes(x=CriticRating,y=AudienceRating,colour=Genre))
w+geom_point(aes(size=BudgetMillions))+
  geom_smooth()+
  facet_grid(Genre~Year)+
  coord_cartesian(ylim=c(0,100))

#observation
#CEO wanted this info
#Action - when critics rate it low, audience tend to rate it low too
#And when critics rate it high, audience tend to rate it high as well
#Audience have rarely rated comedies low, regardless of how the critics rate them
#Audience ratings have slowly improved for comedies over teh years
#Action also has shown good performance
#Drama looks good too..rating over 50 consistently

#Theme
o<-ggplot(data=movies,aes(x=BudgetMillions))
h<-o+geom_histogram(binwidth=10,aes(fill=Genre),colour="Black")

#Add axes label + label formatting
h+xlab("Money Axis")+
  ylab("Number of Movies")+
  theme(axis.title.x= element_text(colour="DarkGreen",size=30),
        axis.title.y = element_text(colour="Red",size=30))


h+xlab("Money Axis")+
  ylab("Number of Movies")+
  theme(axis.title.x= element_text(colour="DarkGreen",size=30),
        axis.title.y = element_text(colour="Red",size=30),
        axis.text.x=element_text(size=20),
        axis.text.y=element_text(size=20))

#legend formatting
h+xlab("Money Axis")+
  ylab("Number of Movies")+
  theme(axis.title.x= element_text(colour="DarkGreen",size=30),
        axis.title.y = element_text(colour="Red",size=30),
        axis.text.x=element_text(size=20),
        axis.text.y=element_text(size=20),
        legend.title=element_text(size=30),
        legend.text=element_text(size=20),
        legend.position=c(1,1),
        legend.justification=c(1,1))


#Title Formatting
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

