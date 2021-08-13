### FUNCIONES EN R ###

#Las funciones en R tienen la siguiente sintáxis. Se declaran cómo si fuera una variable. Se utiliza la palabra
#funcion seguida de parentesis, dentro de los parentesis los parametros si es que los hay, después la llave
#de apertura, dentro de la llave irá el contanido de la función y al final la llave de cierre

mi.primera.funcion <- function(){
  "Hola"
}

mi.primera.funcion() #  Lo único que hace está función es imprimir "Hola" en la pantalla

mi.segunda.funcion <- function(nombre){
  paste("Hola", nombre)
}

mi.segunda.funcion("Guillermo") #Está función escribe hola seguido del nombre escrito en el parametro de la funcion

mi.tercera.funcion <- function(lado){
  area = lado + lado + lado + lado
  print(paste("El área del cuadrado es",area))
}

mi.tercera.funcion(4) # Lo que hace está función es calcular la base del cuadrado 

funcion_areas



