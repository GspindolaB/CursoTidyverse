### SUBGRUPOS ###

# ¿Que determina que los elementos de un cluster sean similares entre si?
# ¿Que determina que clusters separados sean diferentes entre si?
# Describir y explicar cada uno de los clusters.
# ¿Porque alguna onservación puede ser clasificada en el cluster erróneo?

View(faithful)

View(faithfuld)

?faithful

ggplot(data = faithful, mapping = aes(x = eruptions)) +
  geom_histogram(binwidth = 0.2)
