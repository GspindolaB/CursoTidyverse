ggplot(data = vehiculos) +
  geom_point(mapping = aes(x = displ, y = hwy)) +
  facet_wrap(~class, scales = "free")

ggplot(data = vehiculos) +
  geom_point(mapping = aes(x = displ, y = hwy)) +
  facet_grid(.~drv)
