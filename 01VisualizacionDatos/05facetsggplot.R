vehiculos <- mpg

View(vehiculos)

### FACETS ###

# facet_wrap(~<FORMULA_VARIABLE>): la variable debe de ser discreta y no continua

ggplot(data = vehiculos) +
  geom_point(mapping = aes(x = displ, y = hwy)) +
  facet_wrap(~class)

ggplot(data = vehiculos) +
  geom_point(mapping = aes(x = displ, y = hwy)) +
  facet_wrap(~class, ncol = 2)

ggplot(data = vehiculos) +
  geom_point(mapping = aes(x = displ, y = hwy)) +
  facet_wrap(~class, ncol = 2 , scales = "free")

ggplot(data = vehiculos) +
  geom_point(mapping = aes(x = displ, y = hwy)) +
  facet_wrap(~class, ncol = 2 , shrink = FALSE)

# facet_grid(<FORMULA_VARIABLE1>~<FORMULA_VARIABLE2>)

ggplot(data = vehiculos) +
  geom_point(mapping = aes(x = displ, y = hwy)) +
  facet_grid(drv~cyl)

ggplot(data = vehiculos) +
  geom_point(mapping = aes(x = displ, y = hwy)) +
  facet_grid(.~cyl)

ggplot(data = vehiculos) +
  geom_point(mapping = aes(x = displ, y = hwy)) +
  facet_grid(drv~.)

ggplot(data = vehiculos) +
  geom_point(mapping = aes(x = displ, y = hwy)) +
  facet_grid(class~.)

?facet_grid
