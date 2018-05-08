<<<<<<< Updated upstream
#
# R Levene test for variances
#

#
# Inspired on https://www.youtube.com/watch?v=OL8qaVS4Xwg
#

install.packages("car")
library(car)

# Might be 55 obs of 2 variables
# e.g. 2 columns (location, grade) with 55 rows
# 
myData<-read.csv("./csv/shapiro.csv", header = TRUE, sep=";", na.strings=c("", "NA"))
myDataAcc<-read.delim("./csv/diffaccuracygrupos.csv", header = TRUE, sep=";")
myDataUsef<-read.delim("./csv/studenttest_tratamiento.csv", header = TRUE, sep=",")

# En nuestro caso 
#  - location: grupo
#  - grade sera cada una de las variables 
#      Table: Summary of noise measuere obtained by session
#        Objective - NOM
#        Perceived - NPS - NPT
                      
#        Accccuracy- ???
#      Table: Summary of learning performance

# Note the old levene.test has been replaced by leveneTest
leveneTest(myData$nom, myData$grupo, center=mean)
leveneTest(myData$nps, myData$grupo, center=mean)
leveneTest(myData$npt, myData$grupo, center=mean)

leveneTest(myData$lps, myData$grupo, center=mean)
leveneTest(myData$lpt, myData$grupo, center=mean)

leveneTest(myDataAcc$teach_diff, myData$grupo, center=mean)
leveneTest(myDataAcc$stud_diff, myData$grupo, center=mean)

leveneTest(myDataUsef$utilidad, myDataUsef$grupo, center=mean)


# If you leave out the center=mean it will use the median which is also known as 
# the Brown-Frosyhe test for variances
leveneTest(myData$nom, myData$grupo)

=======
#
# R Levene test for variances
#

#
# Inspired on https://www.youtube.com/watch?v=OL8qaVS4Xwg
#

install.packages("car")
library(car)

# Might be 55 obs of 2 variables
# e.g. 2 columns (location, grade) with 55 rows
# 
myData<-read.csv("./csv/shapiro.csv", header = TRUE, sep=";", na.strings=c("", "NA"))
myDataAcc<-read.delim("./csv/diffaccuracygrupos.csv", header = TRUE, sep=";")
myDataUsef<-read.delim("./csv/studenttest_tratamiento.csv", header = TRUE, sep=",")

# En nuestro caso 
#  - location: grupo
#  - grade sera cada una de las variables 
#      Table: Summary of noise measuere obtained by session
#        Objective - NOM
#        Perceived - NPS - NPT
                      
#        Accccuracy- ???
#      Table: Summary of learning performance

# Note the old levene.test has been replaced by leveneTest
leveneTest(myData$nom, myData$grupo, center=mean)
leveneTest(myData$nps, myData$grupo, center=mean)
leveneTest(myData$npt, myData$grupo, center=mean)

leveneTest(myData$lps, myData$grupo, center=mean)
leveneTest(myData$lpt, myData$grupo, center=mean)

leveneTest(myDataAcc$teach_diff, myData$grupo, center=mean)
leveneTest(myDataAcc$stud_diff, myData$grupo, center=mean)

leveneTest(myDataUsef$utilidad, myDataUsef$grupo, center=mean)


# If you leave out the center=mean it will use the median which is also known as 
# the Brown-Frosyhe test for variances
leveneTest(myData$nom, myData$grupo)

>>>>>>> Stashed changes
