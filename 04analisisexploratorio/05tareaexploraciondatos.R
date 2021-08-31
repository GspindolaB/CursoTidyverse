diamantes <- diamonds

# 1.- Explora la distribución de las variables x, y, z del dataset de diamonds. ¿Qué podemos inferir?

rango_x <- diamantes %>%
  count(cut_width(x, 0.1))

rango_y <- diamantes %>%
  count(cut_width(y, 0.1))

rango_z <- diamantes %>%
  count(cut_width(z, 0.1))

# 2.- Explora la distribución del precio (price) del dataset de diamonds. 
#     ¿Hay algo que te llame la atención o resulte un poco extraño?
ggplot(data = diamantes, mapping = aes(x = x)) +
  geom_histogram(binwidth = 0.1) +
  coord_cartesian(ylim = c(0,100))

ggplot(data = diamantes, mapping = aes(x = y)) +
  geom_histogram(binwidth = 0.1) +
  coord_cartesian(ylim = c(0,100))

ggplot(data = diamantes, mapping = aes(x = z)) +
  geom_histogram(binwidth = 0.1) +
  coord_cartesian(ylim = c(0,100))

precio <- diamantes %>%
  count(cut_width(price, 1000))

ggplot(data = diamantes, mapping = aes(x = price)) +
  geom_histogram(binwidth = 1000)

# 3.- ¿Cuantos diamantes hay de 0.99 kilates? ¿Y de exactamente 1 kilate?
#     ¿A qué puede ser debida esta diferencia?
diamantes %>%
  filter(carat == 0.99)

diamantes %>%
  filter(carat == 1)

diamantes %>%
  filter(carat == 0.99) %>%
    ggplot(mapping = aes(x = cut)) +
      geom_bar()

diamantes %>%
  filter(carat == 1) %>%
  ggplot(mapping = aes(x = cut)) +
  geom_bar()

# 4.- Compara y contrasta el uso de las funciones coord_cartesian() frente xlim() y ylim() para hacer zoom en un histograma.
#     ¿Qué ocurre si dejamos el parámetro binwidth sin configurar?
#     ¿Qué ocurre si hacemos zoom y solamente se ve media barra?

ggplot(data = diamantes, mapping = aes(x = x)) +
  geom_histogram()

ggplot(data = diamantes, mapping = aes(x = x)) +
  geom_histogram(binwidth = 0.1) 

ggplot(data = diamantes, mapping = aes(x = x)) +
  geom_histogram() +
  coord_cartesian(ylim = c(0,100))

ggplot(data = diamantes, mapping = aes(x = x)) +
  geom_histogram(binwidth = 0.1) +
  coord_cartesian(ylim = c(0,100))

# 5.- ¿Qué ocurre cuando hay NAs en un histograma? 
#     ¿Qué ocurre cuando hay NAs en un diagrama de barras?
#     ¿Qué diferencias observas?

ggplot(data = good_diamonds_x, mapping = aes(x = x)) +
  geom_histogram()

ggplot(data = good_diamonds_x, mapping = aes(x = x)) +
  geom_bar()

# 6.- ¿Qué hace la opción na.rm = TRUE en las funciones mean() y sum()?

ggplot(data = good_diamonds_x, mapping = aes(x = x)) +
  geom_bar()

diamantes %>% 
  group_by(cut) %>%
    summarise(
      media = mean(carat, na.rm = T),
      suma = sum(price, na.rm = T)
    )



