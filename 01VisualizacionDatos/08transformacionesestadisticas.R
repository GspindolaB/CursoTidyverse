library(tidyverse)

diamantes <- diamonds
View(diamantes)

### TRANSFORMACIONES ESTADÍSTICAS BÁSICAS

#Geometría de barras
ggplot(data = diamantes) +
  geom_bar(mapping = aes(x = cut), color = "blue", fill ="white" )

ggplot(data = diamantes) +
  geom_bar(mapping = aes(x = clarity), color = "blue", fill ="white" )

?geom_bar

ggplot(data = diamantes) +
  stat_count(mapping = aes(x = cut), color = "blue", fill ="white" ) 

ggplot(data = diamantes) +
  stat_count(mapping = aes(x = clarity), color = "blue", fill ="white" ) +
  facet_wrap(~cut)

### CAMBIANDO LAS TRANSFORMACIONES ESTADISTICAS DE NUESTROS GRAFICOS ###

#La función tibble crea un conjunto de datos precalculado manualmente
demo_diamantes <- tribble(
  ~cut, ~freqs,
  "Fair", 1610,
  "Good", 4906,
  "Very Good", 12082,
  "Premium", 13791,
  "Ideal", 21551
)

?tribble

ggplot(data = demo_diamantes) +
  geom_bar(mapping = aes(x = cut, y = freqs), stat = "identity")

ggplot(data = diamantes) +
  geom_bar(mapping = aes(x = cut, y = ..prop.., group = 1))

ggplot(data = diamantes) +
  stat_summary(mapping = aes(x = cut, y = price),
               fun.ymin = min,
               fun.ymax = max,
               fun.y = median
               )

### TAREA ###

#¿Qué hace el parámetro geom_col? ¿En qué se diferencia de geom_bar?

ggplot(data = diamantes) + 
  geom_col(mapping = aes(x = cut, y = carat))

?geom_col

# To show (e.g.) means, you need geom_col()
df <- data.frame(trt = c("a", "b", "c"), outcome = c(2.3, 1.9, 3.2))
ggplot(df, aes(trt, outcome)) +
  geom_col()
# But geom_point() displays exactly the same information and doesn't
# require the y-axis to touch zero.
ggplot(df, aes(trt, outcome)) +
  geom_point()

?stat_smooth

vehiculos <- mpg

ggplot(data = vehiculos) +
  stat_smooth(mapping = aes(x = displ, y = hwy))

ggplot(data = diamonds) + 
  geom_bar(mapping = aes(x = cut, y = ..prop.., group = 1))

ggplot(data = diamonds) + 
  geom_bar(mapping = aes(x = cut, fill = color, y = ..prop.., group = 1))
