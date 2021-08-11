#Activamos la librería de tidyverse

library(tidyverse)

# v ggplot2 3.3.5     v purrr   0.3.4
# v tibble  3.1.2     v dplyr   1.0.7
# v tidyr   1.1.3     v stringr 1.4.0
# v readr   2.0.0     v forcats 0.5.1

#Asigbamos el dataset de mpg por default de ggplot2 a una variable llamada vehiculos

vehiculos <- mpg

#Con la función View podremos visualizar todo el dataset 

View(vehiculos)

#La funcion help o el signo de ? antes de la funcion nos dan ayuda acerca del paquete o funcion a trabajar

?mpg

# Utilizando la funcion ggplot:
# El parámetro data indica el set de datos con el que se va a trabajar
# El parametro geom_point nos agrega la representacion grafica de puntos
# Cada que trabajemos con alguna geometria tenemos que agregar la caracteristica de mapping

ggplot(data = vehiculos) +
  geom_point(mapping = aes(x = displ, 
                           y = hwy
                           )
             )

# Plantilla para hacer una representación gráfica con ggplot
#ggplot(data = <DATA_FRAME>) +
#  <GEOM_FUNCTION>(mapping = aes(<MAPPINGS>))

?ggplot


#Ejemplos de la documentacion de ggplot
df <- data.frame(
  gp = factor(rep(letters[1:3], each = 10)),
  y = rnorm(30)
)

ds <- do.call(rbind, lapply(split(df, df$gp), function(d) {
  data.frame(mean = mean(d$y), sd = sd(d$y), gp = d$gp)
}))

ggplot(df, aes(gp, y)) +
  geom_point() +
  geom_point(data = ds, aes(y = mean), colour = 'red', size = 3)
