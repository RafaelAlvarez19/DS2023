###Alvarez Rafael Facundo###

rm(list = ls())

getwd()
setwd("C:/Users/Rafael/Documents/DS2023")

###Ejercicio 1###
4+5
27-11
3*9
23/4
23%/%4
23%%4
2/3+4/7
sqrt(36)
sqrt(79)
sin(pi)
sin(3.14)

###Ejercicio 2###
x <- 144
y <- 27
z <- (sqrt(x)) / (y^(1/3))
z

ab <- (abs(356-366)) * (pi)
ab

###Ejercicio 3###

a <- 5
b <- 4
c <- a + b
a <- b * c
b <- (c - a)^2
c <- a * b
##a = 36; b = 729; c = 26244##

###Ejercicio 4###

x <- c(1,3,5,7,9)
y <- c(2,3,5,7,11,13)

x1<- x+1
y1<- y+1
y2<- y*3

xy<- length(x) + length(y)
xy

xyz<- x+y
xyz

###Ejercicio 5###
v <- seq(from=1, to= 10)

w <- seq(from=10, to=1)

a <- seq(1,10,2)

b <- seq(1,10, length=6)

c <- rep(5,10)

d<- rep(seq(1,5),rep(5,5))
d

meses <- c("Enero","Febrero","Marzo","Abril","Mayo","Junio","Julio","Agosto","Septiembre","Noviembre","Diciembre")
str(meses)
mode(meses)
length(meses)

###Ejercicio 6###

x <- seq(from=2,to=10, by=2)

y <- seq(from = 9, to =0, by =-1)

z <- seq(from=1 , to=15, length=7)

r <- rep(4,10)

d <- c("Domingo", "Lunes", "Martes",  "Miercoles", "Jueves", "Viernes",  "Sabado")
length(d)
d[3]

###Ejercicio 7###

mi_lista <- list()
mi_lista$lugar <- "Granja"
mi_lista$nombre <-"La vaca Lola"
mi_lista$numero.animales <- 6
mi_lista$animales <- c( "Gallo","Gallina","Conejo","Caballo","Perro","Vaca")
mi_lista$cantidad <- c(1,8,6,4,2,1)

###Ejercicio 8###
edad <- sample(0:20,10,replace=TRUE,prob = NULL)
edad

sexo <- sample(c("hombre","mujer"),10, replace=TRUE)
sexo

enfermo <- sample(c(TRUE,FALSE),10,replace=TRUE)
enfermo

datos <- data.frame(edad,sexo,enfermo)
datos

###Ejercicio 9###

adolescentes <- list()
adolescentes$id <- c(101,105,108,109,116,120,132,148)
adolescentes$edad <- c(17,16,14,18,12,14,15,17)
adolescentes$genero <- c("M","H","H","H","M",NA,"H","M")
adolescentes$fuma <- c(T,T,F,F,F,T,F,T)
adolescentes$edad_ini <- c(16,16,NA,NA,NA,14,NA,15)
adolescentes$curso <- c(6,5,3,5,1,2,3,5)
names(adolescentes)
adolescentes_dim <- length(adolescentes)
str(adolescentes)
head(adolescentes)
tail(adolescentes)

###Ejercicio 10###

adolescentes[c("fuma","edad_ini")]

adolescentes[1:2:6:7:8]
fumadores <- adolescentes[adolescentes$fuma == TRUE]
class(fumadores)
fumadores
fumadores[1:3,c("id","edad","genero","curso")]
fumadores$id<-NULL
names(fumadores)

