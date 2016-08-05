####################################################################################
## Internal consistency
####################################################################################
# Cronbach´s Alpha

# Load library
library("psych", lib.loc="~/Library/R/2.15/library")

datasetConsist<-read.delim("./csv/chronbach.csv", header = TRUE, sep=";")
str(datasetConsist)
datasetConsist

# Split values of subscales
noise<-datasetConsist[, c(3, 4, 5)]
performance<-datasetConsist[, c(6, 7)]
noiseAndPerformance<-datasetConsist[, c(3, 4, 5, 6, 7)]

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

####################################################################################
## ANOVA
####################################################################################
# overall noise
anova_noise <- aov(NOISE ~ tratamiento, data = datasetShap) 
summary(anova_noise)

# individual noise
anova_noisenom <- aov(nom ~ tratamiento, data = datasetShap) 
summary(anova_noisenom)

anova_noisenps <- aov(nps ~ tratamiento, data = datasetShap) 
summary(anova_noisenps)

anova_noisenpt <- aov(npt ~ tratamiento, data = datasetShap) 
summary(anova_noisenpt)

# overall performance
anova_perf <- aov(PERFORMANCE ~ tratamiento, data = datasetShap) 
summary(anova_perf)

# individual performance
anova_perflps <- aov(lps ~ tratamiento, data = datasetShap) 
summary(anova_perflps)

anova_perflpt <- aov(lpt ~ tratamiento, data = datasetShap) 
summary(anova_perflpt)

####################################################################################
## Means and SD
####################################################################################
# overall noise
datasetNoise<-read.delim("./csv/allsamples2.csv", header = TRUE, sep=",")
meansnom <- aggregate(decibels ~ round, datasetNoise, mean)
meansnom
sdnom <- aggregate(decibels ~ round, datasetNoise, sd)
sdnom




# aprendido;volumen;edad;sexo;utilidad;tag;tratamiento
datasetSTtest<-read.delim("./csv/studenttest.csv", header = TRUE, sep=";")
# student noise
meansnps <- aggregate(volumen ~ tratamiento, datasetSTtest, mean)
meansnps
sdnps <- aggregate(volumen ~ tratamiento, datasetSTtest, sd)
sdnps

#student aprendido
meanslps <- aggregate(aprendido ~ tratamiento, datasetSTtest, mean)
meanslps
sdlps <- aggregate(aprendido ~ tratamiento, datasetSTtest, sd)
sdlps

#tag;aprendido;volumen; utilidad;tratamiento
datasetTEtest<-read.delim("./csv/teachertest.csv", header = TRUE, sep=";")
# student noise
meansnpt <- aggregate(volumen ~ tratamiento, datasetTEtest, mean)
meansnpt
sdnpt <- aggregate(volumen ~ tratamiento, datasetTEtest, sd)
sdnpt

#student aprendido
meanslpt <- aggregate(aprendido ~ tratamiento, datasetTEtest, mean)
meanslpt
sdlpt <- aggregate(aprendido ~ tratamiento, datasetTEtest, sd)
sdlpt


# CLean console
cat("\014")


####################################################################################
## Figure Calibration
####################################################################################
library(ggplot2)
datasetclase<-read.delim("./csv/samples/J2Cnoise.csv", header = TRUE, sep=",")
datasetclase<-read.delim("./csv/noisePilarTest.csv", header = TRUE, sep=",")

# Summary of data to identify max and min for next charts
summary(datasetclase$timestamp)
summary(datasetclase$decibels)

# Final chart. Only horizontal with fake classroom
qplot(x = timestamp, y = decibels, data = datasetclase, main = "Trend decibels during the class") + geom_hline(aes(yintercept=-0.99), colour="darkred", linetype="dashed", size=3) + geom_hline(aes(yintercept=-9.82), colour="darkgreen", linetype="dashed", size=3) 

# Trend
qplot(x = timestamp, y = decibels, data = datasetclase, main = "Trend decibels during the class") + stat_smooth(method = "loess", degree = 2, span = 0.2, se = FALSE, size=3) 
qplot(x = timestamp, y = decibels, data = datasetclase, main = "Trend decibels during the class") + stat_smooth(method = "lm", degree = 2, span = 0.2, se = FALSE, size=3)

