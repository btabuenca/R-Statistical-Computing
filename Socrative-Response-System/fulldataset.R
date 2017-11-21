####################################################################################
# 
####################################################################################
library(ggplot2)
#Load file
user;u;g;o;evalua_a
fulldataset<-read.delim("./data/fulldataset.csv", header = TRUE, sep=";")


# Show data set
fulldataset
fulldataset$user
fulldataset$u
fulldataset$g
fulldataset$o

# Valora la utilidad y probabilidad de éxito (u)
ggplot(fulldataset, aes(x=evalua_a, y=u, fill=evalua_a)) + geom_boxplot()

means <- aggregate(u ~  evalua_a, fulldataset, mean)
ggplot(fulldataset, aes(x=evalua_a, y=u, fill=evalua_a)) + geom_boxplot() + guides(fill=FALSE) + 
  stat_summary(fun.y=mean, colour="darkred", geom="point", 
               shape=18, size=3,show_guide = FALSE) + geom_text(data = means, aes(label = round(u, 2), y = u + 1))

# Valora la originalidad e innvación (g)
ggplot(fulldataset, aes(x=evalua_a, y=g, fill=evalua_a)) + geom_boxplot()

means <- aggregate(g ~  evalua_a, fulldataset, mean)
ggplot(fulldataset, aes(x=evalua_a, y=g, fill=evalua_a)) + geom_boxplot() + guides(fill=FALSE) + 
  stat_summary(fun.y=mean, colour="darkred", geom="point", 
               shape=18, size=3,show_guide = FALSE) + geom_text(data = means, aes(label = round(g, 2), y = g + 1))


# Valora la PRESENTACION en público del producto (o)
ggplot(fulldataset, aes(x=evalua_a, y=o, fill=evalua_a)) + geom_boxplot()

means <- aggregate(o ~  evalua_a, fulldataset, mean)
ggplot(fulldataset, aes(x=evalua_a, y=o, fill=evalua_a)) + geom_boxplot() + guides(fill=FALSE) + 
  stat_summary(fun.y=mean, colour="darkred", geom="point", 
               shape=18, size=3,show_guide = FALSE) + geom_text(data = means, aes(label = round(o, 2), y = o + 1))


