# 1.- El dataset de vuelos tiene dos variables, dep_time y sched_dep_time muy útiles pero difíciles de usar 
#     por cómo vienen dadas al no ser variables contínuas. Fíjate que cuando pone 559, se refiere a que el 
#     vuelo salió a las 5:59... 
#     Convierte este dato en otro más útil que represente el número de minutos que horas desde media noche. 

View(transmute(flights, 
          dep_time, 
          sched_dep_time,
          horas_departure = dep_time %/% 60,
          minutos_departure = dep_time %% 60,
          horas_departure_prog = sched_dep_time %/% 60,
          minutos_departure_prog = sched_dep_time %% 60))

# 2.- Compara las variables air_time contra arr_time - dep_time. 
#     ¿Qué esperas ver?
#     ¿Qué ves realmente?
#     ¿Se te ocurre algo para mejorarlo y corregirlo?

View(transmute(flights,
               air_time,
               dep_time,
               arr_time,
               arr_time-dep_time,
               dep_time2 = 60 * dep_time %/% 100 + dep_time %% 100,
               arr_time2 = 60 * arr_time %/% 100 + arr_time %% 100,
               new_air_time = arr_time2 - dep_time2))

# 3.- Compara los valores de dep_time, sched_dep_time y dep_delay. 
#     Cómo deberían relacionarse estos tres números? Compruébalo y haz las correcciones 
#     numéricas que necesitas.
View(transmute(flights,
               dep_time,
               sched_dep_time,
               dep_delay,
               dep_delay2 = dep_time - sched_dep_time,
               dep_time2 = 60 * dep_time %/% 100 + dep_time %% 100,
               sched_dep_time2 = 60 * sched_dep_time %/% 100 + sched_dep_time %% 100,
               dep_delay_final = dep_time2-sched_dep_time2))




# 4.- Usa una de las funciones de ranking para quedarte con los 10 vuelos más retrasados de todos. 
filter(arrange(transmute(flights,
          dep_delay,
          min_rank(dep_delay)), dep_delay), dep_delay > 0)

# 5.- Aunque la ejecución te de una advertencia, qué resultado te da la operación

a <- 1:6 
b <- 1:20

a
b

 a+ b
 
 ?mutate()

 ?sin
 