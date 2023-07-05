###Alvarez Rafael###

rm(list=ls())

getwd()
setwd("~/DS2023/R/Archivos Clase")
install.packages("tidyverse")
library(tidyverse) #activamos la libreria para usar las funciones de tidyverse
install.packages("readxl")
library(readxl) #Libreria para leer excel
####Tidyverse####
tidyverse_packages()

mis_datoscsv <- read.csv("mydata.csv", header = TRUE, sep = ",", dec = ",") ##Es el mismo archivo pero en este caso se utiliza como separador la ',' ##


mi_csv <- read.csv2("mydata.csv", header= TRUE, sep = ".", dec = ".")  ##En este caso estariamos usando una version diferente de read table ya que el separador seria el "." ##
                                                                       ##En el caso de que quisieramos aclarar que vamos a usar un separador distinto nos devolveria un error ya que son funciones distintas y especificas##

mi_excel <- read_excel("mydata.xlsx", col_names = TRUE)##En el caso de que el parametro estuviera en FALSE lo unico que cambiaria es que no nos mostraria los nombres de las columnas##


salud <- read_excel("Datos_salud.xlsx", sheet = 1,col_names = TRUE)##En este caso con el parametro sheet le estamos aclarando a la funcion que solo queremos leer esa hoja en especifico##

str(mis_datoscsv)
ncol(mis_datoscsv)
nrow(mis_datoscsv)
dim(mis_datoscsv)
names(mis_datoscsv)

names(mis_datoscsv)[4]<- "TALLA" ##Utilizamos la indexacion para cambiar el nombre de una columna##

mis_datoscsv[,2]<- NULL ##En este caso usamos la indexacion para borrar SOLO la columna 2 ya que el espacio de la coma antes toma todas las filas##

datos <- mis_datoscsv[,2:3] ##Realizamos un recorte de la tabla en este caso de las columnas 2 y 3 con todas sus filas

write.table(datos,"datosRecorte.txt", sep = ",", row.names = T)

datos <- datos[,c(2,1)] ##De esta forma con indexacion cambiamos el orden de las columnas##
 
sum(is.na(datos))##Con esta funcion buscamos si hay algun NA en la tabla##
colSums(is.na(datos))##Con esta vemos cuantos hay por columnas
which(is.na(datos$TALLA==T))##Con esto vemos en que posicion se encuentra en la columna


mean(mis_datoscsv$TALLA) ##En este caso va a devolver NA porque al encontrarse con ese valor no puede calcular la media
mean(mis_datoscsv$TALLA,na.rm = T)##con esta linea le decimos que calcule la media ignorando los valores ausentes

####gestion de factores####
library(forcats)
str(salud)

class(salud$Enfermedad) #Vemos la clase de la variable Enfermedad dentro de salud

salud$Enfermedad <- factor(salud$Enfermedad) #En este caso cambiamos la variable a tipo factor
levels(salud$Enfermedad) #vemos los niveles dentro de enfermedad
class(salud$Enfermedad) #checkeamos la clase ahora de la variable. Podemos apreciar que cambio de character a factor

salud$Sexo <- as_factor(salud$Sexo) #Aqui podemos ver como de varias formas podemos utilizar distintas funciones para transformar variables en factores
levels(salud$Sexo)#en este caso levels nos va a encontrar 4 niveles dentro de la variable. Ya que, esto depende 100% de la calidad del input de entrada.
#Para esto tendriamos que recodificar las variables para "unificar" los valores de entrada para reducir de esta forma los niveles.
salud$Sexo <- fct_recode(salud$Sexo, Varon = "Masculino", Mujer = "Femenino")  #fct hace referencia  a la funcion recodificar de forcat
levels(salud$Sexo) #Ahora checkeando nuevamente podemos apreciar que se redujeron los niveles y tenemos datos 'unificados'

fct_count(salud$Sexo)

salud$Civil <- as.factor(salud$Civil)#transformamos a factor
levels(salud$Civil)#Muestra los niveles dentro de civil
table(salud$Civil) #en este caso el NA en la sumatoria de datos nos estaria mostrando que perdemos una observacion.

