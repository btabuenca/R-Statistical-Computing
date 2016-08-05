##################################################################
# Load library
##################################################################
library("psych", lib.loc="~/Library/R/2.15/library")
library("ggplot2", lib.loc="~/Library/R/2.15/library")



##################################################################
# Boxpots
##################################################################
# Objective noise
#timestamp, decibels, tag 
datasetNoise<-read.delim("./csv/allsamples.csv", header = TRUE, sep=",")
datasetNoise

library(ggplot2)
ggplot(datasetNoise, aes(x=tag, y=decibels, fill=tag)) + geom_boxplot() + guides(fill=FALSE) + coord_flip()

# Con leyenda y en colores
ggplot(datasetNoise, aes(x=tag, y=decibels, fill=tag)) + geom_boxplot()

# Ranking de grupos
ggplot(datasetNoise, aes(x=grupo, y=decibels)) + geom_boxplot() 

# Ranking de sesiones
ggplot(datasetNoise, aes(x=tag, y=decibels)) + geom_boxplot() + coord_flip()

# Ranking de sesiones grupos
ggplot(datasetNoise, aes(x=tag, y=decibels)) + geom_boxplot() + facet_grid(grupo ~ ., scales="free")


####################################
# Modificando el campo tratamiento
# timestamp, decibels, tag, diasemana, numsesion, profesor, aula, grupo, idioma, tratamiento 

datasetNoise<-read.delim("./csv/allsamples2.csv", header = TRUE, sep=",")
library(ggplot2)

# Overall means by treatment
means <- aggregate(decibels ~ round, datasetNoise, mean)
sdev <- aggregate(decibels ~ round, datasetNoise, sd)
means
sdev
ggplot(datasetNoise, aes(x=round, y=decibels)) + geom_boxplot() + stat_summary(fun.y=mean, colour="darkred", geom="point", shape=18, size=3,show_guide = FALSE) + geom_text(data = means, aes(label = decibels, y = decibels + 1)) 

ggplot(datasetNoise, aes(x=round, y=decibels)) + geom_boxplot() + stat_summary(fun.y=mean, colour="darkred", geom="point", shape=18, size=3, show_guide = FALSE) + geom_text(data = means, aes(label = decibels, y = decibels + 1)) + geom_text(data = sdev, aes(label = decibels, y = decibels + 4)) + geom_text(aes(1, 2, label="A", group=NULL),data=sdev) + geom_text(aes(2, 2, label="B", group=NULL),data=sdev) + geom_text(aes(2, decibels + 6, label="SD", group=NULL),data=sdev)

# Calcular means por seson
means <- aggregate(decibels ~ tag, datasetNoise, mean)
means
means$tag
means$decibels

 # Export to CSV file to creat a table for sqlite firefox
write.table(means, "./csv/noisemeansbysession.csv", sep=",")

# Calcular thresholds por grupo
maximo <- max(means$decibels)
minimo <- min(means$decibels)
maximo
minimo

rango <- maximo - minimo
rango

escalon <- (rango / 6)
escalon

escalon1 <- minimo
escalon2 <- minimo + (escalon)
escalon3 <- minimo + (escalon * 2)
escalon4 <- minimo + (escalon * 3)
escalon5 <- minimo + (escalon * 4)
escalon6 <- minimo + (escalon * 5)
escalon7 <- minimo + (escalon * 6)


escalon1 #00FF00
escalon2 #55FF00
escalon3 #AAFF00
escalon4 #FFFF00
escalon5 #FFAA00
escalon6 #FF5500
escalon7 #FF0000

cols <- c("esc1"="#00FF00","esc2"="#55FF00","esc3"="#AAFF00","esc4"="#FFFF00","esc5"="#FFAA00","esc6"="#FF5500","esc7"="#FF0000")


# Ranking de grupos con lineas
ggplot(datasetNoise, aes(x=grupo, y=decibels)) + geom_boxplot() + geom_hline(aes(yintercept=escalon1), colour="#BB0000", linetype="dashed", size=1) + geom_hline(aes(yintercept=escalon2), colour="#BB0000", linetype="dashed", size=1) + geom_hline(aes(yintercept=escalon3), colour="#BB0000", linetype="dashed", size=1) + geom_hline(aes(yintercept=escalon4), colour="#BB0000", linetype="dashed", size=1) + geom_hline(aes(yintercept=escalon5), colour="#BB0000", linetype="dashed", size=1) + geom_hline(aes(yintercept=escalon6), colour="#BB0000", linetype="dashed", size=1) + geom_hline(aes(yintercept=escalon7), colour="#BB0000", linetype="dashed", size=1) + geom_hline(aes(yintercept=escalon8), colour="#BB0000", linetype="dashed", size=1)


