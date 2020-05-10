devtools::install_local("/Users/jclee/Dropbox/00000講義/同志社大学/DS Doshisha 2020 pkg/DD2020spring"
                        ,force = T)


system("open .")
devtools::install_github("luka3117/DD2020spring")

help(package = "DD2020spring")

# galton table
table(galton$parent, galton$child)


