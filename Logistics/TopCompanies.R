####################################################################################
# Companies with more records. Barchart
####################################################################################
library(ggplot2)
#Load file
# MINS_WAITING;PERCENTAGE
datasetTopcompanies<-read.delim("./data/TopCompanies.csv", header = TRUE, sep=",")

#Show data set
datasetTopcompanies
datasetTopcompanies$NUMREGISTROS
datasetTopcompanies$EMPRESA

# Add title, narrower bars, fill color, and change axis labels
ggplot(data=datasetTopcompanies, aes(x=factor(EMPRESA, levels=unique(EMPRESA)), y=NUMREGISTROS, fill=EMPRESA)) + 
  geom_bar(colour="black", fill="#009DE0", width=.8, stat="identity") +
  theme(axis.text.x = element_text(angle = 90, hjust = 1)) + 
  xlab("Empresa") + ylab("Num. Registros") +
  ggtitle("Ranking de empresas por número de registros")




