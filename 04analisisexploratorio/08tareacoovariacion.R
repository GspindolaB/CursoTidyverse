# 1.-

flights %>%
  mutate(
    cancelado = is.na(air_time),
    sched_hour = sched_dep_time %/% 100,
    sched_minute = sched_dep_time %% 100,
    sched_departure_time = sched_hour + sched_minute / 60
  ) %>%
  ggplot(mapping = aes(x = sched_departure_time)) +
  geom_freqpoly(mapping = aes(color = cancelado), binwidth = 1/4)

# 2.-

diamonds %>%
  group_by(cut) %>%
    summarise(mediaquilate = mean(carat),
              mediaprecio = mean(price)) %>%
      mutate(promedio = mediaprecio * mediaquilate)

# 3.-
install.packages("ggstance")
library(ggstance)

ggplot(diamonds, mapping = aes(x = price, y = cut)) +
  geom_boxplot() +
  coord_flip()

ggplot(diamonds, mapping = aes(x = cut, y = price)) +
  geom_boxploth() 

ggplot(diamonds, mapping = aes(x = price, y = cut)) +
  geom_boxploth() 

ggplot(diamonds, mapping = aes(x = price, y = cut)) +
  geom_boxploth() +
  coord_flip()

# 4.-
install.packages("lvplot")
library(lvplot)

?geom_lv

ggplot(data = diamonds, mapping = aes(x = cut, y = price)) +
  geom_lv(aes(fill = ..LV..)) 


# 5.- 

?geom_violin
?geom_histogram

ggplot(data = diamonds, mapping = aes(x = price)) +
  geom_histogram()

ggplot(data = diamonds, mapping = aes(x = cut, y = price)) +
  geom_violin()

ggplot(data = diamonds, mapping = aes(x = price)) +
  geom_freqpoly()

# 6.- 
install.packages("ggbeeswarm")
library(ggbeeswarm)
  
?geom_beeswarm
?geom_quasirandom
?position_beeswarm
?position_quasirandom

ggplot(data = mpg, mapping = aes(x = class, y = hwy)) +
  geom_jitter()

ggplot(data = mpg, mapping = aes(x = class, y = cty)) +
  geom_beeswarm()

ggplot(data = mpg, mapping = aes(x = class, y = cty)) +
  geom_quasirandom()

# 7.- 

diamonds %>%
  count(color, cut) %>%
  ggplot(mapping = aes(x = cut, y = color)) +
  geom_tile(mapping = aes(fill = n))

diamonds %>%
  count(color, cut) %>%
  ggplot(mapping = aes(x = color, y = cut)) +
  geom_tile(mapping = aes(fill = n))

#8.-

library(nycflights13)

flights %>%
  group_by(year,month, dest) %>%
    summarise(promedio_retraso = mean(arr_delay, na.rm = T)) %>%
      ggplot(mapping = aes(x = month, y = dest)) +
        geom_tile(mapping = aes(fill = promedio_retraso))

flights %>%
  group_by(month, dest) %>%
  summarise(promedio_retraso = mean(arr_delay, na.rm = T)) %>%
  ggplot(mapping = aes(x = month, y = dest)) +
  geom_raster(mapping = aes(fill = promedio_retraso), interpolate = T)

flights %>%
  group_by(month, dest) %>%
  summarise(promedio_retraso = mean(arr_delay, na.rm = T)) %>%
  heatmaply()

# 9.- 
?cut_width

ggplot(data = diamonds, mapping = aes(x = carat, y = price)) +
  geom_point()

ggplot(data = diamonds, mapping = aes(x = carat, y = cut_width(price, 1000))) +
  geom_point()

ggplot(data = diamonds, mapping = aes(x = carat, y = cut_number(price, 20))) +
  geom_point()

View(diamonds)

# 10 .-

diamonds %>%
  mutate(tamanio = x*y*z) %>%
    ggplot(mapping = aes(x = price, y = cut_width(tamanio, 20))) +
      geom_point()

diamonds %>%
  mutate(tamanio = x*y*z) %>%
  ggplot(mapping = aes(x = price, y = tamanio)) +
  geom_boxplot()

# 11.- 

ggplot(data = diamonds, mapping = aes(x = carat, y = price, color = cut)) +
  geom_point()

ggplot(data = diamonds, mapping = aes(x = carat, y = price, color = cut)) +
  geom_line()

diamonds %>%
  group_by(cut, carat) %>%
    summarise(suma = sum(price)) %>%
      ggplot(mapping = aes(x = cut, y = suma, color = suma)) +
        geom_boxplot()
