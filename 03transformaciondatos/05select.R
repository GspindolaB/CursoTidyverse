library(tidyverse)

library(nycflights13)

arrange(flights, carrier)

ordena_por_fecha <- arrange(flights, year, month, day)

ordena_por_fecha[1,] # Se mostrara la primera fila y todas las columnas
ordena_por_fecha[c(1,5)] # Se mostrara la primera y la quinta fila y todas las columnas
ordena_por_fecha[c(1:10),] # Se mostrará de la primera a la decima fila y todas las columnas

ordena_por_fecha[,5] # Mostrará la quinta columna y todas las filas
ordena_por_fecha[,c(1,3,5)] # Mostrará la primera, tercera y quinta columna y todas las filas
ordena_por_fecha[,c(1:10)] # Mostrará las primeras 10 columnas y todas las filas

ordena_por_fecha[c(1:100), c(1:5)] # Muestra las primeras 100 filas y kas primeras 5 columnas


### FILTRAR COLUMNAS CON SELECT ###

# En este ejemplo traemos de la fila 500 a la 600 las columnas de demora salida y demora llegada
View(select(ordena_por_fecha[500:600,], dep_delay, arr_delay))

# En este ejemplo seleccionamos manualmente las columnas de año, mes, vuelo y aerolinea
View(select(flights, year, month, day, flight, carrier))

# En este ejemplo seleccionamos todo un rango de columnas que van desde año hasta aerolinea
View(select(flights, year:carrier))

# En este ejemplo seleccionamos las columnas que no esten en el rango entre año y dia
View(select(flights, -(year:day)))

# Seleccionamos todas las columnas que comiencen con la palabra dep
select(flights, starts_with("dep"))

# Seleccionamos todas las columnas que terminen con la palabra delay
select(flights, ends_with("delay"))

# Seleccionamos todas las columnas que tengan una s en la palabra
select(flights, contains("s"))

# Seleccionamos todas las columnas que tengas mas de 1 caracter repetido seguidamente
select(flights, matches("(.)\\1"))

# Seleccionamos las columnas que se llamen x1, x2, x3, x4 y x5 si llegasen a existir
select(flights, num_range("x", 1:5)) # x1, x2, x3, x4, x5

### RENOMBRAR Y ORDENAR COLUMNAS ###

# Renombramos la columna de dep_time con el nombre de tiempo_vuelo y ademas se mantienen todas las demas
rename(flights, tiempo_vuelo = dep_time)
rename(flights, anio = year, mes = month, dia = day)

# Renombramos la columna de flight con el nombre de num_vuelo y solamente se moestrará esa
select(flights, num_vuelo = flight)

# Unicamente seleccionamos el numero de vuelo, aerolinea, origen y destino
select(flights, carrier, flight, origin, dest)

# Con la función de everything() indicamos que se moestraran todas las columnas después de las seleccionadas manualmente
select(flights, carrier, flight, origin, dest, everything())
