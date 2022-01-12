### Los NA en la limpieza de los datos 

library(tidyverse)

roi <- tibble(
  year = c(rep(2016,4),rep(2017,4),2018),
  quarter = c(rep(c(1,2,3,4),2),1),
  return = rnorm(9, mean = 0.5, sd = 1)
)

#Accedemos a toda la tibble
roi

#Accedemos a la fila 7 de la columna return
roi$return[7]

#Seteamos el valor de la fila 7 de return a NA
roi$return[7] = NA

roi

roi %>%
  spread(year, return) %>%
  gather(year, return, `2016`:`2018`, na.rm = TRUE)

#La función complete sugiere que el dataset esta incompleto y muestra una sugerencia para completarlo
roi %>%
  complete(year, quarter)

tratamientos <- tribble(
  ~name,               ~tratamiento, ~response,
  "Guillermo Ricardo", 1,            8,
  NA,                  2,            10,
  NA,                  3,            4,
  "Julio César",       1,            7,
  NA,                  2,            9
)


tratamientos

#La función fill se encargará de rellenar los valores NAs por el valor más reciente del NA anterior
tratamientos %>%
  fill(name)
