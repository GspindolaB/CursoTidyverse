library(tidyverse)

library(nycflights13)

vuelos <- flights

### CONTAR Y VISUALIZAR NUMEROS CORRECTAMENTE ###

no_cancelados %>%
  group_by(tailnum) %>%
    summarise(delay = mean(arr_delay, na.rm = T)) %>%
      ggplot(mapping = aes(x = delay)) +
        geom_freqpoly(binwidth = 5)

no_cancelados %>%
  group_by(tailnum) %>%
    summarise(delay = mean(arr_delay, na.rm = T)) %>%
      ggplot(mapping = aes(x = delay)) +
        geom_histogram(binwidth = 5)

delay_num_vuelo <- no_cancelados %>%
  group_by(tailnum) %>%
    summarise(delay = mean(arr_delay),
            count = n())
  
ggplot(data = delay_num_vuelo, mapping = aes(x = count, y = delay)) +
  geom_point(alpha = 0.2)
    
delay_num_vuelo %>%
  filter(count>50) %>%
    ggplot(mapping = aes(x = count, y = delay)) +
      geom_point(alpha = 0.2)