# Ranking de sesiones
ggplot(datasetNoise, aes(x=tag, y=decibels)) + geom_boxplot() + coord_flip()

# Ranking de sesiones clustered
ggplot(datasetNoise, aes(grupo, decibels)) + geom_boxplot(aes(fill = factor(tratamiento))) + coord_flip()

ggplot(datasetNoise, aes(grupo, decibels)) + geom_boxplot(aes(fill = factor(tratamiento)))

# Ranking de sesiones clustered con lineas
ggplot(datasetNoise, aes(grupo, decibels)) + geom_boxplot(aes(fill = factor(tratamiento))) + geom_hline(aes(yintercept=escalon1), colour="#BB0000", linetype="dashed", size=1) + geom_hline(aes(yintercept=escalon2), colour="#BB0000", linetype="dashed", size=1) + geom_hline(aes(yintercept=escalon3), colour="#BB0000", linetype="dashed", size=1) + geom_hline(aes(yintercept=escalon4), colour="#BB0000", linetype="dashed", size=1) + geom_hline(aes(yintercept=escalon5), colour="#BB0000", linetype="dashed", size=1) + geom_hline(aes(yintercept=escalon6), colour="#BB0000", linetype="dashed", size=1) + geom_hline(aes(yintercept=escalon7), colour="#BB0000", linetype="dashed", size=1) + geom_hline(aes(yintercept=escalon8), colour="#BB0000", linetype="dashed", size=1) 

# Ranking de sesiones clustered con lineas multicolor y anotaciones
ggplot(datasetNoise, aes(grupo, decibels)) + geom_boxplot(aes(fill = factor(tratamiento))) + geom_hline(aes(yintercept=escalon1), colour="#00FF00", linetype="dashed", size=1) + geom_hline(aes(yintercept=escalon2), colour="#55FF00", linetype="dashed", size=1) + geom_hline(aes(yintercept=escalon3), colour="#AAFF00", linetype="dashed", size=1) + geom_hline(aes(yintercept=escalon4), colour="#FFFF00", linetype="dashed", size=1) + geom_hline(aes(yintercept=escalon5), colour="#FFAA00", linetype="dashed", size=1) + geom_hline(aes(yintercept=escalon6), colour="#FF5500", linetype="dashed", size=1) + geom_hline(aes(yintercept=escalon7), colour="#FF0000", linetype="dashed", size=1) + annotate("text", label = "Very Low", x = 1.1, y = escalon1) + annotate("text", label = "Very High", x = 1.1, y = escalon7) 

# Ranking de grupos clustered con lineas multicolor y anotaciones
ggplot(datasetNoise, aes(grupo, decibels)) + geom_boxplot() + geom_hline(aes(yintercept=escalon1), colour="#00FF00", linetype="dashed", size=1) + geom_hline(aes(yintercept=escalon2), colour="#55FF00", linetype="dashed", size=1) + geom_hline(aes(yintercept=escalon3), colour="#AAFF00", linetype="dashed", size=1) + geom_hline(aes(yintercept=escalon4), colour="#FFFF00", linetype="dashed", size=1) + geom_hline(aes(yintercept=escalon5), colour="#FFAA00", linetype="dashed", size=1) + geom_hline(aes(yintercept=escalon6), colour="#FF5500", linetype="dashed", size=1) + geom_hline(aes(yintercept=escalon7), colour="#FF0000", linetype="dashed", size=1) + annotate("text", label = "Very Low", x = 1.1, y = escalon1) + annotate("text", label = "Very High", x = 1.1, y = escalon7) 




####################################
## Correlation between perceived and objective measures of noise.
####################################

# Bar chart
# Session, Type, Measure
datasetNoise<-read.delim("./csv/correlatingnoiseOneColmn.csv", header = TRUE, sep=",")
library(ggplot2)

qplot(x=Session, y=Measure, fill=Type, data=datasetNoise, geom="bar", stat="identity", position="dodge") + coord_cartesian(ylim = c(1, 7)) + theme(axis.text.x = element_text(angle = 90, hjust = 1))


####################################
## Correlation between perceived and objective measures of noise. Differences
####################################
# Bar chart
# Session, Type, Difference
datasetNoise<-read.delim("./csv/correlatingnoiseOneColmnDiffs.csv", header = TRUE, sep=",")
library(ggplot2)

qplot(x=Session, y=Difference, fill=Type, data=datasetNoise, geom="bar", stat="identity", position="dodge") + theme(axis.text.x = element_text(angle = 90, hjust = 1))



