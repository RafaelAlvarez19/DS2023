###############################################
### CERTIFICACIÓN UNIVERSITARIA EN DATA SCIENCE
###   PROGRAMACIÓN PARA LA CIENCIA DE DATOS I
##                    2023                   ##    
###############################################

## Myrian Aguilar, 24 de Enero de 2023 ##

####################################################
### Borrar los datos de entorno cargados en memoria 
####################################################

rm(list=ls()) # Borrar los datos de entorno cargados en memoria 

# script, comentarios, asignacion ----

# Un script es un archivo que contiene un listado secuencial de lineas de codigo

# Todo lo escrito luego de un # es entendido como un comentario y no será tenido 
# en cuenta cuando se ejecute el código.

# La combinación del signo menor con el guión medio ( <- ) es llamado el símbolo de asignación

# asignando directorio----

setwd("C:/Users/Rafael/Documents/DS2023") # aqui debes indica TU de  directorio de trabajo

getwd() # verifico cual es el directorio de trabajo. Lo veo en la consola

# R como calculadora: operadores aritmeticos-----------

5 + 2
2 / 3
5 ^ 2
((10-3)*(4 + 8)) ^ 3

# OPERADORES RELACIONALES--------

# Los operadores relacionales son simbolos mediante los cuales podemos realizar operaciones. 
# Como resultado obtenemos objetos de clase logical, que pueden adoptar los valores TRUE o FALSE

8 > 1 # TRUE (8 es mayor que 1?)
3 < 2 # FALSE (3 es menor que 2?)
3 == 2 # FALSE (3 es igual a 2?)
7 == 7 # TRUE (7 es igual a 7?)
5 != 5 # FALSE (5 es distinto de 5?)


# OPERADORES LOGICOS---------

A <- 3 > 2       # TRUE
B <- 4/5 < 7/8   # TRUE
C <-  8 == 9     # FALSE
A & B        	  # TRUE
A && B       	  # TRUE
A & C        	  # FALSE

x <- 10:15 # un vector
x
y <- 16:11
y
x == y    # Compara dos vectores, es decir, cada elemento de 'x' con el de 'y'

cond <- x < 13 # buscar todos los valores dentro del vector x que sean menores a 13
cond


# TIPS para nombrar objetos-------

# Se pueden usar combinaciones de letras, numeros y algunos 
# simbolos, como el punto . , el guion medio - y el guion bajo _ .
# Los nombres no pueden comenzar con un numero.
# R distingue minisculas de mayusculas. Por ejemplo: Casa y casa pueden ser 2 variables distintas
# R tiene una lista de nombres y simbolos reservados que no pueden utilizarse 
# para crear nuevos objetos. Por ejemplo: "function", "if", !

# clase de objetos-------

dato1 <- 24 # al objeto llamado numero le asigno el valor 24
dato1       # lo llamo, es decir verifico, le pido que me lo muestre

datos2 <- dato1 * 234 # puedo hacer calculos con operadores arirmeticos
datos2

### Clase de Objetos: VECTORES------------

# conjunto de valores (numeros o simbolos), todos del mismo tipo 
# ordenados de la forma (elemento 1, elemento 2, . , elemento n), siendo n la 
# longitud o tamaño del vector.

vector <- c(2, 5, 6, 7)

vector * 2 

vector_2 <- c("Ana P","Lucas J", "Pablo E")
vector_2

vector_2[3] #nos devuelve el objeto en el lugar 3 del vector

alumnos<-vector_2[2]
alumnos

# funciones-----
class(vector) # funcion class() me dice la clase de atributo del objeto
class(vector_2)

x <- seq( from = 1, to = 6, by = 2) # funcion seq(), secuencia de numeros
x

y <- seq( from = 1, to = 6, length = 3) # lenght divide el intervalo en segmentos iguales
y

yy <- seq( from = 1, to = 6, length = 2)
yy

z <- rep("casa", time=4) # rep() crea un vector repitiendo el numero o caracter
z          


### Clase de objeto: LISTA---------------
# Lista: coleccion ordenada de otros objetos, llamados componentes de la lista

