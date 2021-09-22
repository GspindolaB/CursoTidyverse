table3

# separate: Separa la información contenida en una columna en varias columnas
# internamente tidyr tiene una lista de separadores por lo que si es un separador conocido,
# no hará falta indiicarlo
table3 %>%
  separate(rate, into = c("cases", "population"))

# Por defecto las columnas se generan con el tipo de datos de origen
table3 %>%
  separate(rate, into = c("cases", "population"), sep = "/")

table3 %>%
  separate(rate, into = c("cases", "population")) %>%
  mutate(rate = parse_integer(cases)/parse_integer(population))

# Con el parametro convert = TRUE le indicamos que trate de convertir el tipo de dato al más idóneo
table3 %>%
  separate(rate, into = c("cases", "population"), sep = "/", convert = T)

table3 %>%
  separate(rate, into = c("cases", "population"), sep = "/", convert = T) %>%
    mutate(rate = cases / population)

# Al colocar un número entero cómo separador, estamos indicando que llevara a cabo la separación a través
# de ese digito
table3 %>%
  separate(rate, into = c("cases", "population"), sep = "/", convert = T) %>%
    separate(year, sep = 2, into = c("century", "year")) -> tidy3
    