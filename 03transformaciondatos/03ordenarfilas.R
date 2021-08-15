### ORDENANDO LAS FILAS CON ARRANGE ###

# Muestra las primeras filas del set de datos
head(vuelos)

# Muestra las primeras filas del set de datos indicando las filas que queramos mostrar
head(vuelos, 15)

# Muestra las ultimas filas del set de datos
tail(vuelos)

# Muestra las primeras filas del set de datos indicando las filas que queramos mostrar
tail(vuelos, 15)

# La función de arrange() nos permite ordenar los datos

ordena_por_fecha <- arrange(vuelos, year, month, day)

tail(ordena_por_fecha)

arrange(vuelos, desc(arr_delay))

# Con desc() podemos ordenar de manera descendente
head(arrange)

arrange(vuelos, desc(dep_delay))

datos_tibble

# Si ordenamos por un campo que tiene datos NA, estos siempre se irán hasta el final
arrange(datos_tibble, desc(x))
arrange(datos_tibble, x)

# Ordena los vuelos por aerolinea
arrange(vuelos, carrier)

# Ordena los vuellos por aerolinea de manera descendente
arrange(vuelos, desc(carrier))

# Ordena los vuelos por menor distancia recorrida
View(arrange(vuelos, distance))

# Ordena los vuelos por mayor distancia recorrida
View(arrange(vuelos, desc(distance)))

# Aqui simplemente estamos combinando la función de filter y de arrange
vuelosUA <- filter(arrange(vuelos, year, month, day), carrier == "UA")
