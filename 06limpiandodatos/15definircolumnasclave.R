library(tidyverse)

#Hace el join de forma natural porque las columnas en ambos dataframes tienen el mismo nombre
flights_new %>% 
  left_join(weather)

planes

#Hacemos el join indicando el campo explicitamente con el parametro by cuando las columnas en ambos
#dataframes tienen el mismo nombre
flights_new %>%
  left_join(planes, by = "tailnum")

airports

#Hacemos el join cuando los campos a comparar tienen diferente nombre en ambos datasets
flights_new %>%
  left_join(airports, by = c("dest" = "faa"))

flights_new %>%
  left_join(airports, by = c("origin" = "faa"))