####################################
## Correlation between perceived and objective measures of noise depending on ...
####################################
# Difference, Gender, Age
datasetNoise<-read.delim("./csv/correlatingnoiseAgeGender.csv", header = TRUE, sep=",")
library(ggplot2)


####### Age 
means <- aggregate(Difference ~ Age, datasetNoise, mean)
means
means$Age
means$Difference

# Bar chart Age
qplot(x=Age, y=Difference, data=means, geom="bar", stat="identity", position="dodge", fill=factor(Age)) 

####### Gender
means <- aggregate(Difference ~ Gender, datasetNoise, mean)
means
means$Gender
means$Difference

# Bar chart Age
qplot(x=Gender, y=Difference, data=means, geom="bar", stat="identity", position="dodge", fill=factor(Gender)) 


####################################
## Correlation analyis
####################################
# objective_noise, teacher_noise, students_noise, teacher_aprendido, students_aprendido
datasetNoise<-read.delim("./csv/correlationClassrooms.csv", header = TRUE, sep=",")
datasetNoise

OJO. AQUI TENDRAS QUE HACER LAS COMPROBACIONES PARA VER SILOS DATOS SON VALIDOS Y NORMALIZADOS Y LA MADRE QUE LO PARIO
estas asunciones las tienes definidas en las slides

pairs(datasetNoise)
plot(datasetNoise$objective_noise, datasetNoise$students_noise)
plot(datasetNoise$objective_noise, datasetNoise$teacher_noise)

cor(datasetNoise)

cor.test(datasetNoise$students_noise, datasetNoise$students_aprendido)
cor.test(datasetNoise$objective_noise, datasetNoise$students_noise)

cor.test(datasetNoise$teacher_noise, datasetNoise$teacher_aprendido)
cor.test(datasetNoise$teacher_noise, datasetNoise$students_noise)
cor.test(datasetNoise$teacher_aprendido, datasetNoise$students_noise)












####################################
## Analizando un grupo en concreto
####################################
library(ggplot2)
# Lunes
datasetNoise<-read.delim("./csv/bygroups/L2.csv", header = TRUE, sep=",")
means <- aggregate(Decibels ~ Group, datasetNoise, mean)
ggplot(data=datasetNoise, aes(x=Group, y=Decibels)) + geom_boxplot() + stat_summary(fun.y=mean, colour="darkred", geom="point", shape=18, size=3,show_guide = FALSE) + geom_text(data = means, aes(label = Decibels, y = Decibels + 1)) 

datasetNoise<-read.delim("./csv/bygroups/L4.csv", header = TRUE, sep=",")
means <- aggregate(Decibels ~ Group, datasetNoise, mean)
ggplot(data=datasetNoise, aes(x=Group, y=Decibels)) + geom_boxplot() + stat_summary(fun.y=mean, colour="darkred", geom="point", shape=18, size=3,show_guide = FALSE) + geom_text(data = means, aes(label = Decibels, y = Decibels + 1)) 

datasetNoise<-read.delim("./csv/bygroups/L6.csv", header = TRUE, sep=",")
means <- aggregate(Decibels ~ Group, datasetNoise, mean)
ggplot(data=datasetNoise, aes(x=Group, y=Decibels)) + geom_boxplot() + stat_summary(fun.y=mean, colour="darkred", geom="point", shape=18, size=3,show_guide = FALSE) + geom_text(data = means, aes(label = Decibels, y = Decibels + 1)) 

# Martes
datasetNoise<-read.delim("./csv/bygroups/M5.csv", header = TRUE, sep=",")
means <- aggregate(Decibels ~ Group, datasetNoise, mean)
ggplot(data=datasetNoise, aes(x=Group, y=Decibels)) + geom_boxplot() + stat_summary(fun.y=mean, colour="darkred", geom="point", shape=18, size=3,show_guide = FALSE) + geom_text(data = means, aes(label = Decibels, y = Decibels + 1)) 

# Miercoles
datasetNoise<-read.delim("./csv/bygroups/X1.csv", header = TRUE, sep=",")
means <- aggregate(Decibels ~ Group, datasetNoise, mean)
ggplot(data=datasetNoise, aes(x=Group, y=Decibels)) + geom_boxplot() + stat_summary(fun.y=mean, colour="darkred", geom="point", shape=18, size=3,show_guide = FALSE) + geom_text(data = means, aes(label = Decibels, y = Decibels + 1)) 

datasetNoise<-read.delim("./csv/bygroups/X3.csv", header = TRUE, sep=",")
means <- aggregate(Decibels ~ Group, datasetNoise, mean)
ggplot(data=datasetNoise, aes(x=Group, y=Decibels)) + geom_boxplot() + stat_summary(fun.y=mean, colour="darkred", geom="point", shape=18, size=3,show_guide = FALSE) + geom_text(data = means, aes(label = Decibels, y = Decibels + 1)) 

