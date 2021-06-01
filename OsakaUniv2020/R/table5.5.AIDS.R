table5.5.AIDS<-expand.grid(
  AZT=c("yes", "no"),
  RACE=c("W", "B"))

Y<-c(14,32,11,12)
N<-c(93,81,52,43)


table5.5.AIDS<-data.frame(cbind(Y,N, table5.5.AIDS))

