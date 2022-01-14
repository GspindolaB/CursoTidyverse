library(tidyverse)

library(nycflights13)

flights_new <- flights %>%
  select(year:day, hour, origin, dest, tailnum, carrier)

flights_new

#Hacemos un left join y se muta el dataset original
flights_new %>%
  left_join(airlines, by = "carrier") %>%
    select(-carrier)

#También podemos hacer esto con el paquete base pero es mucho más complicado
flights_new %>%
  mutate(name = airlines$name[match(carrier, airlines$carrier)])

x <- tribble(
  ~key, ~value_x,
    1,  "x1",
    2,  "x2",
    3,  "x3"
)

y <- tribble(
  ~key, ~value_x,
  1,  "y1",
  2,  "y2",
  4,  "y3"
)

inner <- x %>%
  inner_join(y, by = "key")

left <- x %>%
  left_join(y, by = "key")

right <- x %>%
  right_join(y, by = "key")

full <- x %>%
  full_join(y, by = "key")

inner

left

right

full
