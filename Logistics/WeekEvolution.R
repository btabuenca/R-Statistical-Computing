####################################################################################
# Number of items recorded for each of the MMDDHH
####################################################################################
library(ggplot2)

#Load file
# NUMITEMS,TYPEITEMS,MMDDHH
datasetWeekEvolution<-read.delim("./data/WeekEvolution.csv", header = TRUE, sep=",")
##datasetWeekEvolution<-read.delim("./data/HourEvolutionNulls.csv", header = TRUE, sep=",")

#Show data set
datasetWeekEvolution
datasetWeekEvolution$TYPEITEMS
datasetWeekEvolution$NUMITEMS
datasetWeekEvolution$MMDDHH


#
# Coloured
#
ggplot(datasetWeekEvolution, aes(MMDDHH, NUMITEMS)) + 
  geom_line(aes(colour = TYPEITEMS, group = TYPEITEMS), size=1) + 
  scale_x_continuous(breaks = round(seq(min(datasetWeekEvolution$MMDDHH), max(datasetWeekEvolution$MMDDHH)),1))+
  geom_point() +
  ylab(label="Num. items") + 
  xlab("Time in the week")










