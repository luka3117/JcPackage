# 使用package
suppressMessages(library(tidyverse))

# Principal Components Analysis
# source("jcset.r", encoding = "utf8")
# pref.names <- read.csv("pref.names.csv", fileEncoding = "cp932")
# var.label <- read.csv("var.csv", fileEncoding = "cp932")



mf <-
  read.csv("maindz.csv",
           stringsAsFactors = F,
           fileEncoding = "cp932")


mf %>% tbl_df()

f.dz<-split(x = mf, f = mf$sex)[[1]]
m.dz<-split(x = mf, f = mf$sex)[[2]]

Pref<-f.dz$Pref


m.dz <- m.dz %>% select(-乳房がん,-子宮がん, -sex, -Pref) %>% tbl_df()
f.dz <- f.dz %>% select(-sex, -Pref) %>% tbl_df()