salud$Civil <- fct_explicit_na(salud$Civil,na_level = "Desconocido") #con esta funcion de fct le estamos asignando a los valores NA el nivel de "desconocido"
table(salud$Civil)#Despues de usar la funcion podemos apreciar que volvemos a tener 19 obervaciones con lo que podemos afirmar que no estamos perdiendo informacion
levels(salud$Civil)#Agregamos el nivel 'Desconocido'

salud$Esalud <- ordered(salud$Esalud) #Aqui nuevamente podemos encontrar otra forma de transformar variables en factores
levels(salud$Esalud)  #La variable Essalud es una variable ordinal. Ya que, poseé un orden. Podemos apreciar igualmente que no nos muestra el orden estimado

salud$Esalud<- fct_relevel(salud$Esalud, "Muy buena", "Buena", "Regular", "Mala", "Muy mala") #De esta forma reasignamos el orden de los niveles
levels(salud$Esalud)

salud$Ciudad <- as.factor(salud$Ciudad)#transformo a factor la variable ciudad 
fct_count(salud$Ciudad) #con esta funcion de fct tambien podemos saber cantidad de observaciones por variable
salud$Ciudad<- fct_other(salud$Ciudad, keep="La Plata", other_level = "Otros/as")#Cuando encontramos variables con poca frecuencia podemos asignarle el valor 'Otros/as' para facilitar la lectura de la informacion
fct_count(salud$Ciudad) #Aqui podemos apreciar como solo nos quedamos con la informacion de la plata y otros
levels(salud$Ciudad)

salud$Comorbilidades<- as.factor(salud$Comorbilidades)#trasnformamos a factor
levels(salud$Comorbilidades)
fct_count(salud$Comorbilidades)
salud$Comor_agrupadas <-fct_collapse(salud$Comorbilidades, Respiratorio = c("EPOC", "TBC", "Neumonia"),Digestivo=c("Hepatitis", "Gastritis"), Circulatorio = c("aterosclerosis", "Hipertensión"))
levels(salud$Comor_agrupadas)


####Fechas####

fecha_nac <- c("1997/04/19")
str(fecha_nac) #declaramos la fecha de nacimiento como character para transformarlo a tipo date
fecha_nac <- as.Date(fecha_nac) #Utilizamos la funcion date para transformarlo
str(fecha_nac) #Aqui vemos la estructura de la variable tipo date
class(fecha_nac) #Vemos que ya se realizo la conversion del dato a tipo Date para poder manipularlo

dia1<- as.Date("24/12/2023", format= "%d/%m/%Y") #De esta forma podemos indicar el formato de fecha a utilizar en este caso seria 'day', 'month', 'Year'(con mayuscula)
class(dia1)       #si ponemos la 'Y' se utiliza el año completo en le formato, en caso de que usemos la 'y' podemos utilizar solo dos digitos
str(dia1)

dia2 <- as.Date("19-04-97", format= "%d-%m-%y") #De esta forma podemos aclarar otro formato de fecha
dia2

Diferencia_dias <- (dia1 - dia2)
Diferencia_dias
edad<-difftime(dia1,dia2, units = "days") #Esta funcion realiza una diferencia entre dias y nos da la posibilidad de mostrar el resultado en distintas unidades

Sys.Date()#Esta funcion me va a devolver el dia de hoy en el sistema

paste("Mi edad es: ",(edad/365),"años" ) #De esta forma podemos devolver un mensaje personalizado en R

weekdays(fecha_nac) #Con la funcion weekdays podemos sacar el dia de la semana de una fecha o periodo de tiempo deseado

months(fecha_nac) #de esta forma podemos extraer el mes de una fecha 

HombreLuna <- as.Date("1969-07-20")#creamos una fecha al azar. En este caso es la llegada del hombre a la luna
as.character(HombreLuna, format= "%c")#Segun sea el formato podemos extraer distinta informacion %A es para el dia, %B es para el mes,%d es para el numero del dia, c es para sacar toda la informacion posible

 
