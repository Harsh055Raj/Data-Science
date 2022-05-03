movie<-read.csv(file.choose())
install.packages('gganimate')
movie
library(gganimate)
install.packages("gifski")
head(movie,5)
colSums(is.na(movie))
colnames(movie)=c("Film","Genre","CriticsRating","AudienceRating","Budget","Year")
head(movie)
str(movie)
summary(movie)
movie$Year<-as.factor(movie$Year)
summary(movie)
# Here we convert the year as the factor as the Data can can be analyzed as different value 
library(ggplot2)
ggplot(data=movie,aes(x=AudienceRating,y=CriticsRating))+
  geom_point(aes(color=Genre,size=Budget))

ggplot(data=movie,aes(x=AudienceRating,y=CriticsRating))+
  geom_point(color="2",size=2)

graph1=ggplot(data=movie,aes(x=Year))+
  geom_bar(aes(fill=Genre))+
  transition_time(time)
graph1
graph1.animation=graph1+
  transition_time(time)

ggplot(data=movie,aes(x=Year))+
  geom_bar()+
  ylab("C")+
  geom_text(aes(label = Year),stat="Year",vjust=0)

ggplot(data=movie,aes(x=Budget))+
  geom_histogram(binwidth=10,fill="3",color="5")

ggplot(data=movie,aes(x=Budget))+
  geom_histogram(aes(fill=Genre),bindwidth=10)

ggplot(data=movie,aes(x=Budget))+
  geom_density(aes(fill=Genre),position="stack")
ggplot(data=movie,aes(x=Budget))+
  geom_density(aes(fill=Genre))
ggplot(data=movie,aes(x=Budget))+
  geom_density(fill="4")
ggplot(data=movie,aes(x=Budget,y=Genre))+
  geom_boxplot(fill="2")+
  coord_flip()#+geom_jitter()
ggplot(data=movie,aes(x=Budget,y=Genre))+
  geom_boxplot(aes(fill="Genre"))

