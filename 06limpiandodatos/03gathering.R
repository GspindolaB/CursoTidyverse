library(tidyverse)

table4a
table4b

# Hacemos gathering para juntar en una misma columna los valores de 1999 y 2000
table4a %>%
  gather(`1999`,`2000`, key = year, value = "cases") -> tidy4a

table4b %>%
  gather(`1999`,`2000`, key = year, value = "population") -> tidy4b

# Hacemos un left join y cómo la columna en común tiene el mismo nombre en ambas tablas se realiza
# de manera automatica
left_join(tidy4a, tidy4b)


