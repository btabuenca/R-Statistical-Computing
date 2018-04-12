####################################################################################
# Evolution Temperature during 2 days
####################################################################################
library(ggplot2)
#Load file

#5077JTJ_1_20180205.csv
datasetTemp_1<-read.delim("./data/5077JTJ_1_20180205.csv", header = TRUE, sep=";")
datasetTemp_2<-read.delim("./data/5077JTJ_2_20180205.csv", header = TRUE, sep=";")
datasetTemp_3<-read.delim("./data/5077JTJ_3_20180205.csv", header = TRUE, sep=";")
datasetTemp_4<-read.delim("./data/5077JTJ_4_20180205.csv", header = TRUE, sep=";")


# Show data set
datasetTemp_1
datasetTemp_1$sensor
datasetTemp_1$total_minutos
datasetTemp_1$temperatura


# 1
a <- ggplot(datasetTemp_1, aes(x=total_minutos, y=temperatura)) + geom_point(size=2, shape=19, colour="blue") + theme(axis.title.x=element_blank(), axis.text.x=element_blank(), axis.ticks.x=element_blank()) + ggtitle("5077JTJ_1")
b <- a + geom_vline(xintercept=60*0, linetype="dashed", colour="grey") + annotate("text", x = 60*0, y = min(datasetTemp_1$temperatura)-3, label = "0")
c <- b + geom_vline(xintercept=60*1, linetype="dashed", colour="grey") + annotate("text", x = 60*1, y = min(datasetTemp_1$temperatura)-3, label = "1")
d <- c + geom_vline(xintercept=60*2, linetype="dashed", colour="grey") + annotate("text", x = 60*2, y = min(datasetTemp_1$temperatura)-3, label = "2")
e <- d + geom_vline(xintercept=60*3, linetype="dashed", colour="grey") + annotate("text", x = 60*3, y = min(datasetTemp_1$temperatura)-3, label = "3")
f <- e + geom_vline(xintercept=60*4, linetype="dashed", colour="grey") + annotate("text", x = 60*4, y = min(datasetTemp_1$temperatura)-3, label = "4")
g <- f + geom_vline(xintercept=60*5, linetype="dashed", colour="grey") + annotate("text", x = 60*5, y = min(datasetTemp_1$temperatura)-3, label = "5")
h <- g + geom_vline(xintercept=60*6, linetype="dashed", colour="grey") + annotate("text", x = 60*6, y = min(datasetTemp_1$temperatura)-3, label = "6")
i <- h + geom_vline(xintercept=60*7, linetype="dashed", colour="grey") + annotate("text", x = 60*7, y = min(datasetTemp_1$temperatura)-3, label = "7")
j <- i + geom_vline(xintercept=60*8, linetype="dashed", colour="grey") + annotate("text", x = 60*8, y = min(datasetTemp_1$temperatura)-3, label = "8")
k <- j + geom_vline(xintercept=60*9, linetype="dashed", colour="grey") + annotate("text", x = 60*9, y = min(datasetTemp_1$temperatura)-3, label = "9")
l <- k + geom_vline(xintercept=60*10, linetype="dashed", colour="grey") + annotate("text", x = 60*10, y = min(datasetTemp_1$temperatura)-3, label = "10")
m <- l + geom_vline(xintercept=60*11, linetype="dashed", colour="grey") + annotate("text", x = 60*11, y = min(datasetTemp_1$temperatura)-3, label = "11")
n <- m + geom_vline(xintercept=60*12, linetype="dashed", colour="grey") + annotate("text", x = 60*12, y = min(datasetTemp_1$temperatura)-3, label = "12")
o <- n + geom_vline(xintercept=60*13, linetype="dashed", colour="grey") + annotate("text", x = 60*13, y = min(datasetTemp_1$temperatura)-3, label = "13")
p <- o + geom_vline(xintercept=60*14, linetype="dashed", colour="grey") + annotate("text", x = 60*14, y = min(datasetTemp_1$temperatura)-3, label = "14")
q <- p + geom_vline(xintercept=60*15, linetype="dashed", colour="grey") + annotate("text", x = 60*15, y = min(datasetTemp_1$temperatura)-3, label = "15")
r <- q + geom_vline(xintercept=60*16, linetype="dashed", colour="grey") + annotate("text", x = 60*16, y = min(datasetTemp_1$temperatura)-3, label = "16")
s <- r + geom_vline(xintercept=60*17, linetype="dashed", colour="grey") + annotate("text", x = 60*17, y = min(datasetTemp_1$temperatura)-3, label = "17")
t <- s + geom_vline(xintercept=60*18, linetype="dashed", colour="grey") + annotate("text", x = 60*18, y = min(datasetTemp_1$temperatura)-3, label = "18")
u <- t + geom_vline(xintercept=60*19, linetype="dashed", colour="grey") + annotate("text", x = 60*19, y = min(datasetTemp_1$temperatura)-3, label = "19")
v <- u + geom_vline(xintercept=60*20, linetype="dashed", colour="grey") + annotate("text", x = 60*20, y = min(datasetTemp_1$temperatura)-3, label = "20")
w <- v + geom_vline(xintercept=60*21, linetype="dashed", colour="grey") + annotate("text", x = 60*21, y = min(datasetTemp_1$temperatura)-3, label = "21")
x <- w + geom_vline(xintercept=60*22, linetype="dashed", colour="grey") + annotate("text", x = 60*22, y = min(datasetTemp_1$temperatura)-3, label = "22")
y <- x + geom_vline(xintercept=60*23, linetype="dashed", colour="grey") + annotate("text", x = 60*23, y = min(datasetTemp_1$temperatura)-3, label = "23")
z <- y + annotate("rect", xmin = 81, xmax = 258, ymin = min(datasetTemp_1$temperatura), ymax = max(datasetTemp_1$temperatura), alpha = .2)
aa <- z + annotate("rect", xmin = 393, xmax = 303, ymin = min(datasetTemp_1$temperatura), ymax = max(datasetTemp_1$temperatura), alpha = .2)
ab <- aa + annotate("rect", xmin = 438, xmax = 633, ymin = min(datasetTemp_1$temperatura), ymax = max(datasetTemp_1$temperatura), alpha = .2)
ac <- ab + annotate("rect", xmin = 678, xmax = 874, ymin = min(datasetTemp_1$temperatura), ymax = max(datasetTemp_1$temperatura), alpha = .2)
ad <- ac + annotate("rect", xmin = 1340, xmax = 1425, ymin = min(datasetTemp_1$temperatura), ymax = max(datasetTemp_1$temperatura), alpha = .2)
ad



