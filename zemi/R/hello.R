# 使用package
suppressMessages(library(tidyverse))

# Principal Components Analysis
source("jcset.r", encoding = "utf8")
# pref.names <- read.csv("pref.names.csv", fileEncoding = "cp932")
# var.label <- read.csv("var.csv", fileEncoding = "cp932")



mf <-
  read.csv("maindz.csv",
           stringsAsFactors = F,
           fileEncoding = "cp932")


m.dz %>% tbl_df()


#----主成分男性----
temp <- scale(sapply(m.dz, rank))
scale(m.dz)
colnames(temp)

OBS <- jc.pca(temp)$OBS[, c(1, 2)]
(rownames(OBS) <- as.character(pref.names$pref.J))
VAR <- jc.pca(temp)$VAR[, c(1, 2)]
(rownames(VAR) <- var.label[c(3:6, 9:12), 2])
angle <- jc.pca(scale(temp))$angle
jc.pca(temp)$eigen


pdf("./res/m.pca.pdf", family = "Japan1")
plot(
  OBS[, 1],
  OBS[, 2],
  type = "n",
  xlab = "PC1(27%)",
  ylab = "PC2(20%)",
  main = "男性8大疾患\n主成分分析"
)
text(OBS[, 1], OBS[, 2], pref)
abline(h = 0, v = 0, lty = 2)
times <- 3
arrows(
  0,
  0,
  VAR[, 1] * times,
  VAR[, 2] * times,
  length = 0.1,
  col = Tran("blue", 90),
  lwd = 2
)
text(VAR * times * 1.2, colnames(temp), cex = 1.5, col = "red")
dev.off()

