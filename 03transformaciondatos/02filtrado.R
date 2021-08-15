### FILTER ###

# Asignamos la tibble de flights a una variable llamada vuelos
vuelos <- flights

# El siguiente filtro nos permite visualizar los vuelos del día 01 de Enero
vuelosEnero1 <- filter(vuelos, month == 1, day == 1)

# El siguiente filtro nos permite saber cuantos vuelos hubo el 01 de Junio
vuelosCumpleanios <- filter(vuelos, month == 5, day == 1)

# El siguiente filtro nos permite saber cuántos vuelos hay el día de Navidad
(vuelosNavidad <- filter(vuelos, month == 12, day == 25))

# Diferentes tipos de filtrado
# > Mayor
# >= Mayor o igual
# < Menor
# <= Menor o igual
# == Igual
# != Diferente

sqrt(2)^2==2

near(sqrt(2)^2, 2)

1/pi*pi == 1

1/49 * 49 == 1

near(1/49 * 49, 1)

### ALGEBRA DE BOOL EN EL FILTRADO ###

# Filtra los vuelos correspondientes al mes de Mayo o Junio
filter(vuelos, month == 5 | month == 6)

# Esta instruccion no filtra nada
filter(vuelos, month == 5 | 6)

# Filtra los vuelos correspondientes al mes de Mayo o Junio
Mayo_Junio <- filter(vuelos, month %in% c(5,6))

# !(x&y) == (!x)|(!y)
# !(x|y) == (!x)&(!y)

# Filtra los vuelos que no tuvieron una demora mayor a 60 minutos a la salida y a la llegada
Menor60 <- filter(vuelos, !(arr_delay > 60 | dep_delay > 60))
Menor60 <- filter(vuelos, arr_delay <= 60 & dep_delay <= 60)
Menor60 <- filter(vuelos, arr_delay <= 60, dep_delay <= 60)

rm(Menor60) # Elimina está variable

### EL SÍNDROME CONTAGIOSO DE LOS NA ###

NA > 0

10 == NA

NA + 5

sqrt(NA)

NA == NA

# La tía Toña tiene una edad desconocida, por lo tanto no se que tan anciana es
edad.Toña <- NA
# El tío Pancho no se cuantos años tiene
edad.Pancho <- NA

# Deben de tener la misma edad ?
edad.Toña == edad.Pancho

?is.na # La función is.na() nos ayuda a saber cuales de nuestros datos son NA

is.na(edad.Toña)

# Vamos a crear una tibble

datos_tibble <- tibble(x = c(1,2,NA,4,5))

filter(datos_tibble, x >2)
filter(datos_tibble, is.na(x) | x > 2)
