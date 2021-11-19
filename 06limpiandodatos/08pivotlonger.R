library(tidyverse)

### PIVOTING ###

table3

tidy4a <- table4a %>%
  pivot_longer(c(`1999`,`2000`), names_to = "year", values_to = "cases")

tidy4b <- table4b %>%
  pivot_longer(c(`1999`,`2000`), names_to = "year", values_to = "population")

tidy4a
tidy4b

# juntamos la tabla con un join
union <- left_join(tidy4a, tidy4b)

union
