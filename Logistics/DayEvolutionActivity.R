####################################################################################
# Number of items recorded for each of the HOUR_OF_THE_DAY within the 
####################################################################################
library(ggplot2)

#Load file
# HOUR_OF_THE_DAY,NUM,ACTIVITY
datasetDayEvolutionActivity<-read.delim("./data/DayEvolutionActivity.csv", header = TRUE, sep=",")

#Show data set
datasetDayEvolutionActivity
datasetDayEvolutionActivity$ACTIVITY
datasetDayEvolutionActivity$NUM
datasetDayEvolutionActivity$HOUR_OF_THE_DAY

# No need to sort vectors alphabetically
datasetDayEvolutionActivity$HOUR_OF_THE_DAY <- factor(datasetDayEvolutionActivity$HOUR_OF_THE_DAY, levels = datasetDayEvolutionActivity$HOUR_OF_THE_DAY)


#
# All lines in one xy chart
# Black and white
#
ggplot(datasetDayEvolutionActivity, aes(HOUR_OF_THE_DAY, NUM)) + 
  geom_line(aes(colour = ACTIVITY, group = ACTIVITY), size=2) + 
  scale_colour_grey(start = 0, end = .9) +
  theme_bw() +
  ylab(label="Num. items") + 
  xlab("HOUR_OF_THE_DAY")


#
# Coloured
#
ggplot(datasetDayEvolutionActivity, aes(HOUR_OF_THE_DAY, NUM)) + 
  geom_line(aes(colour = ACTIVITY, group = ACTIVITY), size=2) + 
  scale_x_continuous(breaks = round(seq(min(datasetDayEvolutionActivity$HOUR_OF_THE_DAY), max(datasetDayEvolutionActivity$HOUR_OF_THE_DAY)),1))+
  geom_point() +
  ylab(label="Num. items") + 
  xlab("Time of the day")










