library(tidyverse)

install.packages("nycflights13")

library(nycflights13)

nycflights13::flights

View(weather)

getwd()

setwd()

?setwd

ggplot(data = diamonds, mapping = aes(x = carat, y = price)) +
  geom_hex()

ggsave("diamonds_hex.pdf") #Esta funcion nos permite guardar el ultimo ggplot ejecutado

write.csv(diamonds, "diamonds.csv") #Esta funcion nos permite guardar la informacion de un data set en un 

write.csv(flights, "02fundamentos/vuelos.csv")
write.csv(airlines, "02fundamentos/aerolineas.csv")
write.csv(airports, "02fundamentos/aeropuertos.csv")
write.csv(planes, "02fundamentos/aviones.csv")
write.csv(weather, "02fundamentos/clima.csv")
