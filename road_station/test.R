remove.packages("RoadStation")

# install.packages("RoadStation_0.1.0.tar.gz", repos = NULL)
devtools::install_local("/Users/jclee/road_station")
# devtools::install_github("luka3117/road_station")

library(RoadStation)

RoadStation::

help(Michi_Eki_data)
help(Michi_Eki_data)



道の駅購入商品
道の駅 %>% select(野菜:なし) %>%
  select(-菓子類, -その他) %>%
  tbl_df()




道の駅[c("野菜", "果実", "漬物", "花木", "米", "魚及び加工品", "畜産品", "卵", "牛乳及び加工品", "きのこ", "山菜", "なし")] %>% tbl_df()


道の駅 %>% select(野菜:なし) %>% colnames() %>% cat()
  select(-菓子類, -その他) %>%
  tbl_df()

# 使用package
suppressMessages(library(readxl))
suppressMessages(library(dplyr))
suppressMessages(library(tidyverse))
suppressMessages(library(data.table))
library(curl)

help(道の駅)

RoadStation::道の駅

RoadStation
