####################################################################################
# Mean minutes waiting
####################################################################################
library(ggplot2)

#Load file
# IDREGISTRO;MINS_WAIT;DESCRIPCIONTIPOVEHICULO
datasetMinsWait<-read.delim("./data/MinsWaitEnterMeanByActivity.csv", header = TRUE, sep=",")

#Show data set
datasetMinsWait
datasetMinsWait$IDREGISTRO
datasetMinsWait$MINS_WAIT
datasetMinsWait$ACTIVIDAD

#
# Boxplot
#
p <- ggplot(datasetMinsWait, aes(factor(ACTIVIDAD), MINS_WAIT))
p + geom_boxplot() +  coord_flip() + geom_boxplot(aes(fill = ACTIVIDAD))


#
# Mean, max, sd...
#
install.packages("doBy")
library(doBy)
summaryBy(MINS_WAIT ~ ACTIVIDAD, data = datasetMinsWait,  FUN = list(mean, max, min, median, sd))

summaryBy(MINS_WAIT ~ ACTIVIDAD, data = datasetMinsWait,  FUN = list(mean, median, sd))




