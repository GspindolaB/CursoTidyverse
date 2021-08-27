vuelos <- flights

# 1.- Intenta dar por lo menos 5 afirmaciones verídicas en base a los datos que tenemos disponibles.

a_tiempo <- vuelos %>%
  filter(dep_delay <= 0)

a_tiempo %>%
  group_by(carrier) %>%
    summarise(count = n()) %>%
      arrange(desc(count))

demorados <- vuelos %>%
  filter(dep_delay > 0)

demorados %>%
  group_by(carrier) %>%
    summarise(count = n()) %>%
      arrange(desc(count))

vuelos %>%
  mutate(a_tiempo = )

no_cancelados <- vuelos %>%
  filter(!is.na(arr_delay), !is.na(dep_delay))

no_cancelados %>%
  group_by(origin, dest) %>%
    summarise(distancia = sum(distance)) %>%
      arrange(desc(distancia))

no_cancelados %>%
  group_by(carrier) %>%
    summarise(last_time = min(air_time)) %>%
      arrange(desc(last_time))
# 2.- Da una versión equivalente a las pipes siguientes sin usar la función count:

no_cancelados %>% count(dest)

no_cancelados %>% count(tailnum, wt = distance)

no_cancelados %>%
  group_by(dest) %>%
    summarise(n = n())

no_cancelados %>%
  group_by(tailnum) %>%
  summarise(n = sum(distance))

# 3.- Intenta dar una mejor definición para los vuelos cancelados  

no_cancelados2 <- vuelos %>%
  filter(!is.na(air_time))

# 4.- Investiga si existe algún patrón del número de vuelos que se cancelan cada día

cancelados <- vuelos %>%
  filter(is.na(air_time))

cancelados %>%
  group_by(year, month, day) %>%
    summarise(n = n()) %>%
      mutate(proporcion = n / sum(n), porciento = proporcion * 100) %>%
        ggplot(mapping = aes(x = n, y = proporcion)) +
          geom_point()

# ¿Que compañia aérea sufre los peores retrasos?

no_cancelados2 %>%
  group_by(carrier) %>%
    summarise(retraso = mean(arr_delay)) %>%
      arrange(desc(retraso))

# 5 .- Difícil: Intenta desentrañar los efectos que producen los retrasos por culpa de malos aeropuertos vs 
#     malas compañías aéreas. Por ejemplo, intenta usar 

flights %>% 
  group_by(carrier, dest) %>% 
    summarise(n())

# 6.- ¿Qué hace el parámetro sort como argumento de count()? ¿Cuando puede sernos útil?

no_cancelados %>%
  count(carrier, sort = T)

?count

# 7.- Vamos a por los peores aviones. Investiga el top 10 de qué aviones (número de cola y compañía) 
#     llegaron más tarde a su destino.

no_cancelados %>%
  group_by(tailnum, carrier) %>%
    summarise(max = max(arr_delay)) %>%
      arrange(desc(max))

# 8.- Queremos saber qué hora del día nos conviene volar si queremos evitar los retrasos en la salida.

View(no_cancelados %>%
       group_by(dep_time) %>%
       summarise(retraso_salida = mean(dep_delay)) %>%
       arrange(dep_time) %>%
       filter(retraso_salida <= 0))

# 9.- Para cada destino, calcula el total de minutos de retraso acumulado.
#     Para cada uno de ellos, calcula la proporción del total de retraso para dicho destino.


no_cancelados %>%
  group_by(dest) %>%
    summarise(minutos_retraso = sum(arr_delay)) %>%
      mutate(minutos_totales = minutos_retraso / sum(minutos_retraso))

# 10.- Los retrasos suelen estar correlacionados con el tiempo. 
#      Aunque el problema que ha causado el primer retraso de un avión se resuelva, 
#      el resto de vuelos se retrasan para que salgan primero los aviones que debían haber partido antes. 
#      Intenta usar la función lag() explora cómo el retraso de un avión se relaciona con el retraso del 
#      avión inmediatamente anterior o posterior.

df <- 1:15
df
lag(df)
lag(lag(df))

View(no_cancelados2 %>%
  select(year, month, day, tailnum, dep_delay) %>%
   lag())

# 11.-

View(no_cancelados2 %>%
  group_by(flight) %>%
    mutate(tiempo_minimo = min(air_time), cociente = air_time/tiempo_minimo)) %>%
      arrange(desc(cociente))
# 12 .-

no_cancelados2 %>%
  group_by(dest, carrier) %>%
    summarise(cuenta = n()) %>%
      group_by(dest) %>%
        summarise(carriers = n_distinct(carrier), cuenta, carrier) %>%
          filter(carriers >= 2)
            arrange(desc(cuenta))
