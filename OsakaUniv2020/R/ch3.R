# page 71
# table 3.1
tab.3.1<-matrix(c(28, 18, 656, 658), c(2,2))
colnames(tab.3.1)<-c("yes", "no")
rownames(tab.3.1)<-c("Placebo", "Aspirin")



# page 80 religion example
n<-c(178,138,108,570,648,442,138,252,252)
(table.3.2.c<-cbind(expand.grid(list(Religious.Beliefs=c("Fund", "Mod", "Lib"), Highest.Degree=c("<HS","HS or JH", "Bachelor or Grad"))), count=n) )
(table.3.2<-xtabs(count~ Highest.Degree + Religious.Beliefs,  data=table.3.2.c)
)




# table.3.3 ----------------------------------------------------------------

schizo.counts<-c(90,12,78,13,1,6,19,13,50)

table.3.3<-cbind(
  expand.grid(list(
    Origin=c("Biogenic", "Environmental","Combination"),
    School=c("Eclectic","Medical", "Psychoanalytic")
  )
  ),
  count=schizo.counts)


table.3.3<-xtabs(count~School+Origin, table.3.3)

# vcd package



# page 87  jobsatisfaction data M^2.
#------------------------------------------------------------------------------------------
# page 87 jobsatisfication data trend
income<-c("<15000","15000-25000","25000-40000",">40000")
jobsat<-c("VD","LD","MS","VS")
(table.2.8<-expand.grid(income=income,jobsat=jobsat))
count<-c(1,2,1,0,3,3,6,1,10,10,14,9,6,7,12,11)
table.2.8<-cbind(table.2.8,count)
levels(table.2.8$income)<-c(7.5,20,32.5,60)
levels(table.2.8$jobsat)<-1:4
table.2.8.score<-table.2.8

# page 88  jobsatisfaction data gamma and CI.
income<-c("<15000","15000-25000","25000-40000",">40000")
jobsat<-c("VD","LD","MS","VS")
(table.2.8<-expand.grid(income=income,jobsat=jobsat))
count<-c(1,2,1,0,3,3,6,1,10,10,14,9,6,7,12,11)
(table.2.8<-cbind(table.2.8,count))
(temp<-xtabs(count~income+jobsat,table.2.8))

# library(vcdExtra)
# GKgamma(temp) # gamma coefficient

# page 92  Fisher's exact test　

table.3.8<- matrix(c(3,1,1,3),byrow=T,ncol=2)


# (test<-fisher.test(table.3.8))
# (test$p.value/2)
#
# (a<-dhyper(3, m=4, n=4, k=4))
# (b<-dhyper(4, m=4, n=4, k=4))
# a+b # exact p-value
#
# (fisher.test(matrix(c(3,1,1,3), byrow=T, ncol=2), alternative="greater"))
# #============================================
#
# # page 107  problem 3.13 Fisher's exact test　
# (test<-fisher.test(matrix(c(21, 2, 15, 3),byrow=T,ncol=2)))
# (test$p.value/2)
#
# (a<-dhyper(21, m=23, n=18, k=36))
# (b<-dhyper(22, m=23, n=18, k=36))
# (c<-dhyper(23, m=23, n=18, k=36))
# a+b+c # exact p-value
#
# (fisher.test(matrix(c(3,1,1,3), byrow=T, ncol=2), alternative="greater"))
# #============================================