# 2
a <- ggplot(datasetTemp_2, aes(x=total_minutos, y=temperatura)) + geom_point(size=2, shape=19, colour="orange") + theme(axis.title.x=element_blank(), axis.text.x=element_blank(), axis.ticks.x=element_blank()) + ggtitle("5077JTJ_2")
b <- a + geom_vline(xintercept=60*0, linetype="dashed", colour="grey") + annotate("text", x = 60*0, y = min(datasetTemp_2$temperatura)-3, label = "0")
c <- b + geom_vline(xintercept=60*1, linetype="dashed", colour="grey") + annotate("text", x = 60*1, y = min(datasetTemp_2$temperatura)-3, label = "1")
d <- c + geom_vline(xintercept=60*2, linetype="dashed", colour="grey") + annotate("text", x = 60*2, y = min(datasetTemp_2$temperatura)-3, label = "2")
e <- d + geom_vline(xintercept=60*3, linetype="dashed", colour="grey") + annotate("text", x = 60*3, y = min(datasetTemp_2$temperatura)-3, label = "3")
f <- e + geom_vline(xintercept=60*4, linetype="dashed", colour="grey") + annotate("text", x = 60*4, y = min(datasetTemp_2$temperatura)-3, label = "4")
g <- f + geom_vline(xintercept=60*5, linetype="dashed", colour="grey") + annotate("text", x = 60*5, y = min(datasetTemp_2$temperatura)-3, label = "5")
h <- g + geom_vline(xintercept=60*6, linetype="dashed", colour="grey") + annotate("text", x = 60*6, y = min(datasetTemp_2$temperatura)-3, label = "6")
i <- h + geom_vline(xintercept=60*7, linetype="dashed", colour="grey") + annotate("text", x = 60*7, y = min(datasetTemp_2$temperatura)-3, label = "7")
j <- i + geom_vline(xintercept=60*8, linetype="dashed", colour="grey") + annotate("text", x = 60*8, y = min(datasetTemp_2$temperatura)-3, label = "8")
k <- j + geom_vline(xintercept=60*9, linetype="dashed", colour="grey") + annotate("text", x = 60*9, y = min(datasetTemp_2$temperatura)-3, label = "9")
l <- k + geom_vline(xintercept=60*10, linetype="dashed", colour="grey") + annotate("text", x = 60*10, y = min(datasetTemp_2$temperatura)-3, label = "10")
m <- l + geom_vline(xintercept=60*11, linetype="dashed", colour="grey") + annotate("text", x = 60*11, y = min(datasetTemp_2$temperatura)-3, label = "11")
n <- m + geom_vline(xintercept=60*12, linetype="dashed", colour="grey") + annotate("text", x = 60*12, y = min(datasetTemp_2$temperatura)-3, label = "12")
o <- n + geom_vline(xintercept=60*13, linetype="dashed", colour="grey") + annotate("text", x = 60*13, y = min(datasetTemp_2$temperatura)-3, label = "13")
p <- o + geom_vline(xintercept=60*14, linetype="dashed", colour="grey") + annotate("text", x = 60*14, y = min(datasetTemp_2$temperatura)-3, label = "14")
q <- p + geom_vline(xintercept=60*15, linetype="dashed", colour="grey") + annotate("text", x = 60*15, y = min(datasetTemp_2$temperatura)-3, label = "15")
r <- q + geom_vline(xintercept=60*16, linetype="dashed", colour="grey") + annotate("text", x = 60*16, y = min(datasetTemp_2$temperatura)-3, label = "16")
s <- r + geom_vline(xintercept=60*17, linetype="dashed", colour="grey") + annotate("text", x = 60*17, y = min(datasetTemp_2$temperatura)-3, label = "17")
t <- s + geom_vline(xintercept=60*18, linetype="dashed", colour="grey") + annotate("text", x = 60*18, y = min(datasetTemp_2$temperatura)-3, label = "18")
u <- t + geom_vline(xintercept=60*19, linetype="dashed", colour="grey") + annotate("text", x = 60*19, y = min(datasetTemp_2$temperatura)-3, label = "19")
v <- u + geom_vline(xintercept=60*20, linetype="dashed", colour="grey") + annotate("text", x = 60*20, y = min(datasetTemp_2$temperatura)-3, label = "20")
w <- v + geom_vline(xintercept=60*21, linetype="dashed", colour="grey") + annotate("text", x = 60*21, y = min(datasetTemp_2$temperatura)-3, label = "21")
x <- w + geom_vline(xintercept=60*22, linetype="dashed", colour="grey") + annotate("text", x = 60*22, y = min(datasetTemp_2$temperatura)-3, label = "22")
y <- x + geom_vline(xintercept=60*23, linetype="dashed", colour="grey") + annotate("text", x = 60*23, y = min(datasetTemp_2$temperatura)-3, label = "23")
z <- y + annotate("rect", xmin = 485, xmax = 563, ymin = min(datasetTemp_2$temperatura), ymax = max(datasetTemp_2$temperatura), alpha = .2)
aa <- z + annotate("rect", xmin = 847, xmax = 920, ymin = min(datasetTemp_2$temperatura), ymax = max(datasetTemp_2$temperatura), alpha = .2)
aa



