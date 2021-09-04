library(tidyverse)

### VISUALIZACIÓN DE PATRONES ###

diamonds %>%
  count(cut, clarity) %>%
    ggplot(mapping = aes(clarity, cut, fill = n)) +
      geom_tile()

# RELACIONES Y LOS PATRONES
# ¿Coincidencias?
# ¿Relaciones que implica dicho patrón?
# ¿Fuerza de la relación?
# ¿Otras variables afectadas?
# ¿Subgrupos?

# Aparentemente las erupciones mpequeñas tienen un tiempo de espera menor al de las erupciones grandes
ggplot(data = faithful) +
  geom_point(mapping = aes(x = eruptions, y = waiting))

# Istalamos la libreria de modelr que nos sirve para crear modelos

install.packages("modelr")
library(modelr)

modelo <- lm(log(price) ~log(carat), data = diamonds)

modelo

diamonds_predicion <- diamonds %>%
  add_residuals(modelo) %>%
    mutate(res = exp(resid))

ggplot(data = diamonds_predicion) +
  geom_point(mapping = aes(x = carat, y = resid))

ggplot(data = diamonds_predicion) +
  geom_boxplot(mapping = aes(x = cut, y = resid))
