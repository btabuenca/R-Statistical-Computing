####################################################################################
# Evolution of truck stress along the day
####################################################################################
library(ggplot2)
#Load file
# REGISTROS.HOUR_OF_THE_DAY
datasetEvening<-read.delim("./data/DayEvolution.csv", header = TRUE, sep=",")

#Show data set
datasetEvening
datasetEvening$HOUR_OF_THE_DAY
datasetEvening$REGISTROS

a <- qplot(x = HOUR_OF_THE_DAY, y = REGISTROS, data = datasetEvening, main = "Truck records along the day") 
b <- a + stat_smooth(size=2) 
c <- b + scale_x_continuous(breaks = round(seq(min(datasetEvening$HOUR_OF_THE_DAY), max(datasetEvening$HOUR_OF_THE_DAY)),1))
d <- c + geom_line(size=1)
d