#Las dos trend combinadas
qplot(x = timestamp, y = decibels, data = datasetclase, main = "Trend decibels during the class") + stat_smooth(method = "lm", degree = 2, span = 0.2, se = FALSE, size=3)+ stat_smooth(method = "loess", degree = 2, span = 0.2, se = FALSE, size=3, colour="#BB0000") 

# Multilineas horizontales
qplot(x = timestamp, y = decibels, data = datasetclase, main = "Trend decibels during the class") + stat_smooth(method = "loess", degree = 2, span = 0.2, se = FALSE, size=3) + geom_hline(aes(yintercept=-0.49), colour="#BB0000", linetype="dashed", size=2) + geom_hline(aes(yintercept=-7.49), colour="#00BA38", linetype="dashed", size=2) 

# Multilineas horizontales y verticales
qplot(x = timestamp, y = decibels, data = datasetclase, main = "Trend decibels during the class") + stat_smooth(method = "loess", degree = 2, span = 0.2, se = FALSE, size=3) + geom_hline(aes(yintercept=-0.49), colour="#BB0000", linetype="dashed", size=2) + geom_hline(aes(yintercept=-7.49), colour="#00BA38", linetype="dashed", size=2) + geom_vline(aes(xintercept=1429514998626), colour="#FF00FF", size=3, linetype=1) 

# Trends i multilineas combinadas
qplot(x = timestamp, y = decibels, data = datasetclase, main = "Trend decibels during the class") + stat_smooth(method = "lm", degree = 2, span = 0.2, se = FALSE, size=3) + stat_smooth(method = "loess", degree = 2, span = 0.2, se = FALSE, size=3, colour="#BB0000") 

qplot(x = timestamp, y = decibels, data = datasetclase, main = "Trend decibels during the class") + stat_smooth(method = "lm", degree = 2, span = 0.2, se = FALSE, size=3) + stat_smooth(method = "loess", degree = 2, span = 0.2, se = FALSE, size=3, colour="#FFFF00") + geom_hline(aes(yintercept=-0.49), colour="#BB0000", linetype="dashed", size=2) + geom_hline(aes(yintercept=-7.49), colour="#00BA38", linetype="dashed", size=2)

####################################################################################
## H1 Boxplot
####################################################################################
# timestamp, decibels, tag, diasemana, numsesion, profesor, aula, group, idioma, round 
datasetNoise<-read.delim("./csv/allsamples2.csv", header = TRUE, sep=",")

# Overall means and stdev by ...
means <- aggregate(decibels ~ tag, datasetNoise, mean)
means
means <- aggregate(decibels ~ round, datasetNoise, mean)
means
means <- aggregate(decibels ~ group, datasetNoise, mean)
means
write.table(means, "./csv/noisemeansbygroup.csv", sep=",")

ggplot(datasetNoise, aes(x=round, y=decibels)) + geom_boxplot() + stat_summary(fun.y=mean, colour="darkred", geom="point", shape=18, size=3,show_guide = FALSE) + geom_text(data = means, aes(label = decibels, y = decibels + 1)) 

# Calcular means por sesion, ronda y group 
sd <- aggregate(decibels ~ tag, datasetNoise, sd)
sd
sd <- aggregate(decibels ~ round, datasetNoise, sd)
sd
sd <- aggregate(decibels ~ group, datasetNoise, sd)
sd





####
# Overall means and stdev by treatment
means <- aggregate(decibels ~ tag, datasetNoise, mean)
means

# Calcular means por seson
sd <- aggregate(decibels ~ tag, datasetNoise, sd)
sd

# Export to CSV file to creat a table for sqlite firefox
write.table(sd, "./csv/noisesdbysession.csv", sep=",")


# Export to CSV file
write.table(means, "./csv/noisemeansbysession.csv", sep=",")


############ Calculo de escalones
# Nose means by session only conrol
meanscontrol<-read.delim("./csv/noisemeansbysessionOnlyControl.csv", header = TRUE, sep=",")

# Calcular thresholds por group
maximo <- max(meanscontrol$decibels)
minimo <- min(meanscontrol$decibels)
maximo
minimo


rango <- maximo - minimo
rango

escalon <- (rango / 5)
escalon

escalon1 <- minimo
escalon2 <- minimo + (escalon)
escalon3 <- minimo + (escalon * 2)
escalon4 <- minimo + (escalon * 3)
escalon5 <- minimo + (escalon * 4)
escalon6 <- minimo + (escalon * 5)

escalon1 
escalon2 
escalon3 
escalon4 
escalon5 
escalon6 