datasetNoise<-read.delim("./csv/bygroups/X6.csv", header = TRUE, sep=",")
means <- aggregate(Decibels ~ Group, datasetNoise, mean)
ggplot(data=datasetNoise, aes(x=Group, y=Decibels)) + geom_boxplot() + stat_summary(fun.y=mean, colour="darkred", geom="point", shape=18, size=3,show_guide = FALSE) + geom_text(data = means, aes(label = Decibels, y = Decibels + 1)) 


# Jueves
datasetNoise<-read.delim("./csv/bygroups/J2.csv", header = TRUE, sep=",")
means <- aggregate(Decibels ~ Group, datasetNoise, mean)
ggplot(data=datasetNoise, aes(x=Group, y=Decibels)) + geom_boxplot() + stat_summary(fun.y=mean, colour="darkred", geom="point", shape=18, size=3,show_guide = FALSE) + geom_text(data = means, aes(label = Decibels, y = Decibels + 1)) 

datasetNoise<-read.delim("./csv/bygroups/J3.csv", header = TRUE, sep=",")
means <- aggregate(Decibels ~ Group, datasetNoise, mean)
ggplot(data=datasetNoise, aes(x=Group, y=Decibels)) + geom_boxplot() + stat_summary(fun.y=mean, colour="darkred", geom="point", shape=18, size=3,show_guide = FALSE) + geom_text(data = means, aes(label = Decibels, y = Decibels + 1)) 

datasetNoise<-read.delim("./csv/bygroups/J6.csv", header = TRUE, sep=",")
means <- aggregate(Decibels ~ Group, datasetNoise, mean)
ggplot(data=datasetNoise, aes(x=Group, y=Decibels)) + geom_boxplot() + stat_summary(fun.y=mean, colour="darkred", geom="point", shape=18, size=3,show_guide = FALSE) + geom_text(data = means, aes(label = Decibels, y = Decibels + 1)) 

# Viernes
datasetNoise<-read.delim("./csv/bygroups/V2.csv", header = TRUE, sep=",")
means <- aggregate(Decibels ~ Group, datasetNoise, mean)
ggplot(data=datasetNoise, aes(x=Group, y=Decibels)) + geom_boxplot() + stat_summary(fun.y=mean, colour="darkred", geom="point", shape=18, size=3,show_guide = FALSE) + geom_text(data = means, aes(label = Decibels, y = Decibels + 1)) 

datasetNoise<-read.delim("./csv/bygroups/V4.csv", header = TRUE, sep=",")
means <- aggregate(Decibels ~ Group, datasetNoise, mean)
ggplot(data=datasetNoise, aes(x=Group, y=Decibels)) + geom_boxplot() + stat_summary(fun.y=mean, colour="darkred", geom="point", shape=18, size=3,show_guide = FALSE) + geom_text(data = means, aes(label = Decibels, y = Decibels + 1)) 

datasetNoise<-read.delim("./csv/bygroups/V6.csv", header = TRUE, sep=",")
means <- aggregate(Decibels ~ Group, datasetNoise, mean)
ggplot(data=datasetNoise, aes(x=Group, y=Decibels)) + geom_boxplot() + stat_summary(fun.y=mean, colour="darkred", geom="point", shape=18, size=3,show_guide = FALSE) + geom_text(data = means, aes(label = Decibels, y = Decibels + 1)) 



#ggplot(data=datasetNoise, aes(x=Group, y=Decibels)) + geom_boxplot() + stat_summary(fun.y=as.numeric(mean), colour="darkred", geom="point", shape=18, size=3,show_guide = FALSE) + geom_text(data = means, aes(label = Decibels, y = Decibels + 1)) 
# Customizing colours.  These are nice ones "#999999", "#E69F00", "#56B4E9", "#00BA38"
#ggplot(datasetNoise, aes(x=Group, y=Decibels, fill=tag)) + geom_boxplot() + guides(fill=FALSE) + scale_fill_manual(values=c("#acdced", "#00BA38"))
#ggplot(datasetNoise, aes(x=Group, y=Decibels, fill=tag)) + geom_boxplot() + guides(fill=FALSE) + scale_fill_manual(values=c("#acdced", "#00BA38")) + scale_x_discrete(name="Group", breaks=c("0", "1"), labels=c("Control", "Treatment"))






##################################################################
# Datos por clase
##################################################################

