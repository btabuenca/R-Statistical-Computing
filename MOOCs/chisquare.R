################################################
# Chi-square of independence in R
################################################
# http://www.sthda.com/english/wiki/chi-square-test-of-independence-in-r
library("gplots")


# Load file 
# genero;pais;edad;hogar;estudios;empleo;conocermoocs;moocsrealizados;moocstrabajo;moocquierocontactos;moocquierocompartir;moocquieropersonas;moocquieroorganizaciones;moocquierootro;activo;potencialmdperiodicos;potencialmdtele;potencialmdradio;potencialmdredes;potencialmdinternet;perfilperiodicos;perfiltelevision;perfilradio;perfilredes;perfilinternet;potencialmooc;potencialeducformal;potencialeducfamiliar;edadeducaccion;valorainteligencia;valoraentusiasmo;valorainiciativas;valoradifusion;valoraconectar
fulldataset<-read.delim("./data/resultset.csv", header = TRUE, sep=";")

# perfilperiodicos;perfiltelevision;perfilradio;perfilredes;perfilinternet;
perfil<-fulldataset[, c(21, 22, 23, 24, 25)]
perfil


# 1. convert the data as a table
dt <- as.table(as.matrix(housetasks))
# 2. Graph
balloonplot(t(perfil), main ="housetasks", xlab ="", ylab="", label = FALSE, show.margins = FALSE)



# Create an Example Data Frame Containing Car x Color data
carnames <- c("bmw","renault","mercedes","seat")
carcolors <- c("red","white","silver","green")
datavals <- round(rnorm(16, mean=100, sd=60),1)
datavals
data <- data.frame(Car=rep(carnames,4),
                   Color=rep(carcolors, c(4,4,4,4) ),
                   Value=datavals )
# show the data
data
# generate balloon plot with default scaling
balloonplot( data$Car, data$Color, data$Value)



carnames <- c("con","col","pro")
carcolor <- c("pe","te","ra","re","in")
datavals <- c("1","2","3","4","5","6","7","8","9","10","11","12","13","14","15")

data <- data.frame(Car=rep(carnames,3),
                   Color=rep(carcolor, 5 ),
                   Value=datavals )

