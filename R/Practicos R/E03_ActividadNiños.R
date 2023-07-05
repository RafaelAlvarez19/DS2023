###Alvarez Rafael Actividad 3###

rm(list = ls())
getwd()
setwd("~/DS2023/R/Practicos R")

####1####
require(tidyverse)
library(tidyverse)
library(forcats)
library(units)


####2####
datos <- read_excel("NiñosLP.xlsx", sheet = 1)

####3####
str(datos)

####4####
names(datos)

####5####
sum(is.na(datos))
colSums((is.na(datos)))
which(is.na(datos$Nombre == T ))
which(is.na(datos$Peso == T))
which(is.na(datos$Talla==T))

####6####
class(datos$Sexo)
datos[8] <- as.factor(datos[8])
class(datos$Sexo)
levels(datos$Sexo)
datos[8]

####7####
class(datos$FechaNac)
datos$FechaNac<- as.Date(datos$FechaNac)
class(datos$FechaNac)
round_date(datos$FechaNac)
round_date(datos$Fecha)

####8####
datos$Fecha <- as.Date(datos$Fecha)
Edad_actual <- round((datos$Fecha - datos$FechaNac)/365, digits = 0)
Edad_actual

####9####
datos$imc <- round((datos$Peso)/sqrt((datos$Talla)/100),2)

datos$imc<- fct_explicit_na(datos$imc, na_level = "Desconocido")
datos$imc
datos$imc <- cut(datos$imc,breaks = c(0,13,19,24,70), labels = c("Bajo Peso", "Normal", "Sobrepeso", "Obesidad"), right = F)
datos$imc
datos$imc<- fct_relevel(datos$imc, "Bajo Peso", "Normal", "Sobrepeso", "Obesidad","Desconocido")
levels(datos$imc)

####10####
class(datos$Zona)
datos$Zona<- as.factor(datos$Zona)
class(datos$Zona)
datos$Zona<- fct_recode(datos$Zona, Centro_LP = "Casco Urbano")

