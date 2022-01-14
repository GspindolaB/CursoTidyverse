library(tidyverse)

### OPERACIONES DE CONJUNTOS ###
#intersect(x,y): observaciones comunes a x e y (x interseccion y)
#union(x,y): observaciones unicas en x e y (x union y)
#setdiff(x,y): observaciones en x pero no en y (x - y)

s <- tribble(
  ~a, ~b,
   1, 1,
   2, 1
)

b <- tribble(
  ~a, ~b,
   1, 1,
   1, 2
)

intersect(s,b)

union(s,b)

setdiff(s,b)

setdiff(b,s)

?union_all
