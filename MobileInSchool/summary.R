####################################################################################
# 
####################################################################################
library(ggplot2)
#Load file
# nombre;grupo;profesor;comunidad;genero;edad;edadmalumnos;materias;modalidad;movil;a;b;c;d;e;f;g;h;i;j;k;l;m;no;p;q;r;s;tu;v;w;x;y;z;aa;ab;ac;ad;ae;af;ag;ah;ai;aj;ak;al
fulldataset<-read.delim("./data/fulldataset.csv", header = TRUE, sep=";")


# Show data set
fulldataset
fulldataset$nombre
fulldataset$grupo
fulldataset$edadmalumnos


fulldataset$aj
summary(fulldataset$aj)
fulldataset_aj<-read.delim("./data/fulldataset_aj.csv", header = TRUE)
fulldataset_aj
summary(fulldataset_aj)



summary(fulldataset$profesor)

summary(fulldataset$comunidad)

summary(fulldataset$genero)

summary(fulldataset$edad)
sd(fulldataset$edad)


summary(fulldataset$edadmalumnos)
sd(fulldataset$edadmalumnos)

materiasdataset<-read.delim("./data/materias.csv", header = TRUE, sep=";")
summary(materiasdataset$materia)

summary(fulldataset$modalidad)
summary(fulldataset$movil)
summary(fulldataset$a)
summary(fulldataset$b)
summary(fulldataset$d)
summary(fulldataset$e)


# Overall
mean(fulldataset$f)
sd(fulldataset$f)

mean(fulldataset$g)
sd(fulldataset$g)

mean(fulldataset$h)
sd(fulldataset$h)

mean(fulldataset$i)
sd(fulldataset$i)

mean(fulldataset$j)
sd(fulldataset$j)

mean(fulldataset$k)
sd(fulldataset$k)

mean(fulldataset$l)
sd(fulldataset$l)

mean(fulldataset$m)
sd(fulldataset$m)

mean(fulldataset$no)
sd(fulldataset$no)

mean(fulldataset$p)
sd(fulldataset$p)


mean(fulldataset$q)
sd(fulldataset$q)


mean(fulldataset$r)
sd(fulldataset$r)

mean(fulldataset$s)
sd(fulldataset$s)

mean(fulldataset$tu)
sd(fulldataset$tu)
  
mean(fulldataset$v)
sd(fulldataset$v)

mean(fulldataset$w)
sd(fulldataset$w)

mean(fulldataset$x)
sd(fulldataset$x)


mean(fulldataset$y)
sd(fulldataset$y)

mean(fulldataset$z)
sd(fulldataset$z)

mean(fulldataset$aa)
sd(fulldataset$aa)

mean(fulldataset$ab)
sd(fulldataset$ab)

mean(fulldataset$ac)
sd(fulldataset$ac)

mean(fulldataset$ad)
sd(fulldataset$ad)

mean(fulldataset$ae)
sd(fulldataset$ae)

mean(fulldataset$af)
sd(fulldataset$af)

mean(fulldataset$ag)
sd(fulldataset$ag)

mean(fulldataset$ah)
sd(fulldataset$ah)

mean(fulldataset$ai)
sd(fulldataset$ai)

summary(fulldataset$aj)
summary(fulldataset$ak)
summary(fulldataset$al)


# --------------------
## Redes sociales 
# --------------------

# [Facebook]
tbl <- table(fulldataset$f)
cbind(tbl,round(prop.table(tbl)*100,2))

# [Whatsapp]
tbl <- table(fulldataset$g)
cbind(tbl,round(prop.table(tbl)*100,2))

# [Youtube]
tbl <- table(fulldataset$h)
cbind(tbl,round(prop.table(tbl)*100,2))

# [Twitter]
tbl <- table(fulldataset$i)
cbind(tbl,round(prop.table(tbl)*100,2))

# [Google +]
tbl <- table(fulldataset$j)
cbind(tbl,round(prop.table(tbl)*100,2))

# [LinkedIn]
tbl <- table(fulldataset$k)
cbind(tbl,round(prop.table(tbl)*100,2))

# [Instagram]
tbl <- table(fulldataset$l)
cbind(tbl,round(prop.table(tbl)*100,2))

# [Soptify]
tbl <- table(fulldataset$m)
cbind(tbl,round(prop.table(tbl)*100,2))

# [Tuenti]
tbl <- table(fulldataset$no)
cbind(tbl,round(prop.table(tbl)*100,2))

# [Pinterest]
tbl <- table(fulldataset$p)
cbind(tbl,round(prop.table(tbl)*100,2))

# [Flickr]
tbl <- table(fulldataset$q)
cbind(tbl,round(prop.table(tbl)*100,2))


## Riesgos

# r [Acoso (Ciberbullying...)]
tbl <- table(fulldataset$r)
cbind(tbl,round(prop.table(tbl)*100,2))

# s [Distracción y pérdida del foco de atención]
tbl <- table(fulldataset$s)
cbind(tbl,round(prop.table(tbl)*100,2))

# tu[Sobreexposición en internet]
tbl <- table(fulldataset$tu)
cbind(tbl,round(prop.table(tbl)*100,2))

# v [Dejar de lado recursos ‘tradicionales’, como la lectura o la expresión artística]
tbl <- table(fulldataset$v)
cbind(tbl,round(prop.table(tbl)*100,2))

# w [Incompetencia digital del docente (Destreza en el manejo de móviles y aplicaciones)]
tbl <- table(fulldataset$w)
cbind(tbl,round(prop.table(tbl)*100,2))

# x [Dificultad para encontrar un consenso entre profesores sobre cómo utilizar el móvil]
tbl <- table(fulldataset$x)
cbind(tbl,round(prop.table(tbl)*100,2))



