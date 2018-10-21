####################################################################################
# Summary variables. Basic analysis. REGISTRATION DATA
####################################################################################
library(ggplot2)


# Registration data 
registrationdataset<-read.delim("./data/registrationdata.csv", header = TRUE, sep=";")

summary(registrationdataset$country)
prop.table(table(registrationdataset$country))

registrationdataset$age
summary(registrationdataset$age)
sd(registrationdataset$age)
prop.table(table(registrationdataset$age))

summary(registrationdataset$gender)
prop.table(table(registrationdataset$gender))





####################################################################################
# Summary variables. Basic analysis. PRE-QUESTIONNAIRE
####################################################################################

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
fulldataset$moocsrealizados
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
fulldataset$activo
summary(fulldataset$activo)
sd(fulldataset$activo)
tbl <- table(fulldataset$activo)
cbind(tbl,round(prop.table(tbl)*100,2))


#
# potencial medios digitales
#

#potencialmdperiodicos	
summary(fulldataset$potencialmdperiodicos)
sd(fulldataset$potencialmdperiodicos)
tbl <- table(fulldataset$potencialmdperiodicos)
cbind(tbl,round(prop.table(tbl)*100,2))


#potencialmdtele	
summary(fulldataset$potencialmdtele)
sd(fulldataset$potencialmdtele)
tbl <- table(fulldataset$potencialmdtele)
cbind(tbl,round(prop.table(tbl)*100,2))


#potencialmdradio	
summary(fulldataset$potencialmdradio)
sd(fulldataset$potencialmdradio)
tbl <- table(fulldataset$potencialmdradio)
cbind(tbl,round(prop.table(tbl)*100,2))


#potencialmdredes	
summary(fulldataset$potencialmdredes)
sd(fulldataset$potencialmdredes)
tbl <- table(fulldataset$potencialmdredes)
cbind(tbl,round(prop.table(tbl)*100,2))

#potencialmdinternet
summary(fulldataset$potencialmdinternet)
sd(fulldataset$potencialmdinternet)
tbl <- table(fulldataset$potencialmdinternet)
cbind(tbl,round(prop.table(tbl)*100,2))


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
tbl <- table(fulldataset$potencialmooc)
cbind(tbl,round(prop.table(tbl)*100,2))


#potencialeducformal	
summary(fulldataset$potencialeducformal)
sd(fulldataset$potencialeducformal)
tbl <- table(fulldataset$potencialeducformal)
cbind(tbl,round(prop.table(tbl)*100,2))

#potencialeducfamiliar	
summary(fulldataset$potencialeducfamiliar)
sd(fulldataset$potencialeducfamiliar)
tbl <- table(fulldataset$potencialeducfamiliar)
cbind(tbl,round(prop.table(tbl)*100,2))


# edad educaccion	
summary(fulldataset$edadeducaccion)
prop.table(table(fulldataset$edadeducaccion))
tbl <- table(fulldataset$edadeducaccion)
cbind(tbl,round(prop.table(tbl)*100,2))



#
# valorar
#

#valorainteligencia	
summary(fulldataset$valorainteligencia)
sd(fulldataset$valorainteligencia)
tbl <- table(fulldataset$valorainteligencia)
cbind(tbl,round(prop.table(tbl)*100,2))

#valoraentusiasmo	
summary(fulldataset$valoraentusiasmo)
sd(fulldataset$valoraentusiasmo)
tbl <- table(fulldataset$valoraentusiasmo)
cbind(tbl,round(prop.table(tbl)*100,2))

#valorainiciativas	
summary(fulldataset$valorainiciativas)
sd(fulldataset$valorainiciativas)
tbl <- table(fulldataset$valorainiciativas)
cbind(tbl,round(prop.table(tbl)*100,2))

#valoradifusion	
summary(fulldataset$valoradifusion)
sd(fulldataset$valoradifusion)
tbl <- table(fulldataset$valoradifusion)
cbind(tbl,round(prop.table(tbl)*100,2))

#valoraconectar
summary(fulldataset$valoraconectar)
sd(fulldataset$valoraconectar)
tbl <- table(fulldataset$valoraconectar)
cbind(tbl,round(prop.table(tbl)*100,2))





####################################################################################
# Summary variables. Basic analysis. POST-QUESTIONNAIRE
####################################################################################
library(ggplot2)

# Gender  Country	edad ... activa  potencialmooc	potencialperiodicos	potencialtv	potenciaradio	potencialredes	potencialinternet	asuntosinteligencia	asuntosentusiasmo	asuntosiniciativas	asuntosdifundir	asuntosconectar	digitaltoolmapa	digitaltoolvideos	digitaltooltextos	digitaltoolforos	digitaltooltaskindiv	digitaltooltaskgroup	digitaltoolfacebook	digitaltooltwitter	iniciado	acciones
postdataset<-read.delim("./data/mlmooces18post.csv", header = TRUE, sep=";")


# Show data set
postdataset
postdataset$Gender
postdataset$edad

#
# demographics
#

#Gender
summary(postdataset$Gender)
prop.table(table(postdataset$Gender))


#Country
summary(postdataset$Country)
prop.table(table(postdataset$Country))