# 3
a <- ggplot(datasetTemp_3, aes(x=total_minutos, y=temperatura)) + geom_point(size=2, shape=19, colour="red") + theme(axis.title.x=element_blank(), axis.text.x=element_blank(), axis.ticks.x=element_blank()) + ggtitle("5077JTJ_3")
b <- a + geom_vline(xintercept=60*0, linetype="dashed", colour="grey") + annotate("text", x = 60*0, y = min(datasetTemp_3$temperatura)-3, label = "0")
c <- b + geom_vline(xintercept=60*1, linetype="dashed", colour="grey") + annotate("text", x = 60*1, y = min(datasetTemp_3$temperatura)-3, label = "1")
d <- c + geom_vline(xintercept=60*2, linetype="dashed", colour="grey") + annotate("text", x = 60*2, y = min(datasetTemp_3$temperatura)-3, label = "2")
e <- d + geom_vline(xintercept=60*3, linetype="dashed", colour="grey") + annotate("text", x = 60*3, y = min(datasetTemp_3$temperatura)-3, label = "3")
f <- e + geom_vline(xintercept=60*4, linetype="dashed", colour="grey") + annotate("text", x = 60*4, y = min(datasetTemp_3$temperatura)-3, label = "4")
g <- f + geom_vline(xintercept=60*5, linetype="dashed", colour="grey") + annotate("text", x = 60*5, y = min(datasetTemp_3$temperatura)-3, label = "5")
h <- g + geom_vline(xintercept=60*6, linetype="dashed", colour="grey") + annotate("text", x = 60*6, y = min(datasetTemp_3$temperatura)-3, label = "6")
i <- h + geom_vline(xintercept=60*7, linetype="dashed", colour="grey") + annotate("text", x = 60*7, y = min(datasetTemp_3$temperatura)-3, label = "7")
j <- i + geom_vline(xintercept=60*8, linetype="dashed", colour="grey") + annotate("text", x = 60*8, y = min(datasetTemp_3$temperatura)-3, label = "8")
k <- j + geom_vline(xintercept=60*9, linetype="dashed", colour="grey") + annotate("text", x = 60*9, y = min(datasetTemp_3$temperatura)-3, label = "9")
l <- k + geom_vline(xintercept=60*10, linetype="dashed", colour="grey") + annotate("text", x = 60*10, y = min(datasetTemp_3$temperatura)-3, label = "10")
m <- l + geom_vline(xintercept=60*11, linetype="dashed", colour="grey") + annotate("text", x = 60*11, y = min(datasetTemp_3$temperatura)-3, label = "11")
n <- m + geom_vline(xintercept=60*12, linetype="dashed", colour="grey") + annotate("text", x = 60*12, y = min(datasetTemp_3$temperatura)-3, label = "12")
o <- n + geom_vline(xintercept=60*13, linetype="dashed", colour="grey") + annotate("text", x = 60*13, y = min(datasetTemp_3$temperatura)-3, label = "13")
p <- o + geom_vline(xintercept=60*14, linetype="dashed", colour="grey") + annotate("text", x = 60*14, y = min(datasetTemp_3$temperatura)-3, label = "14")
q <- p + geom_vline(xintercept=60*15, linetype="dashed", colour="grey") + annotate("text", x = 60*15, y = min(datasetTemp_3$temperatura)-3, label = "15")
r <- q + geom_vline(xintercept=60*16, linetype="dashed", colour="grey") + annotate("text", x = 60*16, y = min(datasetTemp_3$temperatura)-3, label = "16")
s <- r + geom_vline(xintercept=60*17, linetype="dashed", colour="grey") + annotate("text", x = 60*17, y = min(datasetTemp_3$temperatura)-3, label = "17")
t <- s + geom_vline(xintercept=60*18, linetype="dashed", colour="grey") + annotate("text", x = 60*18, y = min(datasetTemp_3$temperatura)-3, label = "18")
u <- t + geom_vline(xintercept=60*19, linetype="dashed", colour="grey") + annotate("text", x = 60*19, y = min(datasetTemp_3$temperatura)-3, label = "19")
v <- u + geom_vline(xintercept=60*20, linetype="dashed", colour="grey") + annotate("text", x = 60*20, y = min(datasetTemp_3$temperatura)-3, label = "20")
w <- v + geom_vline(xintercept=60*21, linetype="dashed", colour="grey") + annotate("text", x = 60*21, y = min(datasetTemp_3$temperatura)-3, label = "21")
x <- w + geom_vline(xintercept=60*22, linetype="dashed", colour="grey") + annotate("text", x = 60*22, y = min(datasetTemp_3$temperatura)-3, label = "22")
y <- x + geom_vline(xintercept=60*23, linetype="dashed", colour="grey") + annotate("text", x = 60*23, y = min(datasetTemp_3$temperatura)-3, label = "23")
z <- y + annotate("rect", xmin = 183, xmax = 282, ymin = min(datasetTemp_3$temperatura), ymax = max(datasetTemp_3$temperatura), alpha = .2)
aa <- z + annotate("rect", xmin = 554, xmax = 646, ymin = min(datasetTemp_3$temperatura), ymax = max(datasetTemp_3$temperatura), alpha = .2)
ab <- aa + annotate("rect", xmin = 748, xmax = 837, ymin = min(datasetTemp_3$temperatura), ymax = max(datasetTemp_3$temperatura), alpha = .2)
ac <- ab + annotate("rect", xmin = 939, xmax = 1080, ymin = min(datasetTemp_3$temperatura), ymax = max(datasetTemp_3$temperatura), alpha = .2)
ad <- ac + annotate("rect", xmin = 0, xmax = 138, ymin = min(datasetTemp_3$temperatura), ymax = max(datasetTemp_3$temperatura), alpha = .2)
ad


