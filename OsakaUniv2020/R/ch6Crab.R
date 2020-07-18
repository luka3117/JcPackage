crab.chap6 <- read.table("crab2.txt", header = T)
# ch.chap6anging the factor order to get the same result in our textbook

crab.chap6$y <-
  ifelse(crab.chap6$satell > 0, 1, 0) # change number of satellites into binary response　y
crab.chap6$color <-
  factor(crab.chap6$color, levels = c(4, 1, 2, 3))  # change color into factor type
crab.chap6$spine <-
  factor(crab.chap6$spine, levels = c(3, 1, 2))  # change spine into factor type

# crab.chap6 %>% str()
# crab.chap6 %>% glimpse()


