### EL EJEMPLO DEL BEISBOL ###

# Instalamos el paquete Lahman
install.packages("Lahman")

# Visualizamos el dataset de Batting
View(Lahman::Batting)

# Ayuda del paquete Lahman
?Lahman

# El set de datos lo pasamos a una tibble y además se asigna a una variable
batting <- as_tibble(Lahman::Batting)

# Agrupamos el set de datos creado anteriormente por jugador y creamos unas metricas adicionales
batters <- batting %>%
            group_by(playerID) %>%
               summarise(hits = sum(H, na.rm = T),
                         bats = sum(AB, na.rm = T), 
                         bat.average = hits / bats)

# Filtramos aquellos que tengan mas de cien turnos al bat y creamos una visuallizacion
batters %>%
  filter(bats > 100) %>%
    ggplot(mapping = aes(x = bats, y = bat.average)) +
      geom_point(alpha = 0.2) +
      geom_smooth(se = F)