# edad
summary(postdataset$edad)
sd(postdataset$edad)

# ¿Se considera una persona activa en la causa de combatir la Basura Marina?
postdataset$activa
summary(postdataset$activa)
sd(postdataset$activa)
tbl <- table(postdataset$activa)
cbind(tbl,round(prop.table(tbl)*100,2))


# Valore el potencial de los siguientes medios digitales para fomentar acciones reales para combatir la basura marina
#
# potencial medios digitales
#

#potencialmooc  
summary(postdataset$potencialmooc)
sd(postdataset$potencialmooc)
tbl <- table(postdataset$potencialmooc)
cbind(tbl,round(prop.table(tbl)*100,2))

#potencialmdperiodicos  
summary(postdataset$potencialperiodicos)
sd(postdataset$potencialperiodicos)
tbl <- table(postdataset$potencialperiodicos)
cbind(tbl,round(prop.table(tbl)*100,2))


#potencialtv	
summary(postdataset$potencialtv)
sd(postdataset$potencialtv)
tbl <- table(postdataset$potencialtv)
cbind(tbl,round(prop.table(tbl)*100,2))


#potencialradio	
summary(postdataset$potenciaradio)
sd(postdataset$potenciaradio)
tbl <- table(postdataset$potenciaradio)
cbind(tbl,round(prop.table(tbl)*100,2))


#potencialmdredes	
summary(postdataset$potencialredes)
sd(postdataset$potencialredes)
tbl <- table(postdataset$potencialredes)
cbind(tbl,round(prop.table(tbl)*100,2))

#potencialmdinternet
summary(postdataset$potencialinternet)
sd(postdataset$potencialinternet)
tbl <- table(postdataset$potencialinternet)
cbind(tbl,round(prop.table(tbl)*100,2))


#
# valorar
#

#asuntosinteligencia  
summary(postdataset$asuntosinteligencia)
sd(postdataset$asuntosinteligencia)
tbl <- table(postdataset$asuntosinteligencia)
cbind(tbl,round(prop.table(tbl)*100,2))

#entusiasmo	
summary(postdataset$asuntosentusiasmo)
sd(postdataset$asuntosentusiasmo)
tbl <- table(postdataset$asuntosentusiasmo)
cbind(tbl,round(prop.table(tbl)*100,2))

#iniciativas	
summary(postdataset$asuntosiniciativas)
sd(postdataset$asuntosiniciativas)
tbl <- table(postdataset$asuntosiniciativas)
cbind(tbl,round(prop.table(tbl)*100,2))

#asuntosdifundir	
summary(postdataset$asuntosdifundir)
sd(postdataset$asuntosdifundir)
tbl <- table(postdataset$asuntosdifundir)
cbind(tbl,round(prop.table(tbl)*100,2))

#asuntosconectar
summary(postdataset$asuntosconectar)
sd(postdataset$asuntosconectar)
tbl <- table(postdataset$asuntosconectar)
cbind(tbl,round(prop.table(tbl)*100,2))

#
# herramientas digitales del MOOC
#

#digitaltoolmapa  
summary(postdataset$digitaltoolmapa)
sd(postdataset$digitaltoolmapa)
tbl <- table(postdataset$digitaltoolmapa)
cbind(tbl,round(prop.table(tbl)*100,2))

#digitaltoolvideos  
summary(postdataset$digitaltoolvideos)
sd(postdataset$digitaltoolvideos)
tbl <- table(postdataset$digitaltoolvideos)
cbind(tbl,round(prop.table(tbl)*100,2))

#digitaltooltextos  
summary(postdataset$digitaltooltextos)
sd(postdataset$digitaltooltextos)
tbl <- table(postdataset$digitaltooltextos)
cbind(tbl,round(prop.table(tbl)*100,2))

#digitaltoolforos  
summary(postdataset$digitaltoolforos)
sd(postdataset$digitaltoolforos)
tbl <- table(postdataset$digitaltoolforos)
cbind(tbl,round(prop.table(tbl)*100,2))

#digitaltooltaskindiv  
summary(postdataset$digitaltooltaskindiv)
sd(postdataset$digitaltooltaskindiv)
tbl <- table(postdataset$digitaltooltaskindiv)
cbind(tbl,round(prop.table(tbl)*100,2))

#digitaltooltaskgroup  
summary(postdataset$digitaltooltaskgroup)
sd(postdataset$digitaltooltaskgroup)
tbl <- table(postdataset$digitaltooltaskgroup)
cbind(tbl,round(prop.table(tbl)*100,2))

#digitaltoolfacebook  
summary(postdataset$digitaltoolfacebook)
sd(postdataset$digitaltoolfacebook)
tbl <- table(postdataset$digitaltoolfacebook)
cbind(tbl,round(prop.table(tbl)*100,2))

#digitaltooltwitter  
summary(postdataset$digitaltooltwitter)
sd(postdataset$digitaltooltwitter)
tbl <- table(postdataset$digitaltooltwitter)
cbind(tbl,round(prop.table(tbl)*100,2))

#
#iniciado  
#
summary(postdataset$iniciado)
prop.table(table(postdataset$iniciado))
           
           
           
           
           
           
           