system("open .")

# remove.packages(pkgs = "zemi")
# devtools::build(binary = T)

library(zemi)

zemi::m.dz
temp <- scale(sapply(zemi::m.dz, rank))
scale(zemi::m.dz)
colnames(temp)
OBS <- zemi::JcPCA(temp)$OBS[, c(1, 2)]
(rownames(OBS) <- as.character(zemi::Pref))
VAR <-zemi::JcPCA(temp)$VAR[, c(1, 2)]
(rownames(VAR) <- colnames(zemi::m.dz))


angle <- JcPCA(scale(temp))$angle

JcPCA(temp)$eigen



# biplot ------------------------------------------------------------------

par(family= "HiraKakuProN-W3")

plot(
  OBS[, 1],
  OBS[, 2],
  type = "n",
  xlab = "PC1(27%)",
  ylab = "PC2(20%)",
  main = "男性8大疾患\n主成分分析"
)



text(OBS[, 1], OBS[, 2], Pref)
abline(h = 0, v = 0, lty = 2)
times <- 3
arrows(
  0,
  0,
  VAR[, 1] * times,
  VAR[, 2] * times,
  length = 0.1,
  # col = Tran("blue", 90),
  lwd = 2
)
text(VAR * times * 1.2, colnames(temp), cex = 1.5, col = "red")

