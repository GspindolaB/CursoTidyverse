### CREANDO TIBBLES DE TIDYVERSE ###

# Creamos una tibble con la función de tibble()

t <- tibble(
  x = 1:10,
  y = pi,
  z = pi * x^2
)

t # Mostramos toda la tible

t$x # Accedemos a toda la columna de x

t$y # Accedemos a toda la columna de y
 
t$z # Accedemos a toda la columna de x

t[1,] # Accedemos a la primera fila

t[5,3] # Accedemos a la quinta fila de la tercera columna

t[,3] # Accedemos a la tercera columna

# Creamos otra tibble
t2 <- tibble(
  ':)' = "smile",
  ' ' = "space",
  '1998' = "number"
)

# También podemos crear tibbles con la función tribble
t3 <- tribble(
  ~a, ~b, ~c,
  "a", 1,  Sys.Date() - 1,
  "b", 2,  Sys.Date() - 2,
  "c", 3,  Sys.Date() - 3
)

t3
