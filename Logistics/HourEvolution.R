####################################################################################
# Number of items recorded for each of the MMDDHH
####################################################################################
library(ggplot2)

#Load file
# NUMITEMS,TYPEITEMS,MMDDHH
datasetHourEvolution<-read.delim("./data/HourEvolutionDay20160719.csv", header = TRUE, sep=",")
datasetHourEvolution<-read.delim("./data/HourEvolutionDay.csv", header = TRUE, sep=",")
datasetHourEvolution<-read.delim("./data/HourEvolutionNulls.csv", header = TRUE, sep=",")

#Show data set
datasetHourEvolution
datasetHourEvolution$TYPEITEMS
datasetHourEvolution$NUMITEMS
datasetHourEvolution$MMDDHH


#
# Coloured
#
ggplot(datasetHourEvolution, aes(MMDDHH, NUMITEMS)) + 
  geom_line(aes(colour = TYPEITEMS, group = TYPEITEMS), size=1) + 
  scale_x_continuous(breaks = round(seq(min(datasetHourEvolution$MMDDHH), max(datasetHourEvolution$MMDDHH)),1))+
  geom_point() +
  ylab(label="Num. items") + 
  xlab("Time of the day")










