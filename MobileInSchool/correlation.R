####################################
## Correlation analyis by session
####################################
library(ggplot2)

# EP.EA.EM.R1.R2.R3.R4.R5.R6.RE.V1.V2.V3.V4.V5.V6.V7.V8.V9.V10.V11
datasetCorrelat<-read.delim("./data/datasetcorrelation.csv", header = TRUE, sep=";")
datasetCorrelat$EP


windows() 
pairs(datasetCorrelat)
dev.off() 

cor(datasetCorrelat, use="complete.obs", method="pearson") 

## Lo partimos

datasetedades<-datasetCorrelat[, c(1,2,3)]
datasetedades

windows()
pairs(datasetedades)
dev.off() 


cor(datasetedades, use="complete.obs", method="pearson") 


# Correlation EP EM
plot(EP ~ EM, data = datasetedades, ylab = "EP", xlab = "EM") 
abline(lm(EP ~ EM, data = datasetedades), col = "red", lw=2)


# Correlation EP R1-R6
# Correlation EP RE
# Correlation EP V1-V11

# Correlation EA EM
plot(EA ~ EM, data = datasetedades, ylab = "EA", xlab = "EM") 
abline(lm(EA ~ EM, data = datasetedades), col = "red", lw=2)

# Correlation EA R1-R6
# Correlation EA RE
# Correlation EA V1-V11

# ---------------- No ha habido correlacion. Calculamos las medias de riesgos y ventajas
# edprofe;edalum;edmov;RS;MRI;MVE
datasetCorrelatavg<-read.delim("./data/datasetcorrelationavg.csv", header = TRUE, sep=";")
datasetCorrelatavg


windows() 
pairs(datasetCorrelatavg)
dev.off() 

# Obtain r values matrix
cor(datasetCorrelatavg, use="complete.obs", method="pearson") 

## Obtain p values couples
# - Edad del profe
cor.test(datasetCorrelatavg$edprofe,datasetCorrelatavg$MVE)$p.value
#=>0.011
cor.test(datasetCorrelatavg$edprofe,datasetCorrelatavg$MRI)$p.value
#=>0.25
cor.test(datasetCorrelatavg$edprofe,datasetCorrelatavg$RS)$p.value
#=>0.46

# - RS - MVE
cor.test(datasetCorrelatavg$RS,datasetCorrelatavg$MVE)$p.value
#=>0.0024


# Correlation edprofe MVE. Correlacion débil
plot(edprofe ~ MVE, data = datasetCorrelatavg, ylab = "Edad profesor", xlab = "Ventajas uso móvil en aula") 
abline(lm(edprofe ~ MVE, data = datasetCorrelatavg), col = "red", lw=2)

# Correlation edprofe RS. No correlacion
plot(edprofe ~ RS, data = datasetCorrelatavg, ylab = "Edad profesor", xlab = "Redes sociales") 
abline(lm(edprofe ~ RS, data = datasetCorrelatavg), col = "red", lw=2)

# Correlation RS MVE. Correlación débil
plot(RS ~ MVE, data = datasetCorrelatavg, ylab = "Predisposición uso redes sociales", xlab = "Ventajas uso móvil en aula") 
abline(lm(RS ~ MVE, data = datasetCorrelatavg), col = "blue", lw=2)


