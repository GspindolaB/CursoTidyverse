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