### SUBCONJUNTOS Y ACCESO A TIBBLES ###

# ACCESO A LAS POSICIONES DE UN DATA FRAME
# [['nombre_variable']]
# [[numero_posicion]]
# $nombre_variable

df <- tibble(
  x = rnorm(10),
  y = runif(10)
)

df

# En los siguientes ejemplos accedemos a las variables x e y de diferente manera
df$x
df$y

df[["x"]]
df[["y"]]

df[[1]]
df[[2]]

# Para acceder a un data frame con una pipe hacemos lo siguiente

df %>% .$x
df %>% .$y

df %>% .[["x"]]
df %>% .[["y"]]

df %>% .[[1]]
df %>% .[[2]]

df %>% .$z # Nos manda un warning porque no existe la variable z

# Para convertir una tibble a data frame hacemos lo siguiente

as.data.frame(df)

# Comprobamos la clase de la tibble convertido a data frame
class(as.data.frame(df))

# Comprobamos la clase del data frame
class(df)

# [[]] esto es similar a lo siguiente:

dplyr::filter()
dplyr::select()

# [[]] sobre un data.frame, puede devolver un data.frame o un vector
# [[]] sobre una tibble, siempre devuelve una tibble

