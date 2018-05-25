#####################################################
# Comparing the means of two independent groups:
#####################################################
#
# http://www.sthda.com/english/wiki/comparing-means-in-r
#

# Test normal distribution. Parametric or non-parametric
library(dplyr)
library(ggpubr)


# Shapiro Wild test to check normal distribution
prepostdataset_ai<-read.delim("./data/asuntosimportancia.csv", header = TRUE, sep=";")
prepostdataset_ai

# individual values subbscales > valorainteligencia;valoraentusiasmo;valorainiciativas;valoradifusion;valoraconectar
shapiro.test(prepostdataset_ai$valor_media)

# average values
shapiro.test(prepostdataset_ai$valorainteligencia)
shapiro.test(prepostdataset_ai$valoraentusiasmo)
shapiro.test(prepostdataset_ai$valorainiciativas)
shapiro.test(prepostdataset_ai$valoradifusion)
shapiro.test(prepostdataset_ai$valoraconectar)


# -> Normal distribution > parametric > implies T-Test > 
# -> Non normal distribu > non-parametric >implies Wilcoxon test

# Asuntos de importancia. prepostdataset_ai
# In this case p-value = 2.2e-16 < .05 in scales and subscales
# If the test is non-significant (p > .05) it tells us that the distribution of the sample is not significantly different from a normal distribution. 
# If, however, the test is significant (p < .05) then the distribution in question is significantly different from a normal distribution (i.e., it is non-normal). 
# See page 182 stats book


prepostdataset_pm<-read.delim("./data/potencialmooc.csv", header = TRUE, sep=";")
prepostdataset_pm
shapiro.test(prepostdataset_pm$valor)
# In this case also p-value = 2.2e-16 < .05

#####################################################
# Unpaired Two-Samples Wilcoxon Test in R
# http://www.sthda.com/english/wiki/unpaired-two-samples-wilcoxon-test-in-r
#####################################################
print(prepostdataset_ai)
summary(prepostdataset_ai)
print(prepostdataset_pm)

# Plot value amd color by group
library("ggpubr")

# Asuntos importancia
#  > valor_media
#  > valorainteligencia;valoraentusiasmo;valorainiciativas;valoradifusion;valoraconectar

ggboxplot(prepostdataset_ai, x = "test", y = "valor_media", 
          color = "test", palette = c("#00AFBB", "#E7B800"),
          ylab = "Valoración", xlab = "Test")


ggboxplot(prepostdataset_ai, x = "test", y = "valorainteligencia", 
          color = "test", palette = c("#00AFBB", "#E7B800"),
          ylab = "Valoración", xlab = "Test")
ggboxplot(prepostdataset_ai, x = "test", y = "valoraentusiasmo", 
          color = "test", palette = c("#00AFBB", "#E7B800"),
          ylab = "Valoración", xlab = "Test")
ggboxplot(prepostdataset_ai, x = "test", y = "valorainiciativas", 
          color = "test", palette = c("#00AFBB", "#E7B800"),
          ylab = "Valoración", xlab = "Test")
ggboxplot(prepostdataset_ai, x = "test", y = "valoradifusion", 
          color = "test", palette = c("#00AFBB", "#E7B800"),
          ylab = "Valoración", xlab = "Test")
ggboxplot(prepostdataset_ai, x = "test", y = "valoraconectar", 
          color = "test", palette = c("#00AFBB", "#E7B800"),
          ylab = "Valoración", xlab = "Test")



# Potencial del mooc
ggboxplot(prepostdataset_pm, x = "test", y = "valor", 
          color = "test", palette = c("#00AFBB", "#E7B800"),
          ylab = "Valoración", xlab = "Test")



#####################################################
# Compute unpaired two-samples Wilcoxon test
# Question : Is there any significant difference between pre and post for this values?
#####################################################
# If the p-value of the test is less than the significance level (alpha = 0.05), we can conclude that men’s median weight is significantly different from women’s median weight with a p-value = 0.02712.
#
# prepostdataset_ai
#
#  > valor_media
res_valor_media <- wilcox.test(valor_media ~ test, data = prepostdataset_ai, exact = FALSE)
res_valor_media

#  > valorainteligencia;
res_valorainteligencia <- wilcox.test(valorainteligencia ~ test, data = prepostdataset_ai, exact = FALSE)
res_valorainteligencia

#  > valoraentusiasmo;
res_valoraentusiasmo <- wilcox.test(valoraentusiasmo ~ test, data = prepostdataset_ai, exact = FALSE)
res_valoraentusiasmo

#  > valorainiciativas;
res_valorainiciativas <- wilcox.test(valorainiciativas ~ test, data = prepostdataset_ai, exact = FALSE)
res_valorainiciativas


#  > valoradifusion;
res_valoradifusion <- wilcox.test(valoradifusion ~ test, data = prepostdataset_ai, exact = FALSE)
res_valoradifusion
wilcox.test(valoradifusion ~ test, data = prepostdataset_ai, exact = FALSE, aleternative="less")
wilcox.test(valoradifusion ~ test, data = prepostdataset_ai, exact = FALSE, aleternative="greater")


#  > valoraconectar
res_valoraconectar <- wilcox.test(valoraconectar ~ test, data = prepostdataset_ai, exact = FALSE)
res_valoraconectar
wilcox.test(valoraconectar ~ test, data = prepostdataset_ai, exact = FALSE, aleternative="less")
wilcox.test(valoraconectar ~ test, data = prepostdataset_ai, exact = FALSE, aleternative="greater")

#
# > prepostdataset_pm
#
#  > valor
res_valor <- wilcox.test(valor ~ test, data = prepostdataset_pm, exact = FALSE)
res_valor


