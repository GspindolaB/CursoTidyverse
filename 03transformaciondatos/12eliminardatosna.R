### ELIMINAR LOS NA DE LOS DATOS ###

# Con la caracteristica de na.rm = T quitamos los NA del resumén de nuestros datos
vuelos %>%
  group_by(year,month,day) %>%
    summarise(mean = mean(dep_delay, na.rm = T),
              median = median(dep_delay, na.rm = T),
              sd = sd(dep_delay, na.rm = T),
              count = n())

mo_cancelados <- vuelos %>%
  filter(!is.na(dep_delay), !is.na(arr_delay))

mo_cancelados %>%
  group_by(year,month,day) %>%
  summarise(mean = mean(dep_delay, na.rm = T),
            median = median(dep_delay, na.rm = T),
            sd = sd(dep_delay, na.rm = T),
            count = n())

# Esto es igual a lo anterior
vuelos %>%
  filter(!is.na(dep_delay), !is.na(arr_delay)) %>%
  group_by(year,month,day) %>%
  summarise(mean = mean(dep_delay, na.rm = T),
            median = median(dep_delay, na.rm = T),
            sd = sd(dep_delay, na.rm = T),
            count = n())
  