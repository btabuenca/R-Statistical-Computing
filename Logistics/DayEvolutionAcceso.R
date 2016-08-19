####################################################################################
# Number of items recorded for each of the HOUR_OF_THE_DAY within the 
####################################################################################
library(ggplot2)

#Load file
# HOUR_OF_THE_DAY,NUM,ACCESO
datasetDayEvolutionAcceso<-read.delim("./data/DayEvolutionAcceso.csv", header = TRUE, sep=",")

#Show data set
datasetDayEvolutionAcceso
datasetDayEvolutionAcceso$ACCESO
datasetDayEvolutionAcceso$NUM
datasetDayEvolutionAcceso$HOUR_OF_THE_DAY

# No need to sort vectors alphabetically
datasetDayEvolutionAcceso$HOUR_OF_THE_DAY <- factor(datasetDayEvolutionAcceso$HOUR_OF_THE_DAY, levels = datasetDayEvolutionAcceso$HOUR_OF_THE_DAY)


#
# All lines in one xy chart
# Black and white
#
ggplot(datasetDayEvolutionAcceso, aes(HOUR_OF_THE_DAY, NUM)) + 
  geom_line(aes(colour = ACCESO, group = ACCESO), size=2) + 
  scale_colour_grey(start = 0, end = .9) +
  theme_bw() +
  ylab(label="Num. items") + 
  xlab("HOUR_OF_THE_DAY")


#
# Coloured
#
ggplot(datasetDayEvolutionAcceso, aes(HOUR_OF_THE_DAY, NUM)) + 
  geom_line(aes(colour = ACCESO, group = ACCESO), size=2) + 
  scale_x_continuous(breaks = round(seq(min(datasetDayEvolutionAcceso$HOUR_OF_THE_DAY), max(datasetDayEvolutionAcceso$HOUR_OF_THE_DAY)),1))+
  geom_point() +
  ylab(label="Num. items") + 
  xlab("Time of the day")










