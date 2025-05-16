#DataFrame
#Primero creamos un vector con diferentes ticos de dato por cada vector
nombre <- c('Futbol','Basketbol','boleybol','Atletismo')
puntuacion <- c(7.8,4.5,9.7,1.3)
posteriores_2005 <- c(TRUE,FALSE,TRUE,FALSE)

deportes_df <- data.frame(nombre ,puntuacion ,posteriores_2005)
deportes_df

#Asi se puede cambiar los titulos por mayusculas
names(deportes_df) <- c('NOMBRE','PUNTUACION','POSTERIOR_2005')
deportes_df

#Para ubicar un objeto por medio de el numero columnas y filas o por tambien del texto
deportes_df[3,2]
deportes_df[2,'PUNTUACION']

#Para escoger una fila se escoje el primer numero de la coordenada y el segundo se deja sin informacon
deportes_df[1,]
deportes_df[4,]

#Para escoger una columna, se deja el primer espacio vacio y el segundo la coordenada o nombrr de la columna
deportes_df[,2]
deportes_df[,'PUNTUACION']

#Ejemplo de ordenar el dataframe
order(deportes_df$PUNTUACION)
deportes_df

#Ordenar por puntuacion de menor a mayor
orden_menor_mayor <- order(deportes_df$PUNTUACION, decreasing = FALSE)
deportes_df[orden_menor_mayor,]
demenoramayor <- deportes_df[orden_menor_mayor,]


#Ordenar por puntuacion de mayor  a menor
orden_mayor_menor <- order(deportes_df$PUNTUACION, decreasing = TRUE)
deportes_df[orden_mayor_menor,]
demayoramenor <- deportes_df[orden_mayor_menor,]








