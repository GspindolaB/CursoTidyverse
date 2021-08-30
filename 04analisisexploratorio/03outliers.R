View(faithful)

ggplot(data = faithful, mapping = aes(x = eruptions)) +
  geom_histogram(binwidth = 0.2)

### OUTLIERS ###

# Los outliers son observaciones inusuales que se llegan a presentar

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