milista <- list(numeros = 1:5,
                ciudades = c("Buenos Aires", "Rosario", "Neuquen"))
milista

familia <- list(padre = "Juan", 
                madre = "Maria",
                numero.hijos = 3,
                nombre.hijos = c("Luis", "Carlos", "Paola"),
                edades.hijos = c(7, 5, 3),
                ciudad = "La Plata")
familia

names(familia) # obtengo vector con nombre de los componentes


### Clase de objeto: MATRIZ---------------
# es un vector bidimensional, que se visualiza como una tabla conformada por 
# columnas y filas ordenadas y donde todos los elementos son del mismo tipo

matrix(1:6) # creo una matriz

matrix(1:6, nrow = 2) #  si especifico numero de filas la secuencia 1:6 se acomodan por columnas

matrix( 1:6, nrow = 2, byrow = TRUE) # con byrow = TRUE, lee por filas

#data: datos que forman la matriz
#nrow: numero de filas
#ncol: numero de columnas
#byrow: Los datos se colocan por filas o por columnas según se van 
#leyendo. Por defecto se colocan por columnas.

# Indexacion en matrices-------
# Seleccionar los elementos de una matriz, podemos hacerlo introduciendo el número
# de fila y columna entre [ ].


x <- matrix( 1:6, nrow = 3) # Creamos una matriz 2 x 3
x

x[1,2] #Se muestra el elemento de fila 1 columna 2


# Asignar nombres a filas y columnas-------

datos <- matrix(c(20, 65, 174, 22, 70, 180, 19, 68, 170),
                nrow = 3, byrow = T) #Se crea una matrix 3x3
datos
colnames(datos) <- c("edad","peso","altura") # nombres a columna
datos                                        # verifico
rownames(datos) <- c("paco","pepe","kiko")   # nombres a filas
datos                                        # verifico

### Clase de Objeto: DATA FRAME--------
# grupo de vectores ordenados en forma tabular, donde cada vector conforma una columna del dataframe

# creacion de un DF
# creamos 4 vectores con 4 valores cada uno

id <- 1:4          
edad <- c(23, 43, 12, 65)
sexo <- c("M", "F", "F", "M")
trabaja <- c(T, T, F, F)

datos <- data.frame( id, edad, sexo, trabaja)

class(datos) # verifico la clase de objeto
str(datos) # miro estructura del conjunto de datos

datos$sexo # selecciono la variable sexo del DF
# se trata de un factor, veremos aparecer sus niveles.

datos[,2] # indexamos, se comporta igual que matriz

# combinacion de Dataframe---------

id <- 5:9
edad <- c(37, 45, 52, 25, 32)
sexo <- c("F", "F", "F", "M", "M")
trabaja <- c(T, F, T, F, F)
datos_nuevos <- data.frame( id, edad, sexo, trabaja)

datos_todos <- rbind(datos, datos_nuevos) # union de los dos Df
datos_todos                               # verifico

# agregar columna a DF--------
estudia <- c(T, F, T, F, F, T, T, F, F) #  creo la nueva variable

datos_estudia <- cbind(datos_todos, estudia) # union del Df y la nueva variable
head(datos_estudia) # miro ( encabezado) los primeros valores


# ESTRUCTURAS DE CONTROL-----------
# composicion secuencial: Cuando queremos ejecutar varias líneas seguidas, 
# las escribimos en orden, una debajo de la otra.
# Una secuencia de instrucciones se vuelve una instrucción compuesta cuando 
# utilizamos las llaves { }.
# Las llaves agrupan las sentencias y hace que se ejecuten como un bloque.
# Seleccion condicional:La condición debe ser una expresión del tipo booleana 
# y siempre debe ir dentro de un paréntesis
# A continuación, escribir el proceso (instrucción compuesta)
# que queremos que ocurra en caso que la sentencia utilizada
# como condición sea verdadera. Agregamos un else, y finalmente escribimos el 
# proceso a utilizarse cuando la sentencia es falsa.

# if-------
if(4>3){
  "verdadera"
  }

if(3>4){
  "verdadera"
} # como no es verdadero no me muestra ningun resultado


# SELECCION CONDICIONAL: en el caso en que queremos realizar un proceso si la condicion es verdadera

