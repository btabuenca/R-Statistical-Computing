####################################################################################
# Number of items recorded for each of the status within the 
####################################################################################
library(ggplot2)

#Load file
# SEM,NUM,STATUS
#datasetStatus<-read.delim("./data/StatusProgress_.csv", header = TRUE, sep=",")
datasetStatus<-read.delim("./data/StatusProgress.csv", header = TRUE, sep=",")

#Show data set
datasetStatus
datasetStatus$SEM
datasetStatus$NUM
datasetStatus$STATUS

# No need to sort vectors alphabetically
datasetStatus$STATUS <- factor(datasetStatus$STATUS, levels = datasetStatus$STATUS)


#
# All lines in one xy chart
# StatusProgressAllIn1.png
#
ggplot(datasetStatus, aes(STATUS, NUM)) + 
  geom_line(aes(colour = SEM, group = SEM), size=2) + 
  ylab(label="Num. items") + 
  xlab("Status")


#
# Lines in independent xy chart
# StatusProgressClustered.png
#
ggplot(datasetStatus) +
  geom_line(aes(x=STATUS,y=NUM,group=SEM,colour = SEM), size=2) +
  facet_grid(.~SEM,scales="free")


