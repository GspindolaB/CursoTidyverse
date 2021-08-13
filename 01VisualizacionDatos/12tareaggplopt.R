### TAREA FINAL ###

#1.- El siguiente gráfico que genera el código de R es correcto pero puede mejorarse. 
#¿Qué cosas añadirías para mejorarlo?

ggplot(data = mpg, mapping = aes(x = cty, y = hwy )) + 
  geom_point(aes(color = drv), position = "jitter")

#2.- Investiga la documentación de geom_jitter(). 
#¿Qué parámetros controlan la cantidad de ruído aleatorio (jitter)?

?geom_jitter

p <- ggplot(mpg, aes(cyl, hwy))
p + geom_point()
p + geom_jitter()

# Add aesthetic mappings
p + geom_jitter(aes(colour = class))

# Use smaller width/height to emphasise categories
ggplot(mpg, aes(cyl, hwy)) +
  geom_jitter()
ggplot(mpg, aes(cyl, hwy)) +
  geom_jitter(width = 0.25)

# Use larger width/height to completely smooth away discreteness
ggplot(mpg, aes(cty, hwy)) +
  geom_jitter()
ggplot(mpg, aes(cty, hwy)) +
  geom_jitter(width = 0.5, height = 0.5)

#3.- Compara las funciones geom_jitter contra geom_count y busca semejanzas y diferencias entre ambas.

ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) +
  geom_jitter()

ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) +
  geom_count()

#4.- ¿Cual es el valor por defecto del parámetro position de un geom_boxplot? 
#Usa el dataset de diamonds o de mpg para hacer una visualización que lo demuestre.
?geom_boxplot

ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) +
  geom_boxplot()

p <- ggplot(mpg, aes(class, hwy))
p + geom_boxplot()

#5.- Convierte un diagrama de barras apilado en un diagrama de sectores o de tarta 
#usando la función coord_polar()
polar <- ggplot(data = mpg, mapping = aes(x = class)) 
polar + geom_bar(aes(fill= drv),position = "dodge") +
  coord_polar()
 
#7 ¿En qué se diferencian las funciones coord_quickmap() y coord_map()?

italia <- map_data("italy")

ggplot(data = italia, mapping = aes(x = long, y = lat, group = group)) +
  geom_polygon(fill = "green", color = "white") +
  coord_fixed(ratio = 1)

?geom_abline

#10 ¿Qué nos indica el gráfico siguiente acerca de la relación entre el consumo en ciudad 
#y en autopista del dataset de mpg?

ggplot(data = mpg, mapping = aes(x = cty, y = hwy )) + 
  geom_point() + 
  geom_abline() + 
  coord_fixed()
