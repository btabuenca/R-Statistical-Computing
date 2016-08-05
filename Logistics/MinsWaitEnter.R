####################################################################################
# Minutes waiting from registrado to autorizado entrada
####################################################################################
library(ggplot2)
#Load file
# MINS_WAITING;PERCENTAGE
datasetMinsWait<-read.delim("./data/MinsWaitEnterPercentages.csv", header = TRUE, sep=";")

#Show data set
datasetMinsWait
datasetMinsWait$MINS_WAITING
datasetMinsWait$PERCENTAGE

# Add title, narrower bars, fill color, and change axis labels
ggplot(data=datasetMinsWait, aes(x=factor(MINS_WAITING, levels=unique(MINS_WAITING)), y=PERCENTAGE, fill=MINS_WAITING)) + 
  geom_bar(colour="black", fill="#009DE0", width=.8, stat="identity") + 
  guides(fill=FALSE) +
  xlab("Tiempo de espera") + ylab("% Registros") +
  ggtitle("Tiempo de espera entre el registro y autorización de entrada")+ 
  theme(axis.text.x = element_text(angle = 90, hjust = 1)) + 
  geom_vline(xintercept=1, colour="grey", linetype="dashed", size=1) + annotate("text", label = "Primera hora de espera", x = 6, y = 40) + 
  geom_vline(xintercept=14, colour="grey", linetype="dashed", size=1) + annotate("text", label = "En franjas de 1 hora", x = 18, y = 40) +
  geom_text(aes(label = PERCENTAGE), size = 2.5)
