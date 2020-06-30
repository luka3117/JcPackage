suppressMessages(library(tidyverse))


# kdlsjfds ----------------------------------------------------------------


aa<-Lahman::Master%>% filter(birthYear>1960) %>% filter(birthCountry=="Japan")

aa %>% select(contains("name"))


Lahman::Master %>% colnames()
