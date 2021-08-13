### GRAMATICA DE GGPLOT

# ggplot(data = <DATA_FRAME>) +
#    <GEOM_FUNCTION>(mapping = aes(<MAPPINGS>)
#                    stat = <STAT>,
#                    position = <POSITION>
#                   ) + 
#    <COORDINATE_FUNCTION>
#    <FACET_FUNCTION>

### 

ggplot(data = diamonds) +
  geom_bar(mapping = aes(x = clarity, y = ..count.., fill = cut)) +
  coord_polar() +
  facet_wrap(~color) +
  labs(x = NULL, y = NULL, title = "Ejemplo final del ggplot", caption = "Dos variables curzadas de diamonds",
       subtitle = "Aprender ggplot es muy divertido") 

ggplot(data = diamonds) +
  geom_bar(mapping = aes(x = clarity, y = ..count.., fill = cut), position = "jitter") +
  facet_wrap(~color) +
  labs(x = NULL, y = NULL, title = "Ejemplo final del ggplot", caption = "Dos variables curzadas de diamonds",
       subtitle = "Aprender ggplot es muy divertido") 
 
