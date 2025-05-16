#Vectores
#creacion de vectores con la letra c, de combinar
nombres <- c("futbol", "boleibol", "basketbol")
puntuacion <- c(7.2, 8.3, 2.3)
puntuacion2 <- c(3.1, 5.9, 3.4)
ganamos <- c(TRUE, TRUE, FALSE)

#Funciones aritmeticas con vectores
puntuacion + 1
puntuacion - 5
puntuacion / 2
puntuacion * 3
#Funciones aritmeticas entre vectores tienen que ser del mismo tipo de dato
puntuacion + puntuacion2
puntuacion - puntuacion2
puntuacion / puntuacion2
puntuacion * puntuacion2

#Funciones de vectores
length(puntuacion) #Muestra la cantidad de espacios ocupados dentro del vector
mean(puntuacion) #Muestra el promedio de las partes del vector
sum(puntuacion) #se suman las partes del vector

#Ejemplos de como se escoge una parte del vector
nombres[1]
nombres[c(2, 3)]

#Se crea una condicional y se guarda en puntuacion baja
puntuacion_baja <- puntuacion < 5
puntuacion_baja  #se imprime en pantalla si es falso o verdadero
puntuacion[puntuacion_baja]  #Se muestra que puntuaciones fueron bajas
nombres[puntuacion_baja]  #Se muestra que nombres de puntuacion fueron bajas













