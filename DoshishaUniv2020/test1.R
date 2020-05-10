help(package = "DoshishaUniv2020")
remove.packages("DoshishaUniv2020")

library(devtools)

install_github("https://github.com/luka3117/JcPackage.git", subdir = "DoshishaUniv2020")

DoshishaUniv2020::galton %>% tbl_df()




help(mtcars)

mtcars %>% help()

DT::datatable(galton) %>% knitr::kable()
