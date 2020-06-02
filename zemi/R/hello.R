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


# pca func -----------------------------------------------------------------

JcPCA <- function(m) {
  # m <- as.matrix(m)
  n<-dim(m)[1]
  svd.m <- svd(m / sqrt(n-1))
  eigen <- round((svd.m$d ^ 2 / sum(svd.m$d ^ 2)) * 100, 2)
  sum(eigen[1:2])
  sum(eigen[1]) #
  sum(eigen[2]) #

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




