vehiculos <- mpg

View(vehiculos)

### FACETS ###

# facet_wrap(~<FORMULA_VARIABLE>): la variable debe de ser discreta y no continua

ggplot(data = vehiculos) +
  geom_point(mapping = aes(x = displ, y = hwy)) +
  facet_wrap(~class)

ggplot(data = vehiculos) +
  geom_point(mapping = aes(x = displ, y = hwy)) +
  facet_wrap(~class, nrow = 2)

# facet_grid(<FORMULA_VARIABLE1>~<FORMULA_VARIABLE2>)