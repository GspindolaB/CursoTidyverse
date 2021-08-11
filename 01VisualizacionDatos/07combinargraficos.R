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

              