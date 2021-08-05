ggplot(data = vehiculos) +
  geom_point(mapping = aes(x = displ, y = hwy, color = displ < 4, size = cty, stroke = displ), shape = 15)
