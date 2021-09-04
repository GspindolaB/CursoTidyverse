library(tidyverse)

# Sintáxis que hemos visto hasta el momento
ggplot(data = diamonds, mapping = aes(x = cut, y = price)) +
  geom_boxplot()

# Sintáxis más simplificada y más recomendada
ggplot(diamonds, aes(x = cut, y = price)) +
  geom_boxplot()

# Sintáxis aún más simplificada
ggplot(diamonds, aes(cut, price)) +
  geom_boxplot()

# Todavía lo podemos simplificar más de la siguiente manera
diamonds %>%
  ggplot(aes(cut, price)) +
    geom_boxplot()

# Entre más simplificado es mucho más recomendable

diamonds %>%
  count(cut, clarity) %>%
    ggplot(aes(cut, clarity, fill = n)) +
      geom_tile()
