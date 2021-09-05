### EL PAQUETE READR PARA LA IMPORTACIÓN DE DATOS ###

library(tidyverse)

# * read_csv() ',' Separado por comas
# * read_csv2() ';' Separado por punto y coma
# * read_tsv() '\t' Separado por tabulador
# * read_delim(delim = '\n') Nosotros elegimos el delimitador

# * read_fwf()
  # * fwf_wiidths()
  # * fwf_positions()
# * read_table()

# * read_log()
# install.packages("webreadr") # Para analizar logs en R

### GUARDAR UN CSV CON EL PAQUETE BASE DE R ###

# La función write_csv nos permite guardar en un csv la informacion de un dataset

write.csv(mtcars, file = "data/cars.csv")

### LEER UN CSV CON READR ###

# Con la función read_csv podeemos leer un archivo delimitado por comad
cars <- read_csv("data/cars.csv")

cars %>%
  View()

read_csv("x,y,z
         1,2,3.5
         4,5,6
         7,8,9")

# En este caso como tenemos un text en el encabezado, indicamos el parámetro skip para decirle que se
# salte un determinado numero de lineas
read_csv("Este fichero fue generado por Guillermo Spindola
         el día 05 de Septiembre de 2021 para poder usarlo
         en el curso de Tidyverse
         x,y,z
         1,2,4", skip = 3)

# En este caso tenemos un comentario en el encabezado, indicamos el parámetro comment para decirle que
# omita lo que comience con #
read_csv("#Esto es un comentario
         x,y,z
         1,2,3
         4,5,6", comment = "#")

#Con el parámetro col_names = FALSE le indicamos a R que no queremos agregar nombre a las columnas
read_csv("1,2,3\n4,5,6\n7,8,9", col_names = FALSE)

#También podemos definir en el parámetro col_names el nombre de las columnas con un vector
read_csv("1,2,3\n4,5,6\n7,8,8", col_names = c("primera", "segunda", "tercera"))

#Con el parámetro na indicamos que valores serán reemplazados por un NA
read_csv("x,y,z\n1,2,.\n4,.,6", na = ".")

#También podemos combinarlo con un vector
read_csv("x,y,z\n1,2,.\n4,#,6", na = c(".","#"))


### PAQUETE BASE VS READR ###

# Esta es la función por defecto que tiene el oaquete base de R
carros <- read.csv("data/cars.csv")

# Una dde las principales diferencias es que el paquete base de R produce data.frames
# Mientras que el readr de tidyverse produce tibbles

carros # Esto es un data.frame
cars # Está es una tibble