## Control
# Lunes
datasetclase<-read.delim("./csv/samples/L2Cnoise.csv", header = TRUE, sep=",")
datasetclase<-read.delim("./csv/samples/L4Cnoise.csv", header = TRUE, sep=",")
datasetclase<-read.delim("./csv/samples/L6Cnoise.csv", header = TRUE, sep=",")
# Martes
datasetclase<-read.delim("./csv/samples/M5Cnoise.csv", header = TRUE, sep=",")
# Miercoles
datasetclase<-read.delim("./csv/samples/X1Cnoise.csv", header = TRUE, sep=",")
datasetclase<-read.delim("./csv/samples/X3Cnoise.csv", header = TRUE, sep=",")
datasetclase<-read.delim("./csv/samples/X6Cnoise.csv", header = TRUE, sep=",")
# Jueves
datasetclase<-read.delim("./csv/samples/J2Cnoise.csv", header = TRUE, sep=",")



datasetclase<-read.delim("./csv/samples/J3Cnoise.csv", header = TRUE, sep=",")
datasetclase<-read.delim("./csv/samples/J6Cnoise.csv", header = TRUE, sep=",")
# Viernes
datasetclase<-read.delim("./csv/samples/V2Cnoise.csv", header = TRUE, sep=",")
datasetclase<-read.delim("./csv/samples/V4Cnoise.csv", header = TRUE, sep=",")
datasetclase<-read.delim("./csv/samples/V6Cnoise.csv", header = TRUE, sep=",")

## Experimental
# Lunes
datasetclase<-read.delim("./csv/samples/L2Enoise.csv", header = TRUE, sep=",")
datasetclase<-read.delim("./csv/samples/L4Enoise.csv", header = TRUE, sep=",")
datasetclase<-read.delim("./csv/samples/L6Enoise.csv", header = TRUE, sep=",")
# Martes
datasetclase<-read.delim("./csv/samples/M5Enoise.csv", header = TRUE, sep=",")
# Miercoles
datasetclase<-read.delim("./csv/samples/X1Enoise.csv", header = TRUE, sep=",")
datasetclase<-read.delim("./csv/samples/X3Enoise.csv", header = TRUE, sep=",")
datasetclase<-read.delim("./csv/samples/X6Enoise.csv", header = TRUE, sep=",")
# Jueves
datasetclase<-read.delim("./csv/samples/J2Enoise.csv", header = TRUE, sep=",")
datasetclase<-read.delim("./csv/samples/J3Enoise.csv", header = TRUE, sep=",")
datasetclase<-read.delim("./csv/samples/J6Enoise.csv", header = TRUE, sep=",")
# Viernes
datasetclase<-read.delim("./csv/samples/V2Enoise.csv", header = TRUE, sep=",")
datasetclase<-read.delim("./csv/samples/V4Enoise.csv", header = TRUE, sep=",")
datasetclase<-read.delim("./csv/samples/V6Enoise.csv", header = TRUE, sep=",")

# Summary of data
summary(datasetclase$decibels)

# Trend
qplot(x = timestamp, y = decibels, data = datasetclase, main = "Trend decibels during the class") + stat_smooth(method = "loess", degree = 2, span = 0.2, se = FALSE, size=3) 
qplot(x = timestamp, y = decibels, data = datasetclase, main = "Trend decibels during the class") + stat_smooth(method = "lm", degree = 0, span = 0.2, se = FALSE, size=3)

# Multilineas espectacular . VAlroes para L2C noise
qplot(x = timestamp, y = decibels, data = datasetclase, main = "Trend decibels during the class") + stat_smooth(method = "loess", degree = 2, span = 0.2, se = FALSE, size=3) + geom_hline(aes(yintercept=2.37), colour="#BB0000", linetype="dashed", size=2) + geom_hline(aes(yintercept=-6.5), colour="#00BA38", linetype="dashed", size=2) + geom_vline(aes(xintercept=1429514998626), colour="#FF00FF", size=3, linetype=1) 

qplot(x = timestamp, y = decibels, data = datasetclase, main = "Trend decibels during the class") + stat_smooth(method = "loess", degree = 2, span = 0.2, se = FALSE, size=3) + geom_hline(aes(yintercept=2.37), colour="#BB0000", linetype="dashed", size=2) + geom_hline(aes(yintercept=-6.5), colour="#00BA38", linetype="dashed", size=2) 

#Las dos tremd combinadas
qplot(x = timestamp, y = decibels, data = datasetclase, main = "Trend decibels during the class") + stat_smooth(method = "lm", degree = 2, span = 0.2, se = FALSE, size=3)+ stat_smooth(method = "loess", degree = 2, span = 0.2, se = FALSE, size=3) 

