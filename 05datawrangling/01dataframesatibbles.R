### DEL DATAFRAME A LAS TIBBLES ###

getwd() # Verificamos cuál es la ruta por defecto del directorio de trabajo

vignette("tibble")

library(tidyverse)

# Creacción de un dataframe
datos <- data.frame(a = 1:3, b = letters[1:3], c = Sys.Date() - 1:3)

datos

# Mostramos como tibble nuestro data frame creado anteriormente

as_tibble(datos)

# Vsiaulizamos un data frame que tiene R por defecto

View(iris)

# Convertimos el data frame de iris a tibble y lo guardamos en una variable para que quedé fijo
iris_tibble <- as_tibble(iris)
