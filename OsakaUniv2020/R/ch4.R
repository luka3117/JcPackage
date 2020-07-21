# ------------------------------------------------------------------
#
# page 121 table 4.2 snoring data
#
# ------------------------------------------------------------------
yes<-c(24, 35, 21, 30)
no<-c(1355, 603, 192, 224)
n<-yes+no
p<-yes/n
snoring<-c(0,2,4,5)
# system("open .")
table4.2<-as.data.frame(cbind(yes, no, n, p, snoring ))

table4.2.long <- read.csv(file = "table4.2.long.csv")


