library(ggplot2)
library(dplyr)
source("hw.R")

air <-read.csv("Election Data.csv")
glimpse(air)
head(air)

air[is.na(air)] <- 0
Data<- as.data.frame(air)
Data

Data<-Data[,c(4,5,6,7)]
# 1. Look at the Arrest Data


apply(Data, 2, var)

# 2. Principal Components
pr.out=prcomp(Data,scale=TRUE)
names(pr.out)
pr.out$center
pr.out$scale
pr.out$rotation
dim(pr.out$x)

# 4. Percent of Variance Explained

pr.out$sdev
pr.var=pr.out$sdev^2
pr.var
pve=pr.var/sum(pr.var)
pve
x = 1:length(pve)
qplot(x,pve, xlab="Principal Component", 
      ylab="Proportion of Variance Explained", 
      main="US votes",ylim=c(0,1)) +
  geom_line()+geom_point(shape=21,fill="red",cex=3)+hw

qplot(x,cumsum(pve), xlab="Principal Component",
      ylab="Cumulative Proportion of Variance Explained",
      main="US Votes ",ylim=c(0,1))+
  geom_line()+geom_point(shape=21,fill="red",cex=3)+hw

