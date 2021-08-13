library(tidyverse)

diamantes <- diamonds

ggplot(data = diamantes) +
  geom_bar(mapping = aes(x = cut))

#Colores y formas del grafico
ggplot(data = diamantes) +
  geom_bar(mapping = aes(x = cut, color = cut))

ggplot(data = diamantes) +
  geom_bar(mapping = aes(x = cut, fill = cut))

ggplot(data = diamantes) +
  geom_bar(mapping = aes(x = cut, fill = clarity))

ggplot(data = diamantes) +
  geom_bar(mapping = aes(x = cut, fill = color))

### PARÁMETRO POSITION ###

#position = "identity": 
ggplot(data = diamantes, mapping = aes(x = cut, fill = clarity)) +
  geom_bar(alpha = 0.2, position = "identity")

ggplot(data = diamantes, mapping = aes(x = cut, color = clarity)) +
  geom_bar(fill = NA, position = "identity")

#position = "fill":
ggplot(data = diamantes, mapping= aes(x = cut, fill = clarity)) +
  geom_bar(position = "fill")

#position = "dodge"
ggplot(data = diamantes, mapping= aes(x = cut, fill = clarity)) +
  geom_bar(position = "dodge")


#Gráfico de dispersión

#position = "jitter"
ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) +
  geom_point(position = "jitter")

ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) +
  geom_jitter()

?position_stack
?position_identity
?position_fill
?position_dodge
?position_jitter