## Ventajas

# y [Adaptación a la sociedad y ritmo tecnológico]	
tbl <- table(fulldataset$y)
cbind(tbl,round(prop.table(tbl)*100,2))

# z [Fines pedagógicos: diccionario, calculadora, brújula u otras aplicaciones.]	
tbl <- table(fulldataset$z)
cbind(tbl,round(prop.table(tbl)*100,2))

# aa [Planificación de tareas]	
tbl <- table(fulldataset$aa)
cbind(tbl,round(prop.table(tbl)*100,2))

# ab [Identificar y denunciar casos de acoso]	
tbl <- table(fulldataset$ab)
cbind(tbl,round(prop.table(tbl)*100,2))

# ac [Comunicación entre alumnos]	
tbl <- table(fulldataset$ac)
cbind(tbl,round(prop.table(tbl)*100,2))

# ad [Comunicación entre profesor y alumno]	
tbl <- table(fulldataset$ad)
cbind(tbl,round(prop.table(tbl)*100,2))

# ae [Compartir buenas prácticas]	
tbl <- table(fulldataset$ae)
cbind(tbl,round(prop.table(tbl)*100,2))

# af [Juegos para atraer el interés del alumnado]	
tbl <- table(fulldataset$af)
cbind(tbl,round(prop.table(tbl)*100,2))

# ag [Personalización del aprendizaje por parte del alumno]	
tbl <- table(fulldataset$ag)
cbind(tbl,round(prop.table(tbl)*100,2))

# ah [Potenciar la participación del alumnado]	
tbl <- table(fulldataset$ah)
cbind(tbl,round(prop.table(tbl)*100,2))

# ai [Tests para obtener retroalimentación del alumnado ]
tbl <- table(fulldataset$ai)
cbind(tbl,round(prop.table(tbl)*100,2))




#------




# By group
sd <- aggregate(utilidad ~ grupo, datasetNoise, sd)
sd

me <- aggregate(utilidad ~ grupo, datasetNoise, mean)
me


#
# Boxplot
#


# Edad de los profesores
boxplot(fulldataset$edad)
summary(fulldataset$edad)


# Solo la edad
# ¿Cuál consideras que es la edad apropiada para dar un teléfono con Internet a un niño?
boxplot(fulldataset$al)
summary(fulldataset$al)

# Boxplot con edad de profes combinado con edad alumnosmoviles -> boxplotEdadMovil.PNG
datasetedades<-read.delim("./data/datasetedades.csv", header = TRUE, sep=";")
library(ggplot2)
ggplot(datasetedades, aes(x=Edad, y=Años, fill=Edad)) + geom_boxplot() + scale_y_continuous(breaks = c(0,8,10,12,14,16,18,20,22,24,26,28,30,32,34,36,38,40,42,44,46,48)) + coord_flip() + scale_fill_manual(values = c("darkblue", "grey")) + geom_hline(aes(yintercept=14), color="red", linetype="dashed") + geom_hline(aes(yintercept=32), color="red", linetype="dashed")



# Por género
library(ggplot2)
ggplot(fulldataset, aes(x=genero, y=al, fill=genero)) + geom_boxplot() + guides(fill=FALSE) + coord_flip()
ggplot(fulldataset, aes(x=genero, y=al, fill=genero)) + geom_boxplot() + guides(fill=FALSE) 

means <- aggregate(al ~  genero, fulldataset, mean)
ggplot(fulldataset, aes(x=genero, y=al, fill=genero)) + geom_boxplot() + guides(fill=FALSE) +
 stat_summary(fun.y=mean, colour="darkred", geom="point", 
               shape=18, size=3,show_guide = FALSE) + geom_text(data = means, aes(label = round(al, 2), y = al + 1))



# Por tipo de profesor (boxPlotByProfesor.png)
ggplot(fulldataset, aes(x=profesor, y=al, fill=profesor)) + geom_boxplot()

means <- aggregate(al ~  profesor, fulldataset, mean)
ggplot(fulldataset, aes(x=profesor, y=al, fill=profesor)) + geom_boxplot() + guides(fill=FALSE) + coord_flip() +
  stat_summary(fun.y=mean, colour="darkred", geom="point", 
               shape=18, size=3,show_guide = FALSE) + geom_text(data = means, aes(label = round(al, 2), y = al + 1))


# Por comunidad
means <- aggregate(al ~  comunidad, fulldataset, mean)
ggplot(fulldataset, aes(x=comunidad, y=al, fill=comunidad)) + geom_boxplot() + guides(fill=FALSE) + coord_flip() +
  stat_summary(fun.y=mean, colour="darkred", geom="point", 
               shape=18, size=3,show_guide = FALSE) + geom_text(data = means, aes(label = round(al, 2), y = al + 1))


####################################################################################
library(ggplot2)
#Load file
# RedSocial;Predisposicion
fulldatasetRS<-read.delim("./data/datasetredessociales.csv", header = TRUE, sep=";")
ggplot(fulldatasetRS, aes(x=RedSocial, y=Predisposicion, fill=RedSocial)) + geom_boxplot() + guides(fill=FALSE) + coord_flip()


means <- aggregate(Predisposicion ~  RedSocial, fulldatasetRS, mean)
means
ggplot(fulldatasetRS, aes(x=RedSocial, y=Predisposicion, fill=RedSocial)) + 
  geom_boxplot() + 
  guides(fill=FALSE) +
  coord_flip() +
  stat_summary(fun.y=mean, colour="red", geom="point", size=2) + 
  geom_text(data = means, aes(label = round(Predisposicion, 2), y = Predisposicion -0.1))
