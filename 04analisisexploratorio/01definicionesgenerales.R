library(tidyverse)

### ANÁLISIS EXPLORATORIO DE DATOS ###

# Modelar
# Representación gráfica
# Transformar datos

# ¿Que tipo de variaciones sufren las variables?
# ¿Que tipo de covariacion sufren las variables?

# Variable: Cantidad, factor o propiedad medible
# Valor: Estado de una variable al ser medida
# Observación: Conjunto de medidad tomadas en condiciones similares
#              data point, conjunto de valores tomados para cada variable
# Datos tabulares: Conjunto de valores asociado a cada variable y observación
#                  si los datos están limpios, cada valor tiene su propia celda,
#                  cada variable tiene su columna y cada observación su fila

### VARIACIÓN ###

## Variables categoricas: factor o vector de caracteres

# Representaciín gráfica
ggplot(data = diamonds) +
  geom_bar(mapping = aes(x = cut))

# Representación numérica
diamonds %>%
  count(cut)
  
## Variables continuas: Conjunto infinito de valores ordenados (números, fechas)

# Representacion gráfica
ggplot(data = diamonds) +
  geom_histogram(mapping = aes(x = carat), binwidth = 0.5) # El parámetro binwidth nos permite crear un intervalo

# Representación numérica
diamonds %>%
  count(cut_width(carat, 0.5)) # El parámetro cut_width nos permite contar para un intervalo establecido
  
diamonds_filter <- diamonds %>%
  filter(carat < 3)

ggplot(data = diamonds_filter) +
  geom_histogram(mapping = aes(x = carat), binwidth = 0.05)

ggplot(data = diamonds_filter) + 
  geom_freqpoly(mapping = aes(x = carat, color = cut), binwidth = 0.1)
