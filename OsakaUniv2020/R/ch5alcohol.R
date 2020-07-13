present = c(48, 38, 5, 1, 1)
absent = c(17066, 14464, 788, 126, 37)
alcohol <- data.frame(
  A = factor(
    c("0", "<1", "1-2", "3-5", ">=6"),
    levels = c("0", "<1", "1-2", "3-5", ">=6")
  ),
  present = c(48, 38, 5, 1, 1),
  absent = c(17066, 14464, 788, 126, 37),
  n = present + absent
)




alcohol$consumption <- c(0, 0.5, 1.5, 4, 7)
alcohol$dummy <- factor(1:5) # for saturated model
