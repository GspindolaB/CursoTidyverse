### COVARIACION ###

# COVARIACIÓN A TRAVÉS DE LAS DENSIDADES

# Variable categorica VS Variable continua ###

ggplot(data = diamonds, mapping = aes(price)) +
  geom_freqpoly(mapping = aes(color = cut), binwidth = 500)

ggplot(data = diamonds, mapping = aes(x = cut)) +
  geom_bar()

ggplot(data = diamonds, mapping = aes(x = price, y = ..density..)) +
  geom_freqpoly(mapping = aes(color = cut), binwidth = 500)

# COVARIACIÓN A TRAVÉS DE BOXPLOTS

ggplot(data = diamonds, aes(x = cut, y = price)) +
  geom_boxplot()

ggplot(data = mpg, mapping = aes(x = class, y = hwy)) +
  geom_boxplot()

# Con reorder podemos ordenar el boxplot
ggplot(data = mpg) +
  geom_boxplot(mapping = aes(x = reorder(class, hwy, FUN = median),y = hwy))

# Con coord_flip cambiamos las coordenadas cartesianas
ggplot(data = mpg) +
  geom_boxplot(mapping = aes(x = reorder(class, hwy, FUN = median),y = hwy)) +
  coord_flip()

# COVARIACIÓN DE FACTORES A TRAVÉS DE HEATMAPS 

# Variable categórica VS Variable categórica

ggplot(data = diamonds) +
  geom_count(mapping = aes(x = cut, y = color))

diamonds %>%
  count(color, cut)

diamonds %>%
  count(color, cut) %>%
    ggplot(mapping = aes(x = cut, y = color)) +
      geom_tile(mapping = aes(fill = n))

# Paquetes de ayuda para visualización de datos
# d3heatmap
# heatmaply

install.packages("d3heatmap", dep = TRUE)
install.packages("heatmaply", dep = TRUE)

library(heatmaply)

?heatmaply

### COVARIACIÓN DE VARIABLES CONTINUAS CON SCATTERPLOTS ###

# Variable continua VS Variable continua

ggplot(data = diamonds) +
  geom_point(mapping = aes(x = carat, y = price), alpha = 0.02)

install.packages("hexbin")
library(hexbin)

ggplot(data = diamonds) +
  geom_bin2d(mapping = aes(x = carat, y = price))

ggplot(data = diamonds) +
  geom_hex(mapping = aes(x = carat, y = price))

diamonds %>%
  filter(carat < 3) %>%
    ggplot(mapping = aes(x = carat, y = price)) +
      geom_boxplot(mapping = aes(group = cut_width(carat, 0.1)))

diamonds %>%
  filter(carat < 3) %>%
  ggplot(mapping = aes(x = carat, y = price)) +
  geom_boxplot(mapping = aes(group = cut_width(carat, 0.1)), varwidth = T)

diamonds %>%
  filter(carat < 3) %>%
  ggplot(mapping = aes(x = carat, y = price)) +
  geom_boxplot(mapping = aes(cut_number(carat, 20)))

diamonds %>%
  filter(carat < 3) %>%
  ggplot(mapping = aes(x = carat, y = price)) +
  geom_boxplot(mapping = aes(cut_number(carat, 20)))
