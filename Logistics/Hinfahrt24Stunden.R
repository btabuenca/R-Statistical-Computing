####################################################################################
# Scatter chart showing evolution of trucks entering the platform along a day
#  but also clustering by:
#   - Barrier is open/closed
#   - OCR system 
#        1. Did not identified the truck
#        2. Identified the truck
#           - 2a. OCR read correctly
#           - 2b. OCR failed reading the plate
#   Thanks to http://www.cookbook-r.com/Graphs/Scatterplots_(ggplot2)/
#   Muy guapo para pintar dispersion http://www.sthda.com/english/wiki/ggplot2-scatter-plots-quick-start-guide-r-software-and-data-visualization
####################################################################################
library(ggplot2)

# Make some noisily increasing data
# ocr	barrera	hora	segundo
# POLTERGEIST	OPEN	4	3.470

dat<-read.delim("./data/Hinfahrt24Stunden.csv", header = TRUE, sep=";")

summary(dat$ocr)
summary(dat$barrera)



head(dat)
dat

# Paleta de colores
rhg_cols <- c("#f21d79", "#FF0000", "#f27d1d", "#f2c71d", "#acdced", "#028c10")

# Amanece 8:40 > 8.74 
# Oscurece 19:15 > 19.25
ggplot(dat, aes(x=hora, y=segundo/60, shape=barrera, colour = ocr))  +
  scale_colour_manual(values = rhg_cols) +
  scale_shape_manual(values = c(18, 16, 80)) +
  geom_point(size = 3) +
  geom_vline(xintercept = 8.74, colour="black", linetype = "longdash") +
  geom_vline(xintercept = 19.25, colour="black", linetype = "longdash") +
  annotate("text", label = "Amanece", x = 8.74, y = 1, size = 4, colour = "black") +
  annotate("text", label = "Anochece", x = 19.25, y = 1, size = 4, colour = "black") + 
  scale_x_continuous(breaks = 0:23)





# ALTERNATIVAS PARA MARCAR DENSIDAD DE PUN
+ geom_smooth(method=lm, aes(fill=ocr))
+ geom_smooth(method=lm, aes(fill=barrera)) 
+ geom_density_2d()
+ stat_ellipse()


# Mostrando matriculas
ggplot(dat, aes(x=hora, y=segundo, color=ocr, shape=barrera, label=matricula))  +
  geom_text() +
  geom_point() +
  geom_vline(xintercept = 8.74, colour="blue", linetype = "longdash") +
  geom_vline(xintercept = 19.25, colour="blue", linetype = "longdash") 




