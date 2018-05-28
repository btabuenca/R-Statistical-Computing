###################################################################################
## Reliability analysis
# - https://rpubs.com/hauselin/reliabilityanalysis
####################################################################################
# Cronbach´s Alpha

# Load library
library("psych", lib.loc="~/Library/R/2.15/library")

preQDataset<-read.delim("./data/resultset.csv", header = TRUE, sep=";")
str(preQDataset)
preQDataset

# Select variables presQ
# potencialmooc

# valorainteligencia  valoraentusiasmo	valorainiciativas	valoradifusion	valoraconectar

noise<-preQDataset[, c(3, 4, 5)]
performance<-preQDataset[, c(6, 7)]
noiseAndPerformance<-preQDataset[, c(3, 4, 5, 6, 7)]

# Show data structures
str(noise)
str(performance)
noise
performance

# Subscales alpha
alpha(noise)
alpha(performance)
alpha(noiseAndPerformance)

# Overall alpha
alpha(preQDataset)
