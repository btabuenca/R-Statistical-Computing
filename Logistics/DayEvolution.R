####################################################################################
# Evolution of truck stress along the day
####################################################################################
library(ggplot2)
#Load file
# REGISTROS.HOUR_OF_THE_DAY
datasetEvening<-read.delim("./data/DayEvolution.csv", header = TRUE, sep=",")

# Show data set
datasetEvening
datasetEvening$HOUR_OF_THE_DAY
datasetEvening$REGISTROS

#
# DayEvolution.png
#
a <- qplot(x = HOUR_OF_THE_DAY, y = REGISTROS, data = datasetEvening, main = "Truck records along the day") 
b <- a + stat_smooth(size=2) 
c <- b + scale_x_continuous(breaks = round(seq(min(datasetEvening$HOUR_OF_THE_DAY), max(datasetEvening$HOUR_OF_THE_DAY)),1))
d <- c + geom_line(size=1)
d

#
# Smoother chart
# DayEvolutionSmooth.png
#
ggplot(datasetEvening, aes(x = HOUR_OF_THE_DAY, y = REGISTROS, group = 1)) +
  stat_smooth(aes(x = seq(length(unique(HOUR_OF_THE_DAY)))), se = F, method = "lm", formula = y ~ poly(x, 8)) +
  scale_x_continuous(breaks = seq(length(unique(datasetEvening$HOUR_OF_THE_DAY))),labels = levels(datasetEvening$HOUR_OF_THE_DAY))



