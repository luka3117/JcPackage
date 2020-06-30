# pca func -----------------------------------------------------------------

JcPCA <- function(m) {
  m <- as.matrix(m)
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
