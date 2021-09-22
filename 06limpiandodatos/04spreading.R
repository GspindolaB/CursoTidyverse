table2

# Hacemos spreading para separar en diferentes columnas los valores

table2 %>%
  spread(key = type, value = count) -> tidy2

tidy2