# 4
a <- ggplot(datasetTemp_4, aes(x=total_minutos, y=temperatura)) + geom_point(size=2, shape=19, colour="green") + theme(axis.title.x=element_blank(), axis.text.x=element_blank(), axis.ticks.x=element_blank()) + ggtitle("5077JTJ_4")
b <- a + geom_vline(xintercept=60*0, linetype="dashed", colour="grey") + annotate("text", x = 60*0, y = min(datasetTemp_4$temperatura)-3, label = "0")
c <- b + geom_vline(xintercept=60*1, linetype="dashed", colour="grey") + annotate("text", x = 60*1, y = min(datasetTemp_4$temperatura)-3, label = "1")
d <- c + geom_vline(xintercept=60*2, linetype="dashed", colour="grey") + annotate("text", x = 60*2, y = min(datasetTemp_4$temperatura)-3, label = "2")
e <- d + geom_vline(xintercept=60*3, linetype="dashed", colour="grey") + annotate("text", x = 60*3, y = min(datasetTemp_4$temperatura)-3, label = "3")
f <- e + geom_vline(xintercept=60*4, linetype="dashed", colour="grey") + annotate("text", x = 60*4, y = min(datasetTemp_4$temperatura)-3, label = "4")
g <- f + geom_vline(xintercept=60*5, linetype="dashed", colour="grey") + annotate("text", x = 60*5, y = min(datasetTemp_4$temperatura)-3, label = "5")
h <- g + geom_vline(xintercept=60*6, linetype="dashed", colour="grey") + annotate("text", x = 60*6, y = min(datasetTemp_4$temperatura)-3, label = "6")
i <- h + geom_vline(xintercept=60*7, linetype="dashed", colour="grey") + annotate("text", x = 60*7, y = min(datasetTemp_4$temperatura)-3, label = "7")
j <- i + geom_vline(xintercept=60*8, linetype="dashed", colour="grey") + annotate("text", x = 60*8, y = min(datasetTemp_4$temperatura)-3, label = "8")
k <- j + geom_vline(xintercept=60*9, linetype="dashed", colour="grey") + annotate("text", x = 60*9, y = min(datasetTemp_4$temperatura)-3, label = "9")
l <- k + geom_vline(xintercept=60*10, linetype="dashed", colour="grey") + annotate("text", x = 60*10, y = min(datasetTemp_4$temperatura)-3, label = "10")
m <- l + geom_vline(xintercept=60*11, linetype="dashed", colour="grey") + annotate("text", x = 60*11, y = min(datasetTemp_4$temperatura)-3, label = "11")
n <- m + geom_vline(xintercept=60*12, linetype="dashed", colour="grey") + annotate("text", x = 60*12, y = min(datasetTemp_4$temperatura)-3, label = "12")
o <- n + geom_vline(xintercept=60*13, linetype="dashed", colour="grey") + annotate("text", x = 60*13, y = min(datasetTemp_4$temperatura)-3, label = "13")
p <- o + geom_vline(xintercept=60*14, linetype="dashed", colour="grey") + annotate("text", x = 60*14, y = min(datasetTemp_4$temperatura)-3, label = "14")
q <- p + geom_vline(xintercept=60*15, linetype="dashed", colour="grey") + annotate("text", x = 60*15, y = min(datasetTemp_4$temperatura)-3, label = "15")
r <- q + geom_vline(xintercept=60*16, linetype="dashed", colour="grey") + annotate("text", x = 60*16, y = min(datasetTemp_4$temperatura)-3, label = "16")
s <- r + geom_vline(xintercept=60*17, linetype="dashed", colour="grey") + annotate("text", x = 60*17, y = min(datasetTemp_4$temperatura)-3, label = "17")
t <- s + geom_vline(xintercept=60*18, linetype="dashed", colour="grey") + annotate("text", x = 60*18, y = min(datasetTemp_4$temperatura)-3, label = "18")
u <- t + geom_vline(xintercept=60*19, linetype="dashed", colour="grey") + annotate("text", x = 60*19, y = min(datasetTemp_4$temperatura)-3, label = "19")
v <- u + geom_vline(xintercept=60*20, linetype="dashed", colour="grey") + annotate("text", x = 60*20, y = min(datasetTemp_4$temperatura)-3, label = "20")
w <- v + geom_vline(xintercept=60*21, linetype="dashed", colour="grey") + annotate("text", x = 60*21, y = min(datasetTemp_4$temperatura)-3, label = "21")
x <- w + geom_vline(xintercept=60*22, linetype="dashed", colour="grey") + annotate("text", x = 60*22, y = min(datasetTemp_4$temperatura)-3, label = "22")
y <- x + geom_vline(xintercept=60*23, linetype="dashed", colour="grey") + annotate("text", x = 60*23, y = min(datasetTemp_4$temperatura)-3, label = "23")
z <- y + annotate("rect", xmin = 113, xmax = 380, ymin = min(datasetTemp_4$temperatura), ymax = max(datasetTemp_4$temperatura), alpha = .2)
aa <- z + annotate("rect", xmin = 425, xmax = 626, ymin = min(datasetTemp_4$temperatura), ymax = max(datasetTemp_4$temperatura), alpha = .2)
ab <- aa + annotate("rect", xmin = 723, xmax = 781, ymin = min(datasetTemp_4$temperatura), ymax = max(datasetTemp_4$temperatura), alpha = .2)
ad


