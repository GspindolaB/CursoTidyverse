### AGRUPACIONES MULTIPLES Y DESAGRUPACIONES ###

# Agrupacion diaria
diaria <- group_by(vuelos, year, month, day)

(por_dia <- summarise(diaria, n_fl = n()))

(por_mes <- summarise(por_dia, n_fl = sum(n_fl)))

(por_año <- summarise(por_mes, n_fl = sum(n_fl)))

# Esto es lo mismo que todo lo anterior
por_dia <- diaria %>% 
  summarise(n_fl = n())

por_mes <- por_dia %>%
  summarise(n_fl = sum(n_fl))

por_año <- por_mes %>%
  summarise(n_fl = sum(n_fl))

# Agrupamos por carrier, origen y destino

aerolinea <- vuelos %>%
                group_by(carrier, origin, dest)

summarise(aerolinea, n_fl = n()) %>%
  summarise(n_fl = sum(n_fl)) %>%
    summarise(n_fl = sum(n_fl))

# Desagrupar: Podemos desagrupar los datos ya agrupados con la función ungroup

diaria %>%
  ungroup() %>%
    summarise(n_fl = n())

aerolinea %>%
  ungroup() %>%
    summarise(n_fl = n())

# Si queremos desagrupar de un resumen que ya fue llevado a cabo esto no es posible
summarise(aerolinea, n_fl = n()) %>%
  summarise(n_fl = sum(n_fl)) %>%
    summarise(n_fl = sum(n_fl)) %>%
      ungroup()

# Pero su hacemos un resumen despues de desagrupar éste ya no será llevado a cabo. 
# Aunque esto no tendría mucho sentido
summarise(aerolinea, n_fl = n()) %>%
  summarise(n_fl = sum(n_fl)) %>%
    summarise(n_fl = sum(n_fl)) %>%
      ungroup() %>%
        summarise(n_fl = sum(n_fl))

### MUTATE Y FILTERS POR SEGMENTO ###
vuelos %>%
  group_by(year, month, day) %>%
    filter(rank(desc(arr_delay)) < 10) -> temp

View(temp)    

mejores_destinos <- vuelos %>%
                      group_by(dest) %>%
                        filter(n() > 365)

mejores_destinos %>%
  filter(arr_delay > 0) %>%
    mutate(prop_delay = arr_delay / sum(arr_delay)) %>%
      select(year:day, dest, arr_delay, prop_delay)
