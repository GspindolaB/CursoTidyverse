vehiculos <- mpg

#Agregamos el color a la geometría y estará definida por el tipo de vehiculo
ggplot(data = vehiculos) +
  geom_point(mapping = aes(x= displ, y = hwy, color = class))

#Agregamos el tamaño a la geometría y estará definida por el número de cilindros
ggplot(data = vehiculos) +
  geom_point(mapping = aes(x = displ, 
                           y = hwy, 
                           color = class, 
                           size = cyl
                           )
             )

?mpg
