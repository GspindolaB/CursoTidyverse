# 1.- Investiga la documentación para decir cuales son los argumentos más importantes que trae 
#     la función locale()

?locale

# 2.- Investiga qué ocurre si intentamos configurar a la vez el decimal_mark y grouping_mark con el mismo carácter. 
#     ¿Qué valor por defecto toma el grouping_mark cuando configuramos el decimal_mark al carácter de coma “,”? 
#     ¿Qué valor por defecto toma el decimal_mark cuando configuramos el grouping_mark al carácter de punto “.”? 

parse_double("3.,1416", locale = locale(decimal_mark = ",", grouping_mark = ","))
parse_number("100'000'000,75", locale = locale(decimal_mark = ",", grouping_mark = "'"))

parse_number("3145.6,16", locale = locale(decimal_mark = ","))

# 3.- Investiga qué hace la opción del  locale() cuando se utiliza junto al date_format y al time_format . 
#     Crea un ejemplo que muestre cuando puede sernos útil.

parse_date("01/06/1994", locale = locale(date_format = "%d/%m/%Y"))
parse_time("19:32", locale = locale(time_format = "%H:%M"))

# 4.- Crea un nuevo objeto locale que encapsule los ajustes más comunes de los parámetros para la carga 
#     de los fichero con los que sueles trabajar.

objeto <- locale(date_format = "%d/%m/%Y")

# 7.- Genera el formato correcto de string que procesa cada una de las siguientes fechas y horas:

v1 <- "May 19, 2018"
v2 <- "2018-May-08"
v3 <- "09-Jul-2013"
v4 <- c("January 19 (2019)", "Mayo 1 (2015)")
v5 <- "12/31/18" # Dic 31, 2014
v6 <- "1305"
v7 <- "12:05:11.15 PM"

parse_date(v1, format = "%b %d, %Y")
parse_date(v2, format = "%Y-%b-%d")
parse_date(v3, format = "%d-%b-%Y")
parse_date(v4, format = "%B %e (%Y)")
parse_date(v5, format = "%m/%d/%y")
parse_time(v6, format = "%H%M")
parse_time(v7, format = "%i:%M:%OS %p")

?parse_time
