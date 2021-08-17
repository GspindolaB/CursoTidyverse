### LA MAGIA OSCURA DE LAS PIPES ###

# Agrupo el set de datos por destino
group_by_dest <- group_by(vuelos, dest)

# Asigna a la variable demora el numero de vuelos, la media de la distancia y el retraso de salida
# del set de datos previamente creado
demora <- summarise(group_by_dest, 
          cuenta = n(),
          distancia = mean(distance, na.rm = TRUE),
          delay = mean(dep_delay, na.rm = TRUE)
          )

View(demora)

# Filtra los datos para los aeropuertos cuyos vuelos son más de 100 y el destino no es el aeropuerto Honolulu
demora2 <- filter(demora, cuenta > 100, dest != "HNL")

# Creamos un gráfico para representar los vuelos
ggplot(data = demora2, mapping = aes(x = distancia, y = delay)) +
  geom_point(aes(size = cuenta), alpha = 0.2) +
  geom_smooth(se = F) +
  geom_text(aes(label = dest), alpha = 0.3)

### PIPES ###

# Todo lo que hicimos anteriormente se puede resumir de la siguiente manera
vuelos %>%
  group_by(dest) %>%
    summarise(cuenta = n(),
              delay = mean(dep_delay, na.rm = TRUE),
              distance = mean(distance, na.rm = TRUE)) %>%
                filter(dest != "HNL", cuenta > 100) %>%
                  ggplot(mapping = aes(x =distance, y = delay)) +
                    geom_point(aes(size = cuenta), alpha = 0.2) +
                    geom_smooth(se = F)+
                    geom_text(aes(label = dest), alpha = 0.3)

#
