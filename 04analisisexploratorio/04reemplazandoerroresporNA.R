diamantes <- diamonds

ggplot(data = diamantes) +
  geom_histogram(mapping = aes(x = x), binwidth = 0.5)

diamantes %>%
  count(cut_width(x, 0.5))
# Con coord_cartenian podemos cambiar los limites de las coordenadas cartesianas
ggplot(data = diamantes) +
  geom_histogram(mapping = aes(x = x), binwidth = 0.5) +
  coord_cartesian(ylim = c(0,100))

ggplot(data = diamantes) +
  geom_histogram(mapping = aes(x = y), binwidth = 0.5) 

diamantes %>%
  count(cut_width(y, 0.5))

ggplot(data = diamantes) +
  geom_histogram(mapping = aes(x = y), binwidth = 0.5) +
  coord_cartesian(ylim = c(0,100))

unusual_diamonds_x <- diamantes %>%
  filter(x < 3 | x > 10)

unusual_diamonds_y <- diamantes %>%
  filter(y < 3.75 | y > 9.75)

View(unusual_diamonds_x %>%
       select(price,x,y,z) %>%
       arrange(x))

View(unusual_diamonds_y %>%
       select(price,x,y,z) %>%
       arrange(y))

### REEMPLAZANDO ERRORES POR NAs ###

# Usar filter con dplyr: Opción menos recomendable ya que elimina toda la fila

good_diamonds_x <- diamantes %>%
  filter(between(x,3, 10))

good_diamonds_y <- diamantes %>%
  filter(between(y, 3.75, 9.75))

# Usar la función ifelse() para reemplazar los valores por NA

good_diamonds_x <- diamantes %>%
  mutate(x = ifelse(x < 3 | x > 10, NA, x))

good_diamonds_y <- diamantes %>%
  mutate(x = ifelse(y < 3.75 | y > 9.75, NA, y))

View(good_diamonds_x)

ggplot(data = good_diamonds_x, mapping = aes(x = x, y = y)) +
  geom_point()

ggplot(data = good_diamonds_y, mapping = aes(x = x, y = y)) +
  geom_point()

ggplot(data = good_diamonds_x, mapping = aes(x = x, y = y)) +
  geom_point(na.rm = T)

ggplot(data = good_diamonds_y, mapping = aes(x = x, y = y)) +
  geom_point(na.rm = T)

library(nycflights13)

flights %>%
  mutate(
    cancelado = is.na(air_time),
    sched_hour = sched_dep_time %/% 100,
    sched_minute = sched_dep_time %% 100,
    sched_departure_time = sched_hour + sched_minute / 60
  ) %>%
    ggplot(mapping = aes(x = sched_departure_time)) +
      geom_freqpoly(mapping = aes(color = cancelado), binwidth = 1/4)