# Entre el GREEN y RED hay 512 colores que diviremos entre 5. Escalon = 102 dec = 66 HEX
> LEVEL 1 #00FF00 GREEN
> LEVEL 2 #66FF00
> LEVEL 3 #CCFF00
> #FFFF00 Yellow
> LEVEL 4 #FFCC00
> LEVEL 5 #FF6600
> LEVEL 6 #FF0000 RED

cols <- c("esc1"="#00FF00","esc2"="#66FF00","esc3"="#CCFF00","esc4"="#FFCC00","esc5"="#FF6600","esc6"="#FF0000")
mean(datasetNoise$decibels)
sd(datasetNoise$decibels)
summary(datasetNoise$decibels)

# Ranking de sesiones clustered con lineas multicolor y anotaciones
ggplot(datasetNoise, aes(group, decibels)) + geom_boxplot(aes(fill = factor(round))) + scale_fill_manual(values = c("grey", "lightblue")) + geom_hline(aes(yintercept=escalon1), colour=cols["esc1"], linetype="dashed", size=1) + geom_hline(aes(yintercept=escalon2), colour=cols["esc2"], linetype="dashed", size=1) + geom_hline(aes(yintercept=escalon3), colour=cols["esc3"], linetype="dashed", size=1) + geom_hline(aes(yintercept=escalon4), colour=cols["esc4"], linetype="dashed", size=1) + geom_hline(aes(yintercept=escalon5), colour=cols["esc5"], linetype="dashed", size=1) + geom_hline(aes(yintercept=escalon6), colour=cols["esc6"], linetype="dashed", size=1) + annotate("text", label = "Very Low", x = 1.5, y = escalon1-1, colour="darkgreen") + annotate("text", label = "Very High", x = 1.5, y = escalon6+1, , colour="darkred") + annotate("text", label = "Overall M(SD) = -3.42(6.39)", x = 11, y = -22, , colour="black")



# Ranking de groups clustered con lineas multicolor y anotaciones. ESTO LO HABRAS JODIDO AL QUITARLE UN ESCALON
ggplot(datasetNoise, aes(group, decibels)) + geom_boxplot() + geom_hline(aes(yintercept=escalon1), colour="#00FF00", linetype="dashed", size=1) + geom_hline(aes(yintercept=escalon2), colour="#55FF00", linetype="dashed", size=1) + geom_hline(aes(yintercept=escalon3), colour="#AAFF00", linetype="dashed", size=1) + geom_hline(aes(yintercept=escalon4), colour="#FFFF00", linetype="dashed", size=1) + geom_hline(aes(yintercept=escalon5), colour="#FFAA00", linetype="dashed", size=1) + geom_hline(aes(yintercept=escalon6), colour="#FF5500", linetype="dashed", size=1) + geom_hline(aes(yintercept=escalon7), colour="#FF0000", linetype="dashed", size=1) + annotate("text", label = "Very Low", x = 1.1, y = escalon1) + annotate("text", label = "Very High", x = 1.1, y = escalon7) 




####################################################################################
## H1c Perceived usefulness of the system
####################################################################################
# students
# aprendido, volumen, edad, sexo, utilidad, tag, grupo
datasetNoise<-read.delim("./csv/studenttest_tratamiento.csv", header = TRUE, sep=",")
summary(datasetNoise$aprendido)
summary(datasetNoise$volumen)
summary(datasetNoise$edad)
summary(datasetNoise$sexo)

# Overall
summary(datasetNoise$utilidad)
sd(datasetNoise$utilidad)


# By group
sd <- aggregate(utilidad ~ grupo, datasetNoise, sd)
sd

me <- aggregate(utilidad ~ grupo, datasetNoise, mean)
me

metag <- aggregate(utilidad ~ tag, datasetNoise, mean)
metag
write.table(metag, "./csv/meansutilidad_students.csv", sep=",")


# teachers
# tag, aprendido, volumen, utilidad, grupo
datasetNoise<-read.delim("./csv/teachertest_tratamiento.csv", header = TRUE, sep=",")
summary(datasetNoise$utilidad)
sd(datasetNoise$utilidad)




####################################
## Correlation analyis by session
####################################
# objective_noise, teacher_noise, students_noise, teacher_aprendido, students_aprendido
datasetNoise<-read.delim("./csv/correlationClassroomsResults.csv", header = TRUE, sep=",")
datasetNoise

