source('App/data/clean_data/data_mangle.R')
source('App/helpers/plots.R')

renew <- data.energy.renew() 
fossil <- data.energy.fossil() 

head(fossil)

Data1<-as.data.frame(renew)
head(Data1)
Data<-Data1[,c(4,5,6)]
lmmodel<-Data1[,c(3,4,5,6,7,8,9)]
head(lmmodel)
#liner Regressiion

lmfit<-lm(RETCB~.,data=lmmodel)
summary(lmfit)
dev.new()
par(mfrow=c(2,2))
plot(lmfit)
# 2. Principal Components
pr.out=prcomp(Data,scale=TRUE)
names(pr.out)
pr.out$center
pr.out$scale
pr.out$rotation
dim(pr.out$x)

#bipolts
biplot(pr.out,scale=0)




# 4. Percent of Variance Explained

pr.out$sdev
pr.var=pr.out$sdev^2
pr.var
pve=pr.var/sum(pr.var)
pve
x = 1:length(pve)
qplot(x,pve, xlab="Principal Component", 
      ylab="Proportion of Variance Explained", 
      main="USA Renewable Energy consumption",ylim=c(0,1)) +
  geom_line()+geom_point(shape=21,fill="red",cex=3)+hw

qplot(x,cumsum(pve), xlab="Principal Component",
      ylab="Cumulative Proportion of Variance Explained",
      main="US Renewable Energy consumption",ylim=c(0,1))+
  geom_line()+geom_point(shape=21,fill="red",cex=3)+hw

