library(tidyverse)

#FILTERING JOINS

# semi_join(x,y) -> se queda con las observaciones de x que tienen correspondencia en y
# anti_join(x,u) -> elimina todas las onservaciones de x que tienen correspondencia en y

flights %>%
  count(dest, sort = TRUE) %>%
  head(10) -> top10

flights %>%
  filter(dest %in% top10$dest)

# Se mostraran los vuelos que tengan correspondencia con los 10 destinos más frecuentes
flights %>%
  semi_join(top10)

# Se mostraran todos los vuelos, excepto los que tengan correspondencia con los 10 destinos más frecuentes
flights %>%
  anti_join(top10)

flights %>%
  anti_join(planes, by = "tailnum") %>%
    count(tailnum, sort = TRUE)
