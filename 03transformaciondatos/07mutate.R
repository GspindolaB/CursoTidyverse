library(tidyverse)

library(nycflights13)

### CALCULAR NUEVAR VARIABLES A PARTIR DE LAS QUE YA TENEMOS ###

# Asignamos los flights a una variable llamada vuelos
vuelos <- flights

# Seleccionamos unicamemte las columnas de año, mes y dia. Y tambien la distancia, tiempo de vuelo y las que terminen con delay
vuelos_nuevo <- select(flights,
                       year:day,
                       ends_with("delay"),
                       distance,
                       air_time)

# La funcion mutate nos permite agregar nuevar variables, aunque estas no se quedan guardadas en el dataset
View(mutate(vuelos_nuevo,
       tiempo_ganado = arr_delay+dep_delay, # diferencia de tiempo en minutos
       horas_vuelo = air_time /60, # horas de vuelo
       velocidad_vuelo = distance / horas_vuelo, # velocidad = distancia sobre tiempo
       tiempo_ganado_por_hora = tiempo_ganado / horas_vuelo
       ))

# Pero podemos asignarlo a nuestro dataset de la siguiente manera
mutate(vuelos_nuevo,
       tiempo_ganado = arr_delay+dep_delay, # diferencia de tiempo en minutos
       horas_vuelo = air_time /60, # horas de vuelo
       velocidad_vuelo = distance / horas_vuelo, # velocidad = distancia sobre tiempo
       tiempo_ganado_por_hora = tiempo_ganado / horas_vuelo
) -> vuelos_nuevo

View(vuelos_nuevo)

# Si quieremos generar un dataset unicamente con las nuevas variables podemos utilizar la funcion transmutate()
transmute(vuelos_nuevo,
          tiempo_ganado = arr_delay+dep_delay,
          horas_vuelo = air_time/60,
          velocidad_vuelo = distance / horas_vuelo,
          tiempo_ganado_por_hora = tiempo_ganado / horas_vuelo)

# Y también lo podemos asignar a una nueva variable
vuelos_nuevos2 <-transmute(vuelos_nuevo,
                           tiempo_ganado = arr_delay+dep_delay,
                           horas_vuelo = air_time/60,
                           velocidad_vuelo = distance / horas_vuelo,
                           tiempo_ganado_por_hora = tiempo_ganado / horas_vuelo)
