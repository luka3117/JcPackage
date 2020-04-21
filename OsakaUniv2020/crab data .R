# page 128 figure 4.3

(crab<-read.table("crab.txt", col.names=c("C","S","W","Sa","Wt"), header=T))
(crab<-read.table("crab.txt", header=T))
head(crab)
temp<-table(S=crab$satell, W=crab$width)
(temp<-as.data.frame(temp))
head(temp)
temp<-temp[temp$Freq!=0, ]
temp$S<-as.numeric(as.vector(temp$S))
temp$W<-as.numeric(as.vector(temp$W))

plot(temp$S~temp$W,
     xlab="Width (cm)",
     ylab="Number of Satellites",
     bty="L",
     axes=F,
     type="n")
axis(2, at=1:15)
axis(1, at=seq(20,34,2))
text(temp$S~temp$W, labels=temp$Freq)


# page 129 figure 4.4

(crab.g<-read.table("crab_grouped.txt", header=T))
plot(crab.g$Mean~crab.g$Width,
     ylab="Number of Satellites", xlab="Width (cm)",
     bty="L",axes=F, type="p", pch=16)
axis(2, at=0:5)
axis(1, at=seq(20,34,2))

#install.packages("mgcv")
library(mgcv)
res<- gam(crab.g$Mean~s(crab.g$Width, k=4, fx=TRUE), family=poisson(link=log)
          ,data=crab.g)
lines(x=crab.g$Width,y=res$fitted.values)

#  page 130 fig 4.5
log.fit<-glm(satell~width, family=poisson(link=log),data=crab)
id.fit<-glm(satell~width, family=poisson(link=identity),data=crab,
            start=coef(log.fit))

crab.g<-read.table("crab_grouped.txt", header=T)
plot(crab.g$Mean~crab.g$Width,
     ylab="Number of Satellites", xlab="Width (cm)",
     bty="L",axes=F, type="p", pch=16)
axis(2, at=0:5)
axis(1, at=seq(20,34,2))

ind<-order(crab$width)
lines(log.fit$fitted.values[ind]~crab$width[ind])
lines(id.fit$fitted.values[ind]~crab$width[ind])





