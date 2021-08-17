library(tidyverse)

library(nycflights13)

### RESUMENES DE VARIABLES AGRUPADAS CON DPLYR ### SUMMARISE ###

vuelos <- flights

# Obtenemos la media de todas las demora en la salida de los vuelos
summarise(vuelos, delay = mean(dep_delay, na.rm = TRUE))

# Creamoos una agrupácion por año y por mes
por_año_mes <- group_by(vuelos, year, month)

# Obtenemos la media de demora en los vuelos agrupada por mes y año
summarise(por_año_mes, delay = mean(dep_delay, na.rm = TRUE))

# Creamos una agrupacion por año mes y dia
por_anio_mes_dia <- group_by(vuelos, year, month, day)

# Obtenemos la mediana, la media, el minimo y el máximo de demora en los vuelos agrupando por año, mes y dia
summarise(por_anio_mes_dia, promedio_delay = mean(dep_delay, na.rm = TRUE),
          media_delay = median(dep_delay, na.rm = TRUE),
          min_delay = min(dep_delay, na.rm = TRUE),
          max_delay = max(dep_delay, na.rm = TRUE))

# Obtenermos el promedio en la demora de salida de todas las compañias aereas y lo ordenamos
arrange(summarise(group_by(vuelos, carrier),
          delay = mean(dep_delay, na.rm = TRUE)), delay)

# Obtenermos la mediana en la demora de salida de todas las compañias aereas y lo ordenamos
arrange(summarise(group_by(vuelos, carrier),
                  delay = median(dep_delay, na.rm = TRUE)), delay)

# O también podemos generar un ranking con mutate y la funcion min_rank
mutate(summarise(group_by(vuelos, carrier),
                 delay = mean(dep_delay, na.rm = TRUE)), min_rank(delay))
