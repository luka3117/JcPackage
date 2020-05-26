count.to.case <- function(df, count.variabe) {
  temp <- lapply(df, rep, df[[count.variabe]])
  temp <- as.data.frame(temp)
  temp[-which(colnames(temp) == count.variabe)]
}

# count.to.case(df = df.count,  count.variabe = "Freq")

OR <- function(table) {
  table<-table+1/2
  (table[1,1]*table[2,2])/(table[1,2]*table[2,1])
}
# OR(df = table or matrix 2 by 2)



# Myocardinal.Infarction ----------------------------------------------------------------

Myocardinal.Infarction <-
  matrix(c(18, 5, 171, 99, 10845, 10933), ncol = 3)

colnames(Myocardinal.Infarction) <-
  c("FatalAttack", "NonfatalAttack", "NoAttack")

rownames(Myocardinal.Infarction) <- c("Placebo", "Asprin")
Myocardinal.Infarction <- as.table(Myocardinal.Infarction)


# death penalty -----------------------------------------------------------

death.penalty <- c("yes", "no")
def.race <- c("white", "black")
vic.race <- c("white", "black")
datalabel <-
  list(victim = vic.race,
       defendant = def.race,
       death = death.penalty)
table.2.6 <-
  expand.grid(death = death.penalty,
              defendant = def.race,
              victim = vic.race)
data <- c(53, 414, 11, 37, 0, 16, 4, 139)
(death.penalty.table.2.6 <- cbind(table.2.6, count = data)) # id by variable type data

death.penalty.df <-
  count.to.case(death.penalty.table.2.6, count.variabe = "count")


# job Satisfaction ----------------------------------------------------------------------
Satisfaction <-
  as.table(array(c(1, 2, 0, 0, 3, 3, 1, 2,
                   11, 17, 8, 4, 2, 3, 5, 2,
                   1, 0, 0, 0, 1, 3, 0, 1,
                   2, 5, 7, 9, 1, 1, 3, 6),
                 dim = c(4, 4, 2),
                 dimnames =
                   list(Income =
                          c("<5000", "5000-15000",
                            "15000-25000", ">25000"),
                        "Job Satisfaction" =
                          c("V_D", "L_S", "M_S", "V_S"),
                        Gender = c("Female", "Male"))))

# crab data ---------------------------------------------------------------

# crab<-read.table("crab.txt", col.names=c("C","S","W","Sa","Wt"), header=T)

crab <- read.table("crab.txt", header = T)
crab <- crab[c("satell", "color", "spine", "width" ,  "weight")]

