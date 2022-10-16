#week2 Lecture 2, 3, 4
#Data source (High School and Beyond survey):
#https://www.openintro.org/data/index.php?data=hsb2

hsb2 <- read.table('https://stats.idre.ucla.edu/wp-content/uploads/2016/02/hsb2-2.csv', header=T, sep=",")

#hsb2 <-read.csv("C:/Users/Administrator/Desktop/Econ_101_Velovici/week2/hsb2.csv",header=T, sep=",")
attach(hsb2)
library(lattice)

hsb2$read
read


#preview of this dataset and its structure:
head(hsb2)
str(hsb2)
View(hsb2)

##statistics summary
min(write)
max(write)
range(write)

range2 <- function(x) {
  range <- max(x) - min(x)
  return(range)
}
range2(write)

range(read)
range2(read)

mean(write)
median(write)


quantile(write, probs = seq(0, 1, 0.25))

quantile(write, probs = seq(0, 1, 0.1))
quantile(read, probs = seq(0, 1, 0.1))
quantile(science, probs = seq(0, 1, 0.25))

var(write)
sd(write)
sd(science)

summary(write)

cor(write, read)
cor(write, science)

hsb2.sub <- subset(hsb2, select= read:science)
cor(hsb2.sub)
View(hsb2.sub)

##Display and Explore Data
#scattor plot
plot(write, read)
plot(science, read)
plot(math, read)

e <- rnorm(200, mean =5, sd = 6)
sing<-write*-0.8+e
plot(write, sing)
cor(write, sing)


#Distribution of writing score

#histograms
histogram(~write)
#histogram(~write, hsb2)
histogram(~read)


#defining ses.f to be a factor variable
ses.f = factor(ses, labels=c("low", "middle", "high")) 
ses.f
#hsb2$ses.f = factor(hsb2$ses, labels=c("low", "middle", "high")) 
#conditional plot
histogram(~write | ses.f)
histogram(~read | ses.f)
histogram(~math | ses.f)
histogram(~science | ses.f)


densityplot(~write)
densityplot(~read)

#pie chart
tab<-table(ses.f)
tab
View(tab)
pie(tab)

cols <- rainbow(nrow(tab))
tab2<-c("Low","Middle","High")
tab
tab2
pie(tab,labels=paste0(round(tab/sum(tab)*100,2),'%'),col=cols,main = "Students Socio economic status");
legend('bottomleft',cex=0.7,legend=tab2,pch='■',ncol=nrow(tab),col=cols);


#bar chart
#get relative frequency#
tab.f=prop.table(tab)
tab
tab.f
barplot(tab.f,xlab="Socio economic status", ylab="Frequency")

pie(tab,labels=tab.f,col=cols,main = "Students Socio economic status");

#try ggplot2!






