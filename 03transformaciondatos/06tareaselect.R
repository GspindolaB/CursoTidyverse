# 1.- Piensa cómo podrías usar la función arrange() para colocar todos los valores NA al inicio. 
#     Pista: puedes la función is.na() en lugar de la función desc() como argumento de arrange.

arrange(flights, !is.na(flights))

# 2.- Ordena los vuelos de flights para encontrar los vuelos más retrasados en la salida. 
#     ¿Qué vuelos fueron los que salieron los primeros antes de lo previsto?
arrange(flights, dep_delay)

# 3.- Ordena los vuelos de flights para encontrar los vuelos más rápidos. 
#     Usa el concepto de rapidez que consideres. 
arrange(select(flights, contains("time")),air_time)

# 4.- ¿Qué vuelos tienen los trayectos más largos? 
#     Busca en Wikipedia qué dos aeropuertos del dataset alojan los vuelos más largos. 
arrange(select(flights, origin, dest, carrier, flight, tailnum, air_time, distance), desc(distance))

# 5.- # 4.- ¿Qué vuelos tienen los trayectos más cortos? 
#     Busca en Wikipedia qué dos aeropuertos del dataset alojan los vuelos más cortos. 
filter(arrange(select(flights, origin, dest, carrier, flight, tailnum, air_time, distance), distance), !is.na(air_time))

# 6.- Dale al coco para pensar cuantas más maneras posibles de seleccionar los campos 
#     dep_time, dep_delay, arr_time y arr_delay del dataset de flights. 
select(flights, dep_time, dep_delay, arr_time, arr_delay)
select(flights, starts_with("dep"), starts_with("arr"))
select(flights, ends_with("time"), ends_with("delay"), -(starts_with("sched")), -(air_time))

# 7.- ¿Qué ocurre si pones el nombre de una misma variable varias veces en una select()?
select(flights, carrier, carrier, flight, flight)

# 8.- Investiga el uso de la función one_of() de dplyr. 
?one_of

select(flights, one_of("carrier", "fligth"))

# 9.- Investiga cómo puede ser útil la función one_of() de la pregunta anterior 
#     en conjunción con el vector de variables 
select(flights, one_of(c("year", "month", "day", "dep_delay", "arr_delay")))

# 10.- Intenta averiguar el resultado del siguiente código. Luego ejecútalo y a ver si el resultado te sorprende.
select(flights, contains(ignore.case = FALSE,"time"))

?contains
