### FUNCIONES UTILES PARA MUTAR LOS DATOS ###

# Operaciones Aritméticas: +, -, *, /, ^

# Agregados de funciones: x/sum(x): proporcion sobre el total
#                         x-mean(x): distancia respecto de media
#                         (x-mean(x))/sd(x): tipificacion
#                         (x-min(X))/(max(x)-min(x)): estandarizar entre [0:1]

# Aritmética modular: %/% : cociente de la division entera 
#                     %%  : resto de la division entera
#                          : -> x == y * (x%/%y) + (x%%y)

# Obtenemos dos nuevas variables, una que calcule las horas de vuelo y otra los minutos de vuelo
transmute(vuelos_nuevo,
            air_time,
            horas_vuelo = air_time %/% 60, # division entera
            minutos_vuelo = air_time %% 60 # resto de la division
            )

# Logaritmos: log() -> logaritmo en base e, log2(), log10()
# Offsets: lag(), lead()

# La función lag() nos permite recorrer hacia la derecha
df <- 1:15
df
lag(df)
lag(lag(df))

# La función lead() nos permite recorrer hacia la izquierda
lead(df)

# Funciones acumulativas : cumsum(), cumprod(), cummin(), cummax(), cummean()

# La función cumsum() nos permite ir realizando las sumas acumuladas
transmute(vuelos,
          distance,
          cumsum(distance))

# La función cumprod() nos permite realizar el producto acumulado
transmute(vuelos,
          hour,
          cumprod(hour))

# La función cummin() nos permite realizar el minimo acumulado
minimo <- transmute(vuelos,
                    hour,
                    cummin(hour))

# La función cummax() nos permite realizar el maximo acumulado
maximo <- transmute(vuelos,
                    hour,
                    cummax(hour))

# La funcion cummean() nos permite realizar el el calculo de la media acumulada
media <- transmute(vuelos,
                   distance,
                   cummean(distance))

# Comparaciones logicas: >, >=, <, <=, == , !=

# Queremos saber los vuelos que tuvieron una demora
transmute(vuelos,
          dep_delay,
          si_es_retrasado = dep_delay > 0)

# Queremos saber los vuelos que salieron exactamente en la hora programada
vuelos_exactos <- transmute(vuelos,
          dep_time,
          sched_dep_time,
          dep_time == sched_dep_time)

# Rankings: min_rank()

# Ordena los vuelos por la columna de distancia
vuelos_ordenados <- transmute(vuelos,
          distance,
          min_rank(distance))

# Ordena los vuelos por la columna de distancia de manera descendente con desc()
vuelos_ordenados <- transmute(vuelos,
                              distance,
                              min_rank(desc(distance)))

#  Ordena los vuelos por la columna dest
View(transmute(vuelos,
          dest,
          row_number(dest)))

# Ordena los vuelos por la columna tailnum
View(transmute(vuelos,
          tailnum,
          dense_rank(tailnum)))

# Obtiene el porcentaje de cada numero de vuelo
View(transmute(vuelos,
               tailnum,
               percent_rank(tailnum)))

View(transmute(vuelos,
               tailnum,
               cume_dist(tailnum)))

# Ordena por cuartiles
ntile(df, 4)

# Ordena en 100 partes por el campo de dep_delay
View(transmute(vuelos,
          dep_delay,
          ntile(dep_delay, n = 100)))
