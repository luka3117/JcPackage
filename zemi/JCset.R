jc.pca <- function(m) {
  m <- as.matrix(m)
  svd.m <- svd(m / sqrt(46))
  eigen <- round((svd.m$d ^ 2 / sum(svd.m$d ^ 2)) * 100, 2)
  sum(eigen[1:2]) # 2次元 説明力
  sum(eigen[1]) # pc1 説明力
  sum(eigen[2]) # pc2 説明力
  
  # observation coordinate
  OBS <- m %*% svd.m$v
  # variable coordinate
  VAR <- svd.m$v
  # variable name rotation angle
  angle <- atan(VAR[, 2] / VAR[, 1]) * 180 / pi
  return(list(
    OBS = OBS,
    VAR = VAR,
    angle = angle,
    eigen = eigen
  ))
}



Tran <- function(someColor, alpha = 100)
  # color transparent
{
  newColor <- col2rgb(someColor)
  apply(newColor, 2, function(curcoldata) {
    rgb(
      red = curcoldata[1],
      green = curcoldata[2],
      blue = curcoldata[3],
      alpha = alpha,
      maxColorValue = 255
    )
  })
}






#install.packages("psych")
#install.packages("xtable")
#install.packages("readxl")
#install.packages("psych")
# install.packages("gclus")

# pref.names<-read.csv("../../data/pref.names.csv")

library(xtable);library(readxl);library(psych);library(gclus);library(RColorBrewer)



jc.loc <- function(x) {
  temp <- rep(0, 46)
  temp[x] <- 1
  return(temp)
}





jc.cor <- function(y, x) {
  temp <- cor.test(y, x)
  c(temp$estimate, round(temp$p.value, 3))
}


jc.spear <- function(y, x) {
  temp <- cor.test(y, x, method = "spearman")
  c(temp$estimate, p.value = round(temp$p.value, 3))
}


"hcoplot" <-
  function(tree,
           diss,
           k,
           title = paste("Reordered dendrogram from", deparse(tree$call), sep = "\n"))
  {
    require(gclus)
    gr <- cutree(tree, k = k)
    tor <- reorder.hclust(tree, diss)
    plot(
      tor,
      hang = -1,
      xlab = paste(length(gr), "sites"),
      sub = paste(k, "clusters"),
      main = title
    )
    so <- gr[tor$order]
    group <- numeric(k)
    for (i in 1:k)
    {
      group[i] <- so[1]
      if (i < k)
        so <- so[so != group[i]]
    }
    rect.hclust(tor,
                k = k,
                border = group + 1,
                cluster = gr)
    legend(
      "topright",
      paste("Cluster", 1:k),
      pch = 22,
      col = 2:(k + 1),
      bty = "n"
    )
  }




jc.cut <- function(Ym, ...) {
  cut(
    Ym,
    c(min(Ym), median(Ym), max(Ym)),
    right = F,
    include.lowest = T,
    labels = ...
  )
}


jc.cut3 <- function(temp, ...) {
  cut(
    temp,
    quantile(temp, c(0, 1 / 3, 2 / 3, 1)),
    right = F,
    include.lowest = T,
    labels = ...
  )
}



# jc.cut4 <- function(temp, ...) {
#   cut(temp, 
#       quantile(temp, c(0, 0.25, 0.5, 0.75, 1)),
#       labels=c("low", "mid1", "mid2", "high"), 
#       include.lowest = T, 
#       right=F,
#       ...)
# }



jc.cut4 <-
  function(temp,
           name = c("low", "mid1", "mid2", "high"),
           ...) {
    cut(
      temp,
      quantile(temp, c(0, 0.25, 0.5, 0.75, 1)),
      labels = name,
      include.lowest = T,
      right = F,
      ...
    )
  }

# correspondence analysis
jc.ca<- function(F) {
  F<-as.matrix(F)
  n<-sum(F)
  nr<-nrow(F)
  nc<-ncol(F)
  
  P<-F/n
  (r<-apply(P, 1, sum))
  (c<-apply(P, 2, sum))
  
  A<-solve(diag(r))%*%P
  B<-A- rep(1, nr)%*%t(c)
  
  udv<-sqrt(diag(r))%*%B%*%solve(sqrt(diag(c)))
  V1<-svd(udv)$v
  singular<-svd(udv)$d
  
  V<-sqrt(diag(c))%*%V1
  
  (ROW<-B%*%solve(diag(c))%*%V)
  (COL<-solve(diag(c))%*%V)
  list(ROW=ROW, COL=COL,eigen=singular^2)
}

# correspondence plot 
jc.ca.plot<- function(table, LEorHLE="LE", ...) {
  temp<-jc.ca(table)
  ROW<-temp$ROW[, 1:2]
  rownames(ROW)<-c("low", "mid1", "mid2", "high")
  COL<-temp$COL[, 1:2]
  rownames(COL)<-c("low", "mid1", "mid2", "high")
  xlim<-range(ROW[,1], COL[,1])
  ylim<-range(ROW[,2], COL[,2])
  plot(ROW, type="n", xlim=xlim, ylim=ylim, 
       xlab="1st dimension",
       ylab="2nd dimension",
       main=...
  )
  text(ROW, 
       paste(LEorHLE,c("low", "mid1", "mid2", "high"))
  )
  text(COL, c("low", "mid1", "mid2", "high"), col="red")
  arrows(0,0,COL[,1]*0.8, COL[,2]*0.8, col=Tran("red"))
  abline(h=0, v=0, lty=2)
}



# correspondence plot 
jc.ca.plot1<- function(table, LEorHLE="LE", ...) {
  temp<-jc.ca(table)
  ROW<-temp$ROW[, 1:2]
  rownames(ROW)<-c("low", "mid1", "mid2", "high")
  COL<-temp$COL[, 1:2]
  rownames(COL)<-c("low", "mid1", "mid2", "high")
  xlim<-range(ROW[,1], COL[,1])
  ylim<-range(ROW[,2], COL[,2])
  plot(ROW, type="n", xlim=xlim, ylim=ylim, 
       xlab="1st dimension",
       ylab="2nd dimension",
       main=...
  )
  text(ROW, 
       paste(LEorHLE,c("low", "mid1", "mid2", "high")),
       col=c("black","white", "white", "black"),
       cex=c(1.5,1,1,1.5))
  text(COL, c("low", "mid1", "mid2", "high"), 
       col=c("red","white", "white", "red"),
       cex=c(1.5,1,1,1.5))
  arrows(0,0,COL[,1]*0.8, COL[,2]*0.8, lwd=c(3,1,1,3),
         col=c("red","white", "white", "red")
        )
  abline(h=0, v=0, lty=2)
}





jc.1 <- function(n=47, i=1) {return(diag(rep(1,n))[i,])}

jc.2<-function(n=47, i=1) {return(
  as.vector(t(rep(1, length(i)))%*%diag(rep(1,n))[i,]))
  }


