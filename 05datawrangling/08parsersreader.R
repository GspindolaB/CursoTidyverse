library(tidyverse)

### LOS PARSERS DE READER ###

# parse_*

# Indicamos un vector de carácteres pero con el parse_logical lo parseamos a un vector de tipo lógico
parse_logical(c("TRUE", "FALSE", "FALSE", "NA")) 
str(parse_logical(c("TRUE", "FALSE", "FALSE", "NA"))) # Con esto podemos verificas la estructura del vector

# Indicamos un vector de carácteres pero con el parse_integer lo parseamos a un vector de tipo entero
parse_integer(c("1","2","3","4"))
str(parse_integer(c("1","2","3","4")))

# Indicamos un vector de carácteres pero con el parse_date lo parseamos a un vector de tipo fecha
parse_date(c("1994-06-01", "1967-08-11"))
str(parse_date(c("1994-06-01", "1967-08-11")))

# Indicamos un vector de carácteres pero con el parse_double lo parseamos a un vector de tipo double
parse_double(c("3.1416","2.5","4.7"))
str(parse_double(c("3.1416","2.5","4.7")))

# En éste caso indicamos los valores que serán tratados como na con el parámetro na
parse_integer(c("1","2","#","5","729"), na = "#")

# En este caso el parse arrojara problemas ya que estamos indicando dos valores que no son un entero
data <- parse_integer(c("1","2","hola","5","234","3.1416"))

# Para detectar los problemas en un parse nos ayuda la funcion problems()
problems(data)

# parse_logical()
# parse_integer()
# parse_double()
# parse_number()

# parse_character()

# parse_factor()

# parse_datetime()
# parse_date()
# parse_time()

### PROCESADO DE NUMEROS ###

# parse_logical()
# parse_integer()

  # decimales -> . ,
parse_double("12.345")
# Con esto indicamos que noestro separador decimal seá una coma y no un punto.
parse_double("12,345", locale = locale(decimal_mark = ",")) 

  # monetarios -> 100€, $1000
  # porcentajes -> 15%
parse_number(c("100€", "$1000", "15%", "El costo total es de : 45€"))

  # agrupaciones -> 1, 000, 000 
parse_number("$1,000,000")
# Con esto indicamos que nuestro separador de miles será el punto y no la coma
parse_number("$1.000.000", locale = locale(grouping_mark = "."))
# Con esto indicamos que nuestro separador de miles será la comilla simple 
parse_number("123'456'789", locale = locale(grouping_mark = "'"))

### PROCESADO DE CARACTERES ###

#parse_character()

charToRaw("Guillermo Ricardp Spindola Brisuela") #Convierte una cadena de caracteres a su codificacion base

#latin1 (ISO-8859-1) para idiomas de Europa del Oeste
  # bq -> +-
#latin2 (ISO-8859-2) para idiomas de Europa del Este
  # b2 -> a
#UTF-8

x1 <- "El ni\xf1o ha estado enfermo"
x2 <- "\x82\xb1\x82\xf1\x82\xb2\x82\xcd"  

# Si conocemos la codificación de los carácteres  podemos utilizar encoding
parse_character(x1, locale = locale(encoding = "latin1"))
parse_character(x2, locale = locale(encoding = "Shift-JIS"))

# La función guess_encoding() nos ayuda a decifrar la codificación de los carácteres
guess_encoding(charToRaw(x1))
guess_encoding(charToRaw(x2))

### PROCESADO DE FACTORES ###

# parse_factor()

meses <- c("Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec")

parse_factor(meses)

parse_factor(c("May", "Apr", "Jul", "Aug", "Sec", "Nob"), levels = meses)

### PROCESADO DE FECHAS Y HORAS ###

# parse_date() ISO-8601
# parse_time()
# parse_datetime()

# EPOCH -> 1970-01-01:00:00

parse_datetime("2021-09-06T1824")
parse_datetime("2021-09-06")
parse_datetime("20210906")

parse_date("1994-06-01")
parse_date("1994/06/01")
parse_date("19940601") # Esto nos da un warning , el formato indicado es yyyy-mm-dd o yyy/mm/dd

parse_time("03:00 pm")
parse_time("20:00:34")

# Año
# %Y -> año con cuatro digitos
# %y -> año con dos digitos (00-59) -> 2000-2069, (70,99) -> 1970-1999

# Meses
# %m -> mes en formato de dos digitos
# %b -> abreviación del mes 'Ene', 'Feb', 'Mar', ...
# %B -> nombre completo del mes 'Enero', 'Febrero', 'Marzo', ...

# Día
# %d -> día con dos digitos
# %e -> eliminar el 0 en los días que van del 1 al 9

# Horas
# %H -> hora entre 0-23
# %i -> hora entre 0-12 va con %p
# %p -> am/pm
# %M -> minutos 0-59
# %s -> segundos 0-59
# %OS -> segundos reales
# %Z -> zona horaria America/Mexico_City, France, Spain
# %z -> zona horaria con respecto a la UTC(Hora Zulú)

# No digitos
# %. -> sirve para eliminar un carácter no digito
# %* -> sirve para eliminar cualquier número de carácteres que no sean digitos

parse_date("05/08/1967", format = "%d/%m/%Y")
parse_date("06-06-94", format = "%d-%m-%y")
parse_date("12-24-1981", format = "%m-%d-%Y")
parse_date("Jan-01-70", format = "%b-%d-%y")
parse_date("01-June-1994", format = "%d-%B-%Y")
parse_date("5 Janvier 2012", format = "%d %B %Y", locale = locale("fr"))
parse_date("1 Junio 1994", format = "%d %B %Y", locale = locale("es"))
