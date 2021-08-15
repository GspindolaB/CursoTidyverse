### TAREA 8: FILTRANDO LOS DATOS CON DPLYR ###

# 1.- Encuentra todos los vuelos que llegaron más de una hora tarde de lo previsto.
View(filter(flights, arr_delay > 60))

# 2.- Encuentra todos los vuelos que volaron hacia San Francisco (aeropuertos SFO y OAK)
View(filter(flights, dest == "SFO" | dest == "OAK"))
View(filter(flights, dest %in% c("SFO", "OAK")))

# 3.- Encuentra todos los vuelos operados por United American (UA) o por American Airlines (AA)
View(filter(flights, carrier == "AA" | carrier == "UA"))
View(filter(flights, carrier %in% c("AA", "UA")))

# 4.- Encuentra todos los vuelos que salieron los meses de primavera (Abril, Mayo y Junio)
View(filter(flights, month %in% c(4,5,6)))

# 5.- Encuentra todos los vuelos que llegaron más de una hora tarde pero salieron con menos de una hora de retraso.
View(filter(flights, arr_delay > 60 & dep_delay < 60))

# 6.- Encuentra todos los vuelos que salieron con más de una hora de retraso pero consiguieron llegar con menos 
#     de 30 minutos de retraso (el avión aceleró en el aire)
View(filter(flights, dep_delay > 60 & arr_delay < 30))

# 7.- Encuentra todos los vuelos que salen entre medianoche y las 7 de la mañana (vuelos nocturnos).
View(filter(flights, sched_dep_time >= 106 & sched_dep_time < 700))

# 8.- Investiga el uso de la función between() de dplyr. ¿Qué hace? 
#     Puedes usarlo para resolver la sintaxis necesaria para responder alguna de las preguntas anteriores?
filter(starwars, between(height, 106, 150))

View(filter(flights, between(sched_dep_time, 106, 699) ))

