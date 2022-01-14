library(tidyverse)

library(nycflights13)

nycflights13::airlines #Aerolineas

nycflights13::airports #Aeropuertos

nycflights13::flights #Vuelos

nycflights13::planes #Aviones

nycflights13::weather #Clima

planes %>%
  count(tailnum) %>%
    filter(n > 1)

weather %>%
  count(year, month, day, hour, origin) %>%
    filter(n > 1)
