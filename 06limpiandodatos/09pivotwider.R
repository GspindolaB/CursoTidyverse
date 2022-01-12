library(tidyverse)

### UNPIVOTING ###

table2

tidy_wider <- table2 %>%
  pivot_wider(names_from = type, values_from = count)

tidy_wider