OJO. AQUI TENDRAS QUE HACER LAS COMPROBACIONES PARA VER SILOS DATOS SON VALIDOS Y NORMALIZADOS Y LA MADRE QUE LO PARIO
estas asunciones las tienes definidas en las slides

pairs(datasetNoise)

# Strong correlation PSP NSP
plot(students_aprendido ~ students_noise, data = datasetNoise, ylab = "Students perceived learning performance", xlab = "Students perceived noise") 
abline(lm(students_aprendido ~ students_noise, data = datasetNoise), col = "red", lw=2)

# Strong correlation NOM NSP
plot(objective_noise ~ students_noise, data = datasetNoise, ylab = "Objective noise measure", xlab = "Students perceived noise") 
abline(lm(objective_noise ~ students_noise, data = datasetNoise), col = "red", lw=2)

# Strong correlation PTP NTP
plot(teacher_aprendido ~ teacher_noise, data = datasetNoise, ylab = "Teachers perception of students performance", xlab = "Teachers perceived noise") 
abline(lm(teacher_aprendido ~ teacher_noise, data = datasetNoise), col = "red", lw=2)




sess_cor <- cor(datasetNoise)
# Rounding decimals
sess_cor <- round(cor(datasetNoise),2)
sess_cor
write.table(sess_cor, "./csv/session_correlation.csv", sep=",")

# diasemana numsesion   edad numestudiantes percchicas percchicos objective_noise teacher_noise students_noise teacher_aprendido students_aprendido

# Strong correlation
cor.test(datasetNoise$students_noise, datasetNoise$objective_noise)
cor.test(datasetNoise$teacher_noise, datasetNoise$teacher_aprendido)
cor.test(datasetNoise$students_noise, datasetNoise$students_aprendido)

# Moderate correlation
cor.test(datasetNoise$students_noise, datasetNoise$teacher_noise)
cor.test(datasetNoise$teacher_aprendido, datasetNoise$students_noise)
cor.test(datasetNoise$percchicos, datasetNoise$objective_noise)

cor.test(datasetNoise$students_aprendido, datasetNoise$numestudiantes)
cor.test(datasetNoise$students_aprendido, datasetNoise$objective_noise)




########################################################################
## H3
########################################################################
# Difference, Gender, Age, Role
datasetNoise<-read.delim("./csv/correlatingnoiseAgeGender.csv", header = TRUE, sep=",")
library(ggplot2)


####### Age 
means <- aggregate(Difference ~ Age, datasetNoise, mean)
means
means$Age
means$Difference

sdev <- aggregate(Difference ~ Age, datasetNoise, sd)
sdev
sdev$Age
sdev$Difference


# Bar chart Age
qplot(x=Age, y=Difference, data=means, geom="bar", stat="identity", position="dodge", fill=factor(Age))

qplot(x=Age, y=Difference, data=means, geom="bar", stat="identity", position="dodge", fill = I("grey50")) + theme(text = element_text(size=22)) +  geom_text(data = means, aes(label = round(Difference,2), y = Difference+0.1), colour="black", size=8) + geom_text(data = sdev, aes(label = round(Difference,2), y = 1.25), colour="darkblue", size=8) + scale_x_continuous(breaks=c(12,13,14,15,16,17,18)) + geom_hline(yintercept=0, colour="darkgreen", linetype="longdash", size=4) + annotate("text", label = "SD", x = 12.5, y = 1.25, colour="darkblue", size=8) + annotate("text", label = "Objective noise measure", x = 17, y = 0.1, colour="darkgreen", size=8) 




####### Gender
means <- aggregate(Difference ~ Gender, datasetNoise, mean)
means
means$Gender
means$Difference

sdev <- aggregate(Difference ~ Gender, datasetNoise, sd)
sdev
sdev$Age
sdev$Difference


# Bar chart gender
qplot(x=Gender, y=Difference, data=means, geom="bar", stat="identity", position="dodge", fill=factor(Gender)) 

qplot(x=Gender, y=Difference, data=means, geom="bar", stat="identity", position="dodge", fill = I("grey50")) + theme(text = element_text(size=22)) + geom_text(data = means, aes(label = round(Difference,2), y = Difference+0.1), colour="black", size=8) + geom_text(data = sdev, aes(label = round(Difference,2), y = 1), colour="darkblue", size=8) + geom_hline(yintercept=0, colour="darkgreen", linetype="longdash", size=4) + annotate("text", label = "SD", x = 0.5, y = 1, colour="darkblue", size=8) + annotate("text", label = "Objective noise measure", x = 1.5, y = -0.06, colour="darkgreen", size=8)


