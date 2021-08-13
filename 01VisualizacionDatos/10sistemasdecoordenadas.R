### SISTEMAS DE COORDENADAS ###

#coord_flip = cambia los papeles de x e y 

ggplot(data = mpg, mapping = aes(x = class, y = hwy)) +
  geom_boxplot() +
  coord_flip()

#coord_quickmap = configura el aspect ratio para mapas

usa <- map_data("usa")

install.packages("maps", dep = TRUE)
library(maps)

ggplot(usa, aes(long, lat, group = group)) +
  geom_polygon(fill = "blue", color = "white") +
  coord_quickmap()

italy <- map_data("italy")

ggplot(italy, aes(long, lat, group = group)) +
  geom_polygon(fill = "blue", color = "white") +
  coord_quickmap()

#coord_polar = hace uso de las coordenadas polares

ggplot(data = diamantes) +
  geom_bar(mapping = aes(x = cut, fill = cut),
           show.legend = F,
           width = 1) +
  theme(aspect.ratio = 1) +
  labs(x = NULL, y = NULL) +
  coord_polar()


