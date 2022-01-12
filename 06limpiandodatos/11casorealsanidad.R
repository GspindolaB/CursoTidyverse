### Un caso real de sanidad ###

library(tidyverse)

View(who)


who %>%
  gather(new_sp_m014:newrel_f65, key = "key", value = "cases", na.rm = TRUE) -> who2

who3 <- who %>%
  pivot_longer(new_sp_m014:newrel_f65, names_to = "key" , values_to = "cases")

who2
who3

View(who2 %>%
  count(key))

who4 <- who2 %>%
  mutate(key = str_replace(key, "newrel", "new_rel"))

who4 %>% 
  count(key) %>%
    View()

who5 <- who4 %>%
  separate(key, c("new","type","sexage"), sep = "_")
  
who5

who6 <- who5 %>%
  select(-new, -iso2, -iso3)

who6

who7 <- who6 %>%
  separate(sexage, c("sex", "age"), sep = 1)

who7 %>%
  View()

# Todo esta resumido, y es mucho mejor y más recomendado que los pasos anteriores
who_final <- who %>%
  gather(new_sp_m014:newrel_f65, key = "key", value = "cases", na.rm = TRUE) %>%
    mutate(key = str_replace(key, "newrel", "new_rel")) %>%
      separate(key, c("new","type","sexage"), sep = "_") %>%
        select(-new, -iso2, -iso3) %>%
          separate(sexage, c("sex", "age"), sep = 1)

who_final      
    
