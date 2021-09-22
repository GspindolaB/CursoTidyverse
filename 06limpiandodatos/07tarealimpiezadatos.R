### TAREA ###

# 1.- Describe cómo están organizadas las variables y observaciones en cada una de las cinco famílias 
#     de tablas table1... table5 de tidyverse.

#table1: Es lo más ideal ya que todas las observaciones están como columnas, los atributos cómo filas y los valores en celdas

#table2: No están todas las observaciones como columnas

#table3: En una misma columna están los valores de columnas separadas

#table 4a y table4b: Existen valores que están como  observaciones

#table5: El mismo caso que la table3 y además está separado el siglo del año

#table4a

# 2.- Calcula la columna de rate para table2 y para la combinación de table4a y table4b sin usar las 
#     funciones gather o spread. 

table2 %>%
  pivot_wider(names_from = type, values_from = count) %>%
    mutate(rate = cases/population)

table4a %>%
  pivot_longer(c(`1999`,`2000`), names_to = "year", values_to = "cases") -> tabla4a
  
table4b %>%
  pivot_longer(c(`1999`,`2000`), names_to = "year", values_to = "population") -> tabla4b

left_join(tabla4a, tabla4b) %>%
  mutate(rate = cases/population)

# 3.- Recrea el plot que hemos hecho en la clase para mostrar los casos de infección a lo largo de 
#     los años usando la table2 en lugar de la table1. ¿En qué difiere el proceso?

table2 %>%
  pivot_wider(names_from = type, values_from = count) %>%
  ggplot(aes(year, cases)) +
  geom_line(aes(group = country), color = "grey") +
  geom_point(aes(color = country))

# 4.- Las funciones spread y gather no son absolutamente simétricas. Toma el siguiente ejemplo para 
#     explicarlo correctamente:

roi <- tibble(
  year = c(rep(2016,4), rep(2017,4), 2018),
  quarter = c(rep(c(1,2,3,4),2),1),
  return = rnorm(9, mean = 0.5, sd = 1)
)

roi %>%
  spread(year, return) %>%
  gather("year", "return", `2016`:`2018`)

roi

# 7.- 

people <- tribble(
  ~name,         ~key,   ~value,   ~app,
  #-------------|-------|-------
  "Juan Gabriel", "age",     30,   "Gomila",
  "Juan Gabriel", "weight",  71,   "Salas",
  "Juan Gabriel", "age",     18,   "Zaragoza",
  "Ricardo",      "age",     55,   "Salinas",
  "Ricardo",      "age",     75,   "Pliego"
)

people %>%
  spread(key = key, value = value)

# 8.- 

pregnancy <- tribble(
  ~pregnant, ~male, ~female,
  #--------|------|---------
  "yes",    NA,    32,
  "no",     85,    43
)

pregnancy

pregnancy %>%
  gather(male, female, key = type, value = cuenta)

# 9.- 

tibble(x = c("a,b,c", "d,e,f,g","h,i,j")) %>%
  separate(x, c("x", "y", "z"), extra = "merge")

tibble(x = c("a,b,c", "d,e","f,g,h")) %>%
  separate(x, c("x", "y", "z"), extra = "merge", fill = "right", remove = F)

tibble(x = c("a,b,c", "d,e,f,g","h,i,j")) %>%
  separate(x, c("x", "y", "z"), remove = T, fi)
