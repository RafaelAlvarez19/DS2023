####Alvarez Rafael Facundo####

rm(list = ls())
getwd()
setwd("~/DS2023/R/Practicos R")

####Librerias####
library(tidyverse)
library(dplyr)
library(readxl) #Libreria para leer y manipular excels

####1####

data_banco<- read_excel("Data_Banco.xlsx", sheet=1)
data_sucursal<- read_excel("Data_Banco.xlsx",sheet = 2)
data_cajero<- read_excel("Data_Banco.xlsx",sheet=3)

####2####

str(data_banco)

####3####

head(data_sucursal)
####4####
banco<-names(data_banco)
sucursal<- names(data_sucursal)
cajeros<- names(data_cajero)
paste(banco, sucursal, cajeros)

####5####
data_banco<- as_tibble(data_banco)
data_banco[c(4,5)]#leemos solo columna transacc y tiempo servicio

####6####
info<- data_banco %>%select(1,3,4,5,6,7) #Utilizamos la funcion select para 
                                        #elegir columnas
####7####
class(data_banco$Satisfaccion) #utilizamos str para ver el tipo de dato
data_banco$Satisfaccion<- as.factor(data_banco$Satisfaccion)#convertimos a factor
levels(data_banco$Satisfaccion)

####8####
data_banco_filtrado<- data_banco %>% filter(data_banco$Sucursal == 62)

####9####
data_banco_filtra2<- data_banco %>% filter(data_banco$Sucursal == 62, data_banco$Tiempo_Servicio_seg > 120)

####10####
data_banco_filtr3<- data_banco %>% filter(data_banco$Sucursal== 62, data_banco$Tiempo_Servicio_seg > 120, data_banco$Satisfaccion == "Muy Buena")

####11####
class(data_banco$Satisfaccion)
data_banco %>% arrange(data_banco$Satisfaccion)

####12####
data_banco$Transaccion<- as.factor(data_banco$Transaccion)
class(data_banco$Transaccion)
data_banco %>% arrange(data_banco$Transaccion, desc(data_banco$Tiempo_Servicio_seg)) 
data_banco$Transaccion<- as.character((data_banco$Transaccion))

####13####
data_banco %>% mutate(Tiempo_Servicio_Min = (data_banco$Tiempo_Servicio_seg/60) ) %>% view()

####14####
data_banco %>% mutate(Monto = str_replace(data_banco$Monto, pattern = ",", replacement =".")) %>% view()

####15####
summary(data_banco)

####16####
mean(data_banco$Tiempo_Servicio_seg)
summary(data_banco$Tiempo_Servicio_seg)

####17####
deciles <- quantile(data_banco$Tiempo_Servicio_seg, seq(0.1,0.9, by= 0.1)) %>% view()
deciles2<- quantile(data_banco$Tiempo_Servicio_seg, c(0.05, 0.95)) %>% view()

####18####
sd(data_banco$Tiempo_Servicio_seg)  #mostramos desviacion estandar
var(data_banco$Tiempo_Servicio_seg)  #mostramos la varianza
IQR(data_banco$Tiempo_Servicio_seg)  #mostramos el rango intercuartil
range(data_banco$Tiempo_Servicio_seg)  #mostramos el rango Min y Max

####19####

data_banco %>% filter( Sucursal== 62) %>% group_by (Transaccion, Satisfaccion) %>%
  summarise_at( vars(Tiempo_Servicio_seg), funs ( MEDIA= mean(., na.rm=TRUE),
                                                  MEDIA_ACOT= mean(., na.rm = TRUE, trim = 0.05),CANTIDAD= n() ) )
####20####
table(data_banco$Satisfaccion)
table(data_banco$Transaccion)

####21####
num_intervalos<- ceiling(log2(length(data_banco$Tiempo_Servicio_seg))+1)
hist(data_banco$Tiempo_Servicio_seg, breaks = num_intervalos,
main = "Variable Tiempo de respuesta", xlab = "Tiempo de servicio(seg)")

####22####
 install.packages("prettyR")
library(prettyR)
describe(data_banco[, sapply(data_banco, is.numeric)], num.desc = c("mean", "sd",
                                                                    "median", "min", "max", "valid.n"))
class(data_banco$Monto)
data_banco$Monto<-as.numeric(data_banco$Monto, na.rm=TRUE)
class(data_banco$Monto)
describe(data_banco[, sapply(data_banco, is.numeric)], num.desc = c("mean", "sd",
                                                                    "median", "min", "max", "valid.n"))
describe(data_banco, num.desc = c("mean", "sd", "median", "min", "max", "valid.n"))
# calculo el primer cuartil para variable numérica
Q25 <- function(x, na.rm = TRUE) {
  quantile(as.numeric(x), 0.25, na.rm = na.rm, names = FALSE)
}
# calculo tercer cuartil para variable numérica
Q75 <- function(x, na.rm = TRUE) {
  quantile(as.numeric(x), 0.75, na.rm = na.rm, names = FALSE)
}
#describo los datos
describe(data_banco, num.desc = c("mean", "median", "sd", "min", "max", "Q25", "Q75",
                                  "valid.n"))

####23####

data_banco %>% group_by(Transaccion,Satisfaccion)%>%summarise_at(vars(Tiempo_Servicio_seg),
                                                                 funs(MEDIA = mean(., na.rm = TRUE), MEDIA_ACOT = mean(., na.rm = TRUE, trim =
                                                                                                                         0.05),
                                                                      CANTIDAD = n()))
####24####
data_banco %>% group_by(Sucursal) %>%
  summarise_at(vars(Tiempo_Servicio_seg),
               funs(MEDIA = mean(., na.rm = TRUE),
                    MEDIA_ACOT = mean(., na.rm = TRUE, trim = 0.05),
                    CANTIDAD = n()))
data_banco %>%filter( Sucursal== 62 ) %$% # Operador pipe para seleccion de columnas
  cor(Tiempo_Servicio_seg, as.numeric(Monto))

####25####
boxplot(data_banco$Tiempo_Servicio_seg) ## Base de R
data_banco %>% select(Tiempo_Servicio_seg) %>% boxplot
boxplot(data_banco$Tiempo_Servicio_seg, main = "Boxplot para Tiempo de Servicio
(seg)",
        ylab = "Tiempo")
