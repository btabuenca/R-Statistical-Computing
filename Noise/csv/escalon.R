#Calculo de escalones
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


escalon1 #00FF00
escalon2 #55FF00
escalon3 #AAFF00
escalon4 #FFFF00
escalon5 #FFAA00
escalon6 #FF5500
escalon7 #FF0000

> LEVEL 1 #00FF00
[1] -9.238469

> LEVEL 2 #55FF00
[1] -7.246011

> LEVEL 3 #AAFF00
[1] -5.253552

> LEVEL 4 #FFFF00
[1] -3.261094

> LEVEL 5 #FFAA00
[1] -1.268635

> LEVEL 6 #FF5500

[1] 0.723823

> LEVEL 7 #00FF00


cols <- c("esc1"="#00FF00","esc2"="#55FF00","esc3"="#AAFF00","esc4"="#FFFF00","esc5"="#FFAA00","esc6"="#FF5500","esc7"="#FF0000")
