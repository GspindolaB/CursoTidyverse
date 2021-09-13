### LA HEURÍSTICA DEL PARSEO ###

library(tidyverse)

# La función guess_parser() devuelve el nombre del parse. Es determinado porque heuristica es la mejor
?guess_parser

guess_parser("1994-06-01")
guess_parser("01:29")
guess_parser(c("25,442,35,27"))
guess_parser(c("TRUE", "FALSE", "TRUE"))
guess_parser(c("25","42","35","27"))

#El orden que se determina para verificar que tipo de dato es, es el siguiente:
# logico -> integer -> double -> number -> time -> date -> datetime ->strings

challenger <- read_csv(readr_example("challenge.csv"))
problems(challenge)

guess_parser(challenger)

# Si queremos parsear nosotros el tipo de dato y no dejar que reader lo haga, utilizamos lo siguiente:
challenger <- read_csv(readr_example("challenge.csv"),
                      col_types = cols(
                        x = col_double(), #parse_double()
                        y = col_character() #parse_date
                      ))

?stop_for_problems # Investugar está función

### ELEGIR MÁS MUESTRAS Y LA FUNCION TYPE_CONVERT

challenge2 <- read_csv(readr_example("challenge.csv"),
                       guess_max = 1001)

# La funcion spec() nos ayuda a obtener el tio de parseo de las columnas
spec(challenge2)

challenge2

challenge3 <- read_csv(readr_example("challenge.csv"),
                       col_types = cols(.default = col_character())) # Con esto definimos todas las
                                                                     # columnas de tipo carácter

spec(challenge3)

# La función type_comvert() convierte las columnas al formato más conveniente
type_convert(challenge3)

df <- tribble(
  ~x, ~y,
  "1","1.2",
  "2","3.87",
  "3","3.1416"
)

df

type_convert(df)

?read_lines
?read_file

read_lines(readr_example("challenge.csv"))
read_file(readr_example("challenge.csv"))

### OTROS TIPOS DE FICHEROS ESPECIALES

# Escritura de ficheros
# write_csv(), write_tsv()
# recomendado guardar strings en UTF8
# dates y date_times en ISO8601
# write_excel_csv

write_csv(challenger, path = "data/challenge.csv")
read_csv("data/challenge.csv")
spec(read_csv("data/challenge.csv"))

write_rds(challenger, path = "data/challenge.rds")
read_rds("data/challenge.rds")
spec(read_rds("data/challenge.rds"))
type_convert(read_rds("data/challenge.rds"))

library(feather)

write_feather(challenger, path = "data/challenger.feather")
read_feather("data/challenger.feather")
spec(read_feather("data/challenger.feather"))
type.convert(read_feather("data/challenger.feather"))

# haven -> SPSS, Stata, SAS
# readxl -> .xml, .xmls
# DBI -> RMySQL, RSQLita, RPostgreSQL

# jsonlite
# xml2

# rio
