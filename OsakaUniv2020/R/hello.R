count.to.case <- function(df, count.variabe) {
  temp <- lapply(df, rep, df[[count.variabe]])
  temp <- as.data.frame(temp)
  temp[-which(colnames(temp) == count.variabe)]
}

# count.to.case(df = df.count, count.variabe = "Freq")