####### Role
# tag,objective_meassure,teach_diff,teacher_measure,stud_diff,students_meassure
datasetNoise<-read.delim("./csv/diffaccuracy.csv", header = TRUE, sep=",")
library(ggplot2)
datasetNoise

# Students
mean(datasetNoise$stud_diff)
sd(datasetNoise$stud_diff)

# Teachers
mean(datasetNoise$teach_diff)
sd(datasetNoise$teach_diff)

--- La movida esta invertida
Negative differences significa que han overranked

An analysis of the deviation was performed with the aim to identify weather students and teachers tend to over/below estimate the noise in the classroom with respect to the objective noise ranking illustrated in Figure 4. The results show that both teachers (M=0.14;SD=1.55) and students (M=0.48;SD=1.10) tend to overestimate the noise levels. 



####### Treatment

# tag, objective_measure, teacher_measure, student_measure, diff_stu, diff_tea, round
datasetNoise<-read.delim("./csv/accuracynoisetreatment.csv", header = TRUE, sep=",")
library(ggplot2)

## Overall independently on the session
# Students
means_st <- aggregate(diff_stu ~ round, datasetNoise, mean)
means_st
sd_st <- aggregate(diff_stu ~ round, datasetNoise, sd)
sd_st


means_st$diff_stu
means_st$round

# Teachers
means_tea <- aggregate(diff_tea ~ round, datasetNoise, mean)
means_tea
means_tea$diff_tea
means_tea$round

## Clustered by session
# Session
means_se_stu <- aggregate(diff_stu ~ tag, datasetNoise, mean)
means_se_stu
write.table(means_se_stu, "./csv/noisedeviationmeans_stu.csv", sep=",")

means_se_tea <- aggregate(diff_tea ~ tag, datasetNoise, mean)
means_se_tea
write.table(means_se_tea, "./csv/noisedeviationmeans_tea.csv", sep=",")







####################################################################################
# Evolution of noise along the day
####################################################################################
library(ggplot2)
#Load file
# hour;mean;numitems
datasetEvening<-read.delim("./csv/evolution_day.csv", header = TRUE, sep=";")

#Show data set
datasetEvening
datasetEvening$Hour
datasetEvening$Mean
datasetEvening$NumSamples

# Pintar el escalon que mola mogollon



# Ingles
a <- qplot(x = Hour, y = Mean, data = datasetEvening, size = NumSamples, main = "Noise evolution along the day") 
b <- a + stat_smooth(size=2)  
c <- b + geom_rect(aes(xmin=9.75, xmax=10.25, ymin=-Inf, ymax=Inf), alpha=0.2, fill="white") + annotate("text", label = "Break", x = 10, y = 5) 
d <- c + geom_rect(aes(xmin=11.75, xmax=12.25, ymin=-Inf, ymax=Inf), alpha=0.2, fill="white") + annotate("text", label = "Break", x = 12, y = 5) 
e <- d + geom_vline(xintercept=8, colour="grey", linetype="dashed", size=1) + annotate("text", label = "Session 1", x = 8.4, y = -15)
f <- e + geom_vline(xintercept=8.875, colour="grey", linetype="dashed", size=1) + annotate("text", label = "Session 2", x = 9.275, y = -15)
g <- f + annotate("text", label = "Session 3", x = 10.6, y = -15)
h <- g + geom_vline(xintercept=11, colour="grey", linetype="dashed", size=1) + annotate("text", label = "Session 4", x = 11.4, y = -15)
i <- h + annotate("text", label = "Session 5", x = 12.6, y = -15)
j <- i + geom_vline(xintercept=13.125, colour="grey", linetype="dashed", size=1) + annotate("text", label = "Session 6", x = 13.525, y = -15)
k <- j + geom_vline(xintercept=14, colour="grey", linetype="dashed", size=1) 
l <- k + geom_hline(aes(yintercept=escalon1), colour=cols["esc1"], linetype="dashed", size=1) + geom_hline(aes(yintercept=escalon2), colour=cols["esc2"], linetype="dashed", size=1) + geom_hline(aes(yintercept=escalon3), colour=cols["esc3"], linetype="dashed", size=1) + geom_hline(aes(yintercept=escalon4), colour=cols["esc4"], linetype="dashed", size=1) + geom_hline(aes(yintercept=escalon5), colour=cols["esc5"], linetype="dashed", size=1) + geom_hline(aes(yintercept=escalon6), colour=cols["esc6"], linetype="dashed", size=1)
l

