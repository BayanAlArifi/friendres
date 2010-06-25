# TODO: Add comment
# 
# Author: bogdan
###############################################################################

library(lattice)

setwd("~/workspaces/segregation")
tbl <- read.csv("testrun_1-table.csv")
tbl <- tbl[order(step),]
tbl[1:5,1:5]
attach(tbl)

find.max.step <- function(run){
	table <- subset(tbl, run_no==run)
	result <- table[dim(table)[1],]
    return(result)}

collapsed <- subset(tbl, 1==0)

for (i in (1:max(run_no))){
	collapsed <- rbind(collapsed, find.max.step(i))
}
detach(tbl)
attach(collapsed)

plot(percent.similar,friends.attitudes.makeup)
plot(percent.unhappy,friends.attitudes.makeup)
plot(step,friends.attitudes.makeup)
cloud(percent.similar~friends.attitudes.makeup*personal.vs.friends,aspect=c(1,1), pretty=TRUE)

plot(percent.unhappy,personal.vs.friends)
plot(percent.similar,personal.vs.friends)
plot(step,personal.vs.friends)