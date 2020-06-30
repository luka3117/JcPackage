system("open .")


aa<-zemi::JcPCA(zemi::m.dz)



aa<-zemi::m.dz %>% scale() %>% zemi::JcPCA()
obs<-aa$OBS[,1:2]
var<-aa$VAR[,1:2]


plot(obs[,1], obs[,2], type = "n")
text(obs[,1], obs[,2], labels = zemi::Pref, col = zemi::Tran(ColorNmae = "black", alpha = 60))

# for (i in 1:dim(zemi::m.dz)[2]) {
# text(var[i,1], var[i,2], col = zemi::Tran("blue", 90), labels = colnames(m.dz)[i],
#      srt=aa$angle[i]
#      )
# }

for (i in 1:dim(zemi::m.dz)[2]) {
text(var[i,1], var[i,2], col = zemi::Tran("blue", 100), labels = colnames(m.dz)[i]
     )
}

aa$angle










par(family= "HiraKakuProN-W3")
plot(OBS[,1], OBS[,2], type="n", xlab="PC1(74%)", ylab="PC2(10%)", main="男性6大疾患PCA")
plot(OBS[,1], OBS[,2],  xlab="PC1(74%)", ylab="PC2(10%)", main="男性6大疾患PCA")
#text(OBS[,1], OBS[,2], pref.names$pref.A)
text(OBS[,1], OBS[,2], pref.name)
times<-3
arrows(0, 0, VAR[,1]*times, VAR[,2]*times, length=0.1, col=zemi::Tran("blue", 90))
for(i in 1:6)
  text(VAR[i,1]*times*, VAR[i,2]*times*0.7, rownames(VAR)[i], col=Tran("red", 90), cex=1, srt=angle[i])
i=1

text(VAR[i,1]*times*, VAR[i,2]*times*0.7, rownames(VAR)[i], col=Tran("red", 90), cex=1, srt=angle[i])

