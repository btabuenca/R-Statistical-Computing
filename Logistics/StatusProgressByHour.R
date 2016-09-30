####################################################################################
# Number of items recorded. Contast between two days along a week by hour
####################################################################################
library(ggplot2)

#Load file
# SEM,NUM,STATUS
datasetStatus<-read.delim("./data/StatusProgressByHourW30.csv", header = TRUE, sep=",")
datasetStatus<-read.delim("./data/StatusProgressByHourW31.csv", header = TRUE, sep=",")
datasetStatus<-read.delim("./data/StatusProgressByHourW32.csv", header = TRUE, sep=",")
datasetStatus<-read.delim("./data/StatusProgressByHourW33.csv", header = TRUE, sep=",")
datasetStatus<-read.delim("./data/StatusProgressByHourW34.csv", header = TRUE, sep=",")
datasetStatus<-read.delim("./data/StatusProgressByHourW35.csv", header = TRUE, sep=",")
datasetStatus<-read.delim("./data/StatusProgressByHourW36.csv", header = TRUE, sep=",")
datasetStatus<-read.delim("./data/StatusProgressByHourW37.csv", header = TRUE, sep=",")

#Show data set
datasetStatus
datasetStatus$SEM_DIA_HORA
datasetStatus$NUM
datasetStatus$STATUS

# No need to sort vectors alphabetically
datasetStatus$STATUS <- factor(datasetStatus$STATUS, levels = datasetStatus$STATUS)


#
# All lines in one xy chart
# StatusProgressAllIn1.png
#
ggplot(datasetStatus, aes(SEM_DIA_HORA, NUM)) + 
  geom_line(aes(colour = STATUS, group = STATUS), size=1) + 
  ylab(label="Num. items") + 
  xlab("Status") + 
  theme(axis.text.x = element_text(angle = 90, hjust = 1))


