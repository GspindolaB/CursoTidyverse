ggplot(data = vehiculos) +
  geom_point(mapping = aes(x = displ, y = hwy)) +
  facet_wrap(~class, scales = "free")

ggplot(data = vehiculos) +
  geom_point(mapping = aes(x = displ, y = hwy)) +
  facet_grid(.~drv)

### GEOMETRIAS DE GGPLOT ###

#Geometría de puntos
ggplot(data = vehiculos) +
  geom_point(mapping = aes(x = displ, y = hwy))

#Geometría de smooth
ggplot(data = vehiculos) +
  geom_smooth(mapping = aes(x = displ, y = hwy))

ggplot(data = vehiculos) +
  geom_smooth(mapping = aes(x = displ, y = hwy, linetype = drv, color = class))

#Geometría de lineas
ggplot(data = vehiculos) +
  geom_line(mapping = aes(x = displ, y = hwy))

#Mezcla de geometrias
ggplot(data = vehiculos) +
  geom_point(mapping = aes(x = displ, y = hwy, color = class)) +
  geom_smooth(mapping = aes(x = displ, y = hwy, linetype = drv, color = class))

?geom_smooth



