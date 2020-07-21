# 使用package
suppressMessages(library(tidyverse))

#------------------------------------------------------------------------------------------
# Convert from data frame of counts to data frame of cases.
# `countcol` is the name of the column containing the counts
countsToCases <- function(x, countcol = "Freq") {
  # Get the row indices to pull from x
  idx <- rep.int(seq_len(nrow(x)), x[[countcol]])

  # Drop count column
  x[[countcol]] <- NULL

  # Get the rows from x
  x[idx, ]
}

# ex -------------------------------------------------------------------
df.count<-Titanic %>% as.data.frame()
df<-countsToCases(df.count)

df.count  %>% tbl_df()
df  %>% tbl_df()

table(df)

ftable(table(df))

xtabs(~Class+Survived, data = df )

table(df$Survived, df$Class) %>% prop.table(2) %>% round(2)

# ex2 -------------------------------------------------------------------
# tt<-aa %>% mutate(Freq = round(Freq / 100, 0)) %>%
#   filter(Freq!=0)

# count.to.case <- function(df, count.variabe) {
#   temp <- lapply(df, rep, df[[count.variabe]])
#   temp <- as.data.frame(temp)
#   temp[-which(colnames(temp) == count.variabe)]
# }
#
# count.to.case(df = df.count, count.variabe = "Freq")
