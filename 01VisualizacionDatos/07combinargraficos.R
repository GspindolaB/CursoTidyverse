ggplot(data = vehiculos) +
  geom_point(mapping = aes(x = displ, y = hwy, color = class))+
  geom_smooth(mapping = aes(x = displ, y = hwy, color = drv, linetype = class))

### COMBINAR GRAFICOS Y AÑADIR DIMENSIONES DE VISUALIZACION ###

ggplot(data = vehiculos) +
  geom_smooth(mapping = aes(x = displ, y = hwy, group = drv, color = drv),
                            show.legend = TRUE)

ggplot(data = vehiculos) +
  geom_point(mapping = aes(x = displ, y = cty)) +
  geom_smooth(mapping = aes(x = displ, y = cty))

#Con esto se evita duplicar los mapping para cada geometria

ggplot(data = vehiculos, mapping = aes(x = displ, y = cty)) +
  geom_point() +
  geom_smooth()

ggplot(data = vehiculos, mapping = aes(x = displ, y = cty)) +
  geom_point(mapping = aes(color = class)) +
  geom_smooth(mapping = aes(linetype = drv))

ggplot(data = vehiculos, mapping = aes(x = displ, y = cty)) +
  geom_point(mapping = aes(color = class)) +
  geom_smooth(mapping = aes(linetype = drv)) +
  facet_wrap(~drv)

ggplot(data = vehiculos, mapping = aes(x = displ, y = cty)) +
  geom_point(mapping = aes(color = class)) +
  geom_smooth(mapping = aes(linetype = drv)) +
  facet_grid(drv~.)

#Filtrar datos
ggplot(data = vehiculos, mapping = aes(x = displ, y = cty)) +
  geom_point(mapping = aes(color = class)) +
  geom_smooth(data = filter(vehiculos, class =="suv"), se = F) #El parametro se elimina el intervalo de confianza

ggplot(data = mpg, mapping = aes(x=displ, y = hwy)) + 
  geom_point(mapping = aes(color = drv, shape = drv)) + 
  geom_smooth(mapping = aes(linetype = drv), se = F)

ggplot(data = mpg) + 
  geom_point(mapping = aes(x=displ, y = hwy)) + 
  geom_smooth(mapping = aes(x=displ, y = hwy))

?geom_point

ggplot(data = vehiculos) + 
  geom_point(mapping = aes(x = displ, y = hwy, fill = drv), shape = 23, size = 5, color = "white", stroke = 3)
