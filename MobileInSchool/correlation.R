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



windows() 
pairs(datasetCorrelatavg)
dev.off() 

cor(datasetCorrelatavg, use="complete.obs", method="pearson") 

# Correlation edprofe MVE
plot(edprofe ~ MVE, data = datasetCorrelatavg, ylab = "edprofe", xlab = "MVE") 
abline(lm(edprofe ~ MVE, data = datasetCorrelatavg), col = "red", lw=2)

# Correlation edprofe RS
plot(edprofe ~ RS, data = datasetCorrelatavg, ylab = "edprofe", xlab = "RS") 
abline(lm(edprofe ~ RS, data = datasetCorrelatavg), col = "red", lw=2)




# --------------------------------------------------

plot(students_aprendido ~ students_noise, data = datasetCorrelat, ylab = "Students perceived learning performance", xlab = "Students perceived noise") 
abline(lm(students_aprendido ~ students_noise, data = datasetCorrelat), col = "red", lw=2)

# Strong correlation NOM NSP
plot(objective_noise ~ students_noise, data = datasetCorrelat, ylab = "Objective noise measure", xlab = "Students perceived noise") 
abline(lm(objective_noise ~ students_noise, data = datasetCorrelat), col = "red", lw=2)

# Strong correlation PTP NTP
plot(teacher_aprendido ~ teacher_noise, data = datasetCorrelat, ylab = "Teachers perception of students performance", xlab = "Teachers perceived noise") 
abline(lm(teacher_aprendido ~ teacher_noise, data = datasetCorrelat), col = "red", lw=2)




sess_cor <- cor(datasetCorrelat)
# Rounding decimals
sess_cor <- round(cor(datasetCorrelat),2)
sess_cor
write.table(sess_cor, "./csv/session_correlation.csv", sep=",")

# diasemana numsesion   edad numestudiantes percchicas percchicos objective_noise teacher_noise students_noise teacher_aprendido students_aprendido

# Strong correlation
cor.test(datasetCorrelat$students_noise, datasetCorrelat$objective_noise)
cor.test(datasetCorrelat$teacher_noise, datasetCorrelat$teacher_aprendido)
cor.test(datasetCorrelat$students_noise, datasetCorrelat$students_aprendido)

# Moderate correlation
cor.test(datasetCorrelat$students_noise, datasetCorrelat$teacher_noise)
cor.test(datasetCorrelat$teacher_aprendido, datasetCorrelat$students_noise)
cor.test(datasetCorrelat$percchicos, datasetCorrelat$objective_noise)

cor.test(datasetCorrelat$students_aprendido, datasetCorrelat$numestudiantes)
cor.test(datasetCorrelat$students_aprendido, datasetCorrelat$objective_noise)