# Castellano
a <- qplot(x = Hour, y = Mean, data = datasetEvening, size = NumSamples, main = "Noise evolution along the day") 
b <- a + stat_smooth(size=2)  
c <- b + geom_rect(aes(xmin=9.75, xmax=10.25, ymin=-Inf, ymax=Inf), alpha=0.2, fill="white") + annotate("text", label = "Recreo", x = 10, y = 5) 
d <- c + geom_rect(aes(xmin=11.75, xmax=12.25, ymin=-Inf, ymax=Inf), alpha=0.2, fill="white") + annotate("text", label = "Recreo", x = 12, y = 5) 
e <- d + geom_vline(xintercept=8, colour="grey", linetype="dashed", size=1) + annotate("text", label = "Sesion 1", x = 8.4, y = -15)
f <- e + geom_vline(xintercept=8.875, colour="grey", linetype="dashed", size=1) + annotate("text", label = "Sesion 2", x = 9.275, y = -15)
g <- f + annotate("text", label = "Sesion 3", x = 10.6, y = -15)
h <- g + geom_vline(xintercept=11, colour="grey", linetype="dashed", size=1) + annotate("text", label = "Sesion 4", x = 11.4, y = -15)
i <- h + annotate("text", label = "Sesion 5", x = 12.6, y = -15)
j <- i + geom_vline(xintercept=13.125, colour="grey", linetype="dashed", size=1) + annotate("text", label = "Sesion 6", x = 13.525, y = -15)
k <- j + geom_vline(xintercept=14, colour="grey", linetype="dashed", size=1) 
k


aaaaaa
#
# Means and SD
#
# Hour;Decibels
dsDay<-read.delim("./csv/evolution_day_samples.csv", header = TRUE, sep=";")
means_d <- aggregate(Decibels ~ Hour, dsDay, mean)
means_d
sd_d <- aggregate(Decibels ~ Hour, dsDay, sd)
sd_d


####################################################################################
# Evolution of noise along the week
####################################################################################
library(ggplot2)
#Load file
# hour;mean;numitems
datasetWeek<-read.delim("./csv/evolution_week.csv", header = TRUE, sep=";")


#Show data set
datasetWeek
datasetWeek$DayWeek
datasetWeek$MeanNoise
datasetWeek$NumSamples

qplot(x = DayWeek, y = MeanNoise, data = datasetWeek, size = NumSamples, main = "Noise evolution along the week") + stat_smooth(size=2)  

#
# Means and SD
#
# DayWeek;Decibels
dsW<-read.delim("./csv/evolution_week_samples.csv", header = TRUE, sep=";")
means_w <- aggregate(Decibels ~ DayWeek, dsW, mean)
means_w
sd_w <- aggregate(Decibels ~ DayWeek, dsW, sd)
sd_w


####################################################################################
# Patterns
####################################################################################
# timestamp, decibels, tag, diasemana, numsesion, profesor, aula, group, idioma, round, type
datasetNoise<-read.delim("./csv/allsamples_with_type_diver.csv", header = TRUE, sep=",")

# Overall means and stdev by Teacher
means_p <- aggregate(decibels ~ profesor, datasetNoise, mean)
means_p
sd_p <- aggregate(decibels ~ profesor, datasetNoise, sd)
sd_p

# Overall means and stdev by aula NOT RELEVANT
means_au <- aggregate(decibels ~ aula, datasetNoise, mean)
means_au
sd_au <- aggregate(decibels ~ aula, datasetNoise, sd)
sd_au

# Overall means and stdev by type
means_ty <- aggregate(decibels ~ type, datasetNoise, mean)
means_ty
sd_ty <- aggregate(decibels ~ type, datasetNoise, sd)
sd_ty

# Overall means and stdev by language
means_lang <- aggregate(decibels ~ idioma, datasetNoise, mean)
means_lang
sd_lang <- aggregate(decibels ~ idioma, datasetNoise, sd)
sd_lang

# Overall means and stdev by diversificacion
means_di <- aggregate(decibels ~ diver, datasetNoise, mean)
means_di
sd_di <- aggregate(decibels ~ diver, datasetNoise, sd)
sd_di
