library(tidyverse)

install.packages("gapminder")

library(gapminder)

### OBJETIVO DE TIDYR ###

# Variables en columnas
# Observaciones en filas
# Valores en celdas

tabla <- read_csv("data/population.csv")

View(tabla)

tabla %>%
  mutate(rate = cases/population*10000)

tabla %>%
  count(year, wt = cases)

tabla %>%
  ggplot(aes(year, cases)) +
  geom_line(aes(group = country), color = "grey") +
  geom_point(aes(color = country))


