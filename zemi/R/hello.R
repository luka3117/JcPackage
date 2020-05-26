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

m.dz <- m.dz %>% select(-乳房がん,-子宮がん) %>% tbl_df()
f.dz <- f.dz %>% tbl_df()




# pca func -----------------------------------------------------------------

jc.pca <- function(m) {
  m <- matrix(m)
  svd.m <- svd(m / sqrt(46))
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






#
# #----主成分男性----
# temp <- scale(sapply(m.dz, rank))
# scale(m.dz)
# colnames(temp)
#
# OBS <- jc.pca(temp)$OBS[, c(1, 2)]
# (rownames(OBS) <- as.character(pref.names$pref.J))
# VAR <- jc.pca(temp)$VAR[, c(1, 2)]
# (rownames(VAR) <- var.label[c(3:6, 9:12), 2])
# angle <- jc.pca(scale(temp))$angle
# jc.pca(temp)$eigen
#
#
# pdf("./res/m.pca.pdf", family = "Japan1")
# plot(
#   OBS[, 1],
#   OBS[, 2],
#   type = "n",
#   xlab = "PC1(27%)",
#   ylab = "PC2(20%)",
#   main = "男性8大疾患\n主成分分析"
# )
# text(OBS[, 1], OBS[, 2], pref)
# abline(h = 0, v = 0, lty = 2)
# times <- 3
# arrows(
#   0,
#   0,
#   VAR[, 1] * times,
#   VAR[, 2] * times,
#   length = 0.1,
#   col = Tran("blue", 90),
#   lwd = 2
# )
# text(VAR * times * 1.2, colnames(temp), cex = 1.5, col = "red")
# dev.off()
#

# zemi::jc.ca()

