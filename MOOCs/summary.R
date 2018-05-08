####################################################################################
# Summary variables. Basic analysis 
####################################################################################
library(ggplot2)


# Registration data 
registrationdataset<-read.delim("./data/registrationdata.csv", header = TRUE, sep=";")

summary(registrationdataset$country)
prop.table(table(registrationdataset$country))

summary(registrationdataset$age)
prop.table(table(registrationdataset$age))

summary(registrationdataset$gender)
prop.table(table(registrationdataset$gender))







# Load file
# genero;pais;edad;hogar;estudios;empleo;conocermoocs;moocsrealizados;moocstrabajo;moocquierocontactos;moocquierocompartir;moocquieropersonas;moocquieroorganizaciones;moocquierootro;activo;potencialmdperiodicos;potencialmdtele;potencialmdradio;potencialmdredes;potencialmdinternet;perfilperiodicos;perfiltelevision;perfilradio;perfilredes;perfilinternet;potencialmooc;potencialeducformal;potencialeducfamiliar;edadeducaccion;valorainteligencia;valoraentusiasmo;valorainiciativas;valoradifusion;valoraconectar
fulldataset<-read.delim("./data/resultset.csv", header = TRUE, sep=";")


# Show data set
fulldataset
fulldataset$genero
fulldataset$edad

#
# demographics
#

#genero
summary(fulldataset$genero)
sd(fulldataset$genero)
prop.table(table(fulldataset$genero))



#pais
summary(fulldataset$pais)
prop.table(table(fulldataset$pais))

# edad
summary(fulldataset$edad)
sd(fulldataset$edad)

#hogar
summary(fulldataset$hogar)
prop.table(table(fulldataset$hogar))


#estudios
summary(fulldataset$estudios)
prop.table(table(fulldataset$estudios))

#empleo
summary(fulldataset$empleo)
prop.table(table(fulldataset$empleo))


#conocermoocs
summary(fulldataset$conocermoocs)
prop.table(table(fulldataset$conocermoocs))

#moocsrealizados;
summary(fulldataset$moocsrealizados)
sd(fulldataset$moocsrealizados)


#moocstrabajo
summary(fulldataset$moocstrabajo)
prop.table(table(fulldataset$moocstrabajo))

#
# Que busco en este MOOC
#

#moocquierocontactos	
summary(fulldataset$moocquierocontactos)
prop.table(table(fulldataset$moocquierocontactos))

#moocquierocompartir	
summary(fulldataset$moocquierocompartir)
prop.table(table(fulldataset$moocquierocompartir))

#moocquieropersonas	
summary(fulldataset$moocquieropersonas)
prop.table(table(fulldataset$moocquieropersonas))

#moocquieroorganizaciones	
summary(fulldataset$moocquieroorganizaciones)
prop.table(table(fulldataset$moocquieroorganizaciones))

#moocquierootro
summary(fulldataset$moocquierootro)




#
#activo
#
summary(fulldataset$activo)
sd(fulldataset$activo)


#
# potencial medios digitales
#

#potencialmdperiodicos	
summary(fulldataset$potencialmdperiodicos)
sd(fulldataset$potencialmdperiodicos)


#potencialmdtele	
summary(fulldataset$potencialmdtele)
sd(fulldataset$potencialmdtele)


#potencialmdradio	
summary(fulldataset$potencialmdradio)
sd(fulldataset$potencialmdradio)


#potencialmdredes	
summary(fulldataset$potencialmdredes)
sd(fulldataset$potencialmdredes)


#potencialmdinternet
summary(fulldataset$potencialmdinternet)
sd(fulldataset$potencialmdinternet)


#
# perfil medios digitales
#



#perfilperiodicos	
summary(fulldataset$perfilperiodicos)
prop.table(table(fulldataset$perfilperiodicos))

#perfiltelevision	
summary(fulldataset$perfiltelevision)
prop.table(table(fulldataset$perfiltelevision))

#perfilradio	
summary(fulldataset$perfilradio)
prop.table(table(fulldataset$perfilradio))

#perfilredes	
summary(fulldataset$perfilredes)
prop.table(table(fulldataset$perfilredes))

#perfilinternet
summary(fulldataset$perfilinternet)
prop.table(table(fulldataset$perfilinternet))


#
# Potencial
#

#potencialmooc	
summary(fulldataset$potencialmooc)
sd(fulldataset$potencialmooc)

#potencialeducformal	
summary(fulldataset$potencialeducformal)
sd(fulldataset$potencialeducformal)

#potencialeducfamiliar	
summary(fulldataset$potencialeducfamiliar)
sd(fulldataset$potencialeducfamiliar)


# edad educaccion	
summary(fulldataset$edadeducaccion)
prop.table(table(fulldataset$edadeducaccion))


#
# valorar
#

#valorainteligencia	
summary(fulldataset$valorainteligencia)
sd(fulldataset$valorainteligencia)

#valoraentusiasmo	
summary(fulldataset$valoraentusiasmo)
sd(fulldataset$valoraentusiasmo)

#valorainiciativas	
summary(fulldataset$valorainiciativas)
sd(fulldataset$valorainiciativas)

#valoradifusion	
summary(fulldataset$potencialeducfamiliar)
sd(fulldataset$potencialeducfamiliar)

#valoraconectar
summary(fulldataset$potencialeducfamiliar)
sd(fulldataset$potencialeducfamiliar)



