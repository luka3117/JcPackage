#   Build and Reload Package:  'Ctrl + Shift + B'
#   Check Package:             'Ctrl + Shift + E'
#   Test Package:              'Ctrl + Shift + T'

# 使用package
# suppressMessages(library(tidyverse))

Michi_Eki_data <- read.csv("Michi_Eki_data.csv", fileEncoding = "cp932")
道の駅 <- read.csv("Michi_Eki_data.csv", fileEncoding = "cp932")

道の駅アソシエーションデータ <-
  道の駅[c("野菜",
     "果実",
     "漬物",
     "花木",
     "米",
     "魚及び加工品",
     "畜産品",
     "卵",
     "牛乳及び加工品",
     "きのこ",
     "山菜",
     "なし")]


d <- read.csv("乙九日アンケート20171023.csv", fileEncoding = "cp932")
d <- d[,c(1,2,11:25)]
d <- d[,-c(11,16)]
colnames(d)[15] <- "菓子類"


x <- d[,4:15]

# iris.df<-iris
# iris.list<-iris3
# iris.list1<-iris3
