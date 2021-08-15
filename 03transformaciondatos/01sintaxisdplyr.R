#Activamos la librería de tidyverse
library(tidyverse)

#Activamos el paquete de los vuelos de Nueva York del 2013
library(nycflights13)

#Visualizamos el set de datos de los vuelos
View(flights)

# tibble es un dataframe mejorado por tidyverse
# Existen diferentes tipos de datos para las tibble
# int -> Entero
# dbl -> Double
# chr -> Carácter
# dttm -> Fecha y hora
# lgl -> Lógico : TRUE o FALSE
# fctr -> factor: variables categoricas
# date -> Fecha

# Funciones utiles de dplyr
# filter() -> filtrar datos a partir de valores concretos
# arrange() -> ordernar los datos por una determinada columna
# select() -> seleccionar variables por sus nombres
# mutate() -> crea nuevas variables a partir de las existentes
# summarise() -> colapsar varios valores para dar un resumen de los mismos
# group_by() -> Opera a la función que la acompaña y la agrupa por una determinada columna

# Argumentos que llevan las funciones en dplyr

# 1.- data frame o tibble
# 2.- operaciones que queremos hacer a las variables del data frame o tibble
# 3.- resultado en un nuevo data frame