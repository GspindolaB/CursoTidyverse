### IMPRIMIR TIBBLE POR PANTALLA

t

t2

t3

# Instalamos el paquete de lubridate que nos sirve para trabajar con fechas

install.packages("lubridate")
library(lubridate) # Activanos el paquete

vignette("lubridate") # Pedimos ayuda para el paquete de lubridate

# Creamos una nueva tibble
tabla <- tibble(
  a = lubridate::now() + runif(1000) * 24 * 60 * 60, # Generamos una fecha y hora entre hoy y mañana
  b = 1: 1000, # Generamos numeros entre 1 y 100
  c = lubridate::today() + runif(1000) * 30, # Generamos una fecha entre hoy y hasta dentro de un mes
  d = runif(1000), # Generamos 1000 numeros aleatorios entre 1 y 1000
  e = sample(letters, 1000, replace = T)  # Generamos letras
)

library(nycflights13)

# Invocamos al método print e indicamos que queremos 15 filas y todas las columnas
flights %>%
  print(n = 15, width = Inf)

# Con la función options podemos ver las opciones que R tiene por defecto
options()

# Indicamos que cuando la tibble tenga más de 15 filas sólamente imprima las 15 primeras
options(tibble.print_max = 15, tibble.print_min = 15)

# Indicamos que nos muestra toda la información cuándo llamamos cualquier método de dplyr
options(dplyr.print_min = Inf)

# Indicamos que se muestren todas las columnas para la tibble
options(tible.width = Inf)

# Para abrir el visor de datos invocamos al método view()
flights %>% # ... transformaciones
  View()


# Solicitamos ayuda para el paquete tibble
package?tibble




