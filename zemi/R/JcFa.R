
JcFA <- function(X) {
  # created by jc lee
  # ex : fa(zemi::USCrime )
  # X <- zemi::USCrime
  ## --------------------------------------------------------------
  # suppressMessages(library(dplyr))
  # 1st argument X is dataframe

  # X %>% DT::datatable()
  # rownames(X) <- abbreviate(rownames(X))

  ## ---- warning=F------------------------------------------------
  # n : number of data
  # p : number of variables
  # Z : scaled data
  n <- nrow(X)
  p <- ncol(X)
  Z <- scale(X)



  ## --------------------------------------------------------------
  # FA start
  # OBS : observation score
  # VAR : varibale score

  svd.Z <- svd(Z/sqrt(n-1))
  OBS <- svd.Z$u*sqrt(n-1)
  # OBS %>% round(2) %>% as.data.frame() %>% tbl_df()

  VAR <- svd.Z$v%*%diag(svd.Z$d)
  # VAR %>% round(2)

  # rownames(OBS) <- rownames(X)
  # rownames(VAR) <- colnames(X)


  ## --------------------------------------------------------------
  # OBS %>% as.data.frame() %>% tbl_df()


  ## --------------------------------------------------------------
  # round(OBS,3) %>% head()


  ## --------------------------------------------------------------
  # round(VAR,3)
  # round(svd.Z$d^2,3)
  #

  ## --------------------------------------------------------------
  # biplot(OBS,VAR,cex=0.75,xlab="First Dimension",ylab="Second Dimension",xlim=c(-3,3),ylim=c(-3,3),main="Not Rotated")


  ## --------------------------------------------------------------

  rotate <- function(VAR, theta)
  {
    G <- matrix(c(cos(theta), -sin(theta), sin(theta), cos(theta)), nrow = 2)
    VAR.rotate <- VAR[, 1:2] %*% G
    return(VAR.rotate)
  }
  object.max <- function(theta)
  {
    D <- rotate(VAR[, 1:2], theta)
    D2 <- D * D
    norm <- apply(D2, 1, sum)
    temp <- scale(D2 / norm, scale = F)
    return(sum(temp * temp))
  }


  ## --------------------------------------------------------------
  theta.optim <- optimize(object.max, c(-pi,pi), maximum=T)
  theta <- theta.optim$maximum
  VAR.rotate <- rotate(VAR[,1:2],theta)
  OBS.rotate <- rotate(OBS[,1:2],theta)
  # c("optimum rotation in degrees"); round(theta*180/pi,1)
  # c("rotated loading matrix"); round(VAR.rotate,3)
  # c("rotated factor scores");
  # round(OBS.rotate,3) %>% head()


  res<-list(d=svd.Z$d, Z=Z,OBS=OBS,VAR=VAR,VAR.rotate=VAR.rotate,OBS.rotate=OBS.rotate)


  return(res)
}
