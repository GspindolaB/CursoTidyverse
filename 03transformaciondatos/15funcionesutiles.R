### FUNCIONES UTILES ###

# Medidas de centralización

no_cancelados %>%
  group_by(carrier) %>%
    summarise(media = mean(arr_delay),
              media2 = mean(arr_delay[arr_delay>0]),
              meadiana = median(arr_delay)
              )


# Medidad de dispersion

no_cancelados %>%
  group_by(carrier) %>%
    summarise(sd = sd(arr_delay),
              iqr = IQR(arr_delay),
              mad = mad(arr_delay)) %>%
                arrange(desc(sd))

# Medidas de orden

no_cancelados %>%
  group_by(carrier) %>%
    summarise(first = min(arr_delay),
              q1 = quantile(arr_delay, 0.25),
              median = quantile(arr_delay, 0.5), # Esto es igual a median()
              q3 = quantile(arr_delay, 0.75),
              last = max(arr_delay))

# Medidas de posicion

no_cancelados %>%
  group_by(carrier) %>%
    summarise(first_dep = first(dep_time), # Primero
              second_dep = nth(dep_time, 2), # Segundo
              third_dep = nth(dep_time, 3),# Tercero
              last_dep = last(dep_time)) # Ultimo

View(no_cancelados %>%
  group_by(carrier) %>%
    mutate(rank = min_rank(dep_time)) %>%
      filter(rank %in% range(rank)))

# Funciones de conteo
flights %>% 
  group_by(dest) %>%
    summarise(count = n(),
              carriers = n_distinct(carrier),
              arrivals = sum(!is.na(arr_delay))) %>%
                arrange(desc(carriers))

no_cancelados %>% 
  count(dest) # Cuenta el numero de vuelos por destino

no_cancelados %>%
  count(tailnum) # Cuenta el numero de vuelos por matricula

no_cancelados %>%
  count(tailnum, wt = distance) # Cuenta el numero de vuelos por matricula pero tomando como valor la distancia recorrida

### sum/mean de valores lógicos

# Vuelos que salieron antes de las 5 de la mañana
no_cancelados %>%
  group_by(year, month, day) %>%
    summarise(n_prior_5 = sum(dep_time < 500))

# Promedio de vuelos que tuvieron una demora mayor a una hora
no_cancelados %>%
  group_by(year, month, day) %>%
    summarise(more_than_hour_delay = mean(arr_delay > 60))

# Promedio de vuelos por compañia con una demora mayor a una hora
no_cancelados %>%
  group_by(carrier) %>%
  summarise(more_than_hour_delay = mean(arr_delay > 60)) %>%
    arrange(desc(more_than_hour_delay))

