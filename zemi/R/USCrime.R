USCrime <- read.table("USCrime.txt", header = T)
rownames(USCrime)<-USCrime[,1]
USCrime<-USCrime[,-1]


