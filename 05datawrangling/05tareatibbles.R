# 1.- ¿Tibble o no tibble? ¿Cómo sabes si un objeto es una tibble o no

mtcars

class(mtcars)

flights

class(flights)

mpg

# 2.- Compara y contrasta las siguientes operaciones en el data frame y su equivalente en tibble. 

df <- data.frame(abc = 1, xyz = "a")
df$x
df[,"xyz"]
df[,c("abc","xyz")]

df2 <- tibble(
  abc = 1,
  xyz = "a"
)

df2 %>% .$x
df2 %>% .[["xyz"]]

# 3.-

myvar <- "mpg"

myvar

df_myvar <- data.frame(myvar)

tb_myvar <- tibble(myvar)

df_myvar
tb_myvar
# dataframe
df_myvar[[1]]
df_myvar[["myvar"]]
# tibble
tb_myvar %>% .[[1]]
tb_myvar %>% .$myvar

# 4.- Toma la siguiente tibble formada por variables con nombres no sintácticos.

df <- tibble(
  
  `1` = 1:12,
  `2` = `1` * 2 + `1`*runif(length(`1`))
)

df

# Extrae el valor de la variable `1`
df %>% .$'1'

# Haz un scatterplot de la variable `1`contra la variable `2`
df %>%
  ggplot(aes(df %>% .[[1]], df %>% .$'2')) +
    geom_point()

# Crea una nueva columna llamada `3`que sea el cociente de `2`entre `1`.

df <- df %>% add_column('3' = df %>% .$'2' / df %>% .[[1]])

# Renombra las columnas para que se llamen x, y, z respectivamente.
df %>%
  rename(x = '1', y = '2', z = '3')

# 5.- Investiga acerca de la función tibble:enframe() y tibble:deframe(). 
#     ¿Qué hace y para qué puede servirte?

?enframe # Convierte vectores en data frames

vector1 <- c(1:10)

enframe(vector1)

?deframe # Convierte dataframes en vectores

deframe(enframe(vector1))

# 6.- ¿Cómo podemos controlar cuantos nombres de columna adicionales se imprimen en el footer de una tibble?

tail(flights, n = 15)
