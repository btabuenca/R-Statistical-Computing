####################################################################################
## Internal consistency. NO APLICA PORQUE NO ES UNA ESCALA EN LA QUE HAY DIFERENTES 
# MEDICIONES DE LA MISMA COSA. Aqui buscamos contrastar
####################################################################################
# Cronbach´s Alpha

# Load library

# This is performed only once
# install.packages("psych",dependencies=TRUE)
library("psych")

datasetConsist<-read.delim("./data/datasetcorrelation.csv", header = TRUE, sep=";")
str(datasetConsist)
datasetConsist

# Split values of subscales
riesgos<-datasetConsist[, c(4, 5, 6, 7, 8, 9)]
datasetConsist$R1
datasetConsist[, c(4)]
describe(riesgos)

ventajas<-datasetConsist[, c(11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21)]
describe(ventajas)


# Subscales alpha
alpha(riesgos)
alpha(ventajas)


# Overall alpha
alpha(datasetConsist)


####################################################################################
# Normal distribution. Shapiro Wilk
#####################################################################################
library(ggplot2)
# If the test is non-significant (p > .05) it tells us that the distribution of the sample is not significantly different from a normal distribution. 
# If, however, the test is significant (p < .05) then the distribution in question is significantly different from a normal distribution (i.e., it is non-normal). 
# See page 182 stats book
#Load file
# grupo;tag;tratamiento;nom;nps;npt;NOISE;lps;lpt;PERFORMANCE
datasetShap<-read.delim("./csv/shapiro.csv", header = TRUE, sep=";")

#Show data set
datasetShap
datasetShap$tratamiento
datasetShap$nom
datasetShap$nps
datasetShap$npt
datasetShap$NOISE
datasetShap$lps
datasetShap$lpt
datasetShap$PERFORMANCE

## Individual shapiros
# noise
shapiro.test(datasetShap$nom)
shapiro.test(datasetShap$nps)
shapiro.test(datasetShap$npt)

qplot(sample = datasetShap$nom, stat="qq")

# performance
shapiro.test(datasetShap$lps)
shapiro.test(datasetShap$lpt)

## Mean shapiros
shapiro.test(datasetShap$NOISE)
qplot(sample = datasetShap$NOISE, stat="qq")

shapiro.test(datasetShap$PERFORMANCE)
qplot(sample = datasetShap$PERFORMANCE, stat="qq")