# La condición debe ser una expresión del tipo booleana y siempre debe ir dentro 
# de un paréntesis. A continuación, escribir el proceso (instrucción compuesta) 
# que queremos que ocurra en caso que la sentencia utilizada como condición sea verdadera. 
# Agregamos un else, y finalmente escribimos el proceso a utilizarse cuando la 
# sentencia es falsa.
# " si la condicion es verdadera realiza el proceso 1, de lo contrario utiliza el proceso 2"


## ejemplo: generamos una estrictura de control para saber si aprobo o no

# Si la variable nota es menor a 7, R nos devuelve "desaprobado". 
# Si por el contrario, nota es mayor a 7, entonces imprime "aprobado".

nota<-8
if(nota < 7){
  print("desaprobado")
}else{
  print("aprobado")
}

nota<-3
if(nota < 7){
  print("desaprobado")
}else{
  print("aprobado")
}


# Ejemplo: Desarrollar un codigo que identifique si un número es par o impar 

x <- 55
if(x%%2 == 0){
  print("numero par")
}else{
  print("numero impar")
}

x <- 121
if(x%%2 == 0){
  print("numero par")
}else{
  print("numero impar")
}

# Bucles-------------

# Un bucle es una composición compuesta que se repite n veces hasta alcanzar un 
# límite definido. Cada repetición del bucle es una nueva iteración. 
# Podemos decir que un bucle está compuesto por n iteraciones.

# FOR-----------

for( i in 1:4 ){
  print(i)
}

# Como se lee?
# “para i entre 1 y 4 imprimir el valor de i”. Por lo tanto, en la primer iteración i 
# vale 1 entonces imprime el 1. En la segunda iteración, i vale 2 entonces imprime el dos, 
# etc. hasta que i vale 4 e imprime 4. 
# En ese momento, se termina de ejecutar el bucle.

# WHILE-------------------

# si queremos realizar un ciclo pero no conocemos el número de ciclos 
# que se precisan, se usa while que permite iterar hasta que cierto criterio 
# se cumpla:

# Ejemplo: generar un bucle que sume todos los elementos positivos 
# hasta que la suma sea mayor o igual a 1000
n <- 0
suma <- 0
while (suma <= 1000){
  n <- n + 1
  suma <- suma + n }
c(suma, n)

# como se lee? 
# “mientras la variable suma sea menor o igual a 1000, a n sumarle 1 y asignarlo 
# a n y tras esto, a suma sumarle el nuevo n generado".

# REPEART---------------------
# repite un conjunto de instrucciones hasta que se satisfaga un criterio de parada
# usamos break para indicar donde parar

# usamos ejemplo anterior

n <- 0
suma <- 0
repeat{
  n <- n + 1
  suma <- suma + n
  if ( suma > 1000) break }
c(suma, n)

# NEXT-----------------------
# En cualquiera de los bucles anteriores es posible introducir el comando next
# que produce un salto a la siguinete iteracion

# ejemplo: quiero imprimir los numeros impares del 1 al 10

for ( i in 1:10 ) {
  if (i %% 2 == 0) next
  print(i)
}

# como se lee?
# A medida que i avance se evaluará si el valor que toma es divisible por 2. 
# En caso que así lo sea, se pasará al siguiente valor de i. 
# En el caso contrario, se imprime el valor de i en la consola.

# BREAK---------------------
# La función break produce la salida inmediata del bucle

x <- c("a", "b", "c", "d")
for ( i in x ){
  print(i)
  if( i == "c") break
}

# instalando paquetes-------

#install.packages("ggplot2") # instala
library(ggplot2)            # activo

ggplot()+
  geom_point(alpha=0.15, size=60)+
  scale_colour_manual(values=c("#FF85B3", "#F900BF", "#9900F0"))+
  scale_x_continuous(limits=c(5.2, 6))+
  scale_y_continuous(limits=c(3.5,5))+
  theme_void()+
  theme(legend.position="none")+
  annotate("text", x=5.6, y=4.3, label="¡¡Gracias \n por tu atención!!", size=20, color="mediumpurple4")


######################
### Fin del Script ### 
######################



