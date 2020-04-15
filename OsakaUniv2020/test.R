remove.packages("OsakaUniv2020")
install.packages("OsakaUniv2020")

help(package = "OsakaUniv2020")
help("count.to.case")


titanic <- as.data.frame(Titanic)
titanic
count.to.case(titanic, "Freq") %>% str()




