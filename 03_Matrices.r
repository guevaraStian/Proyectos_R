#Matriz
#en la creacion de matrices se puede hacer con varios vectores con la letra c, de combinar
vector1 <- c(54, 98, 45)
vector2 <- c(51, 56, 78)
vector3 <- c(12, 34, 86)

#La creaion de la matriz nos solicita la informacion y los numeros de filas y cantidad de colomnas
#de esta manera cada vector es una columna de la matriz
matriz1 <- matrix(c(vector1,vector2,vector3), nrow=3, ncol=3)
matriz1

#Con el siguiente codigo se ingresan las columnas de la matriz
colnames(matriz1) <- c('columna1','columna2', 'columna3')
matriz1

#Con el siguiente codigo se le añade el nombre de cada fila
rownames(matriz1) <- c('fila1', 'fila2', 'fila3')
matriz1

#las siguientes funciones son relacionadas a matrices
dim(matriz1)  #Dimension de la matriz
dimnames(matriz1) #Dimesion con nombre de columnas
mode(matriz1) #Tipos de datos de la matriz
length(matriz1) #Cantidad de datos adentro
is.matrix(matriz1)  #Devuelve true si es matriz o false si no lo es

#operaciones aritmeticas con matrices suma a cada una de sus variables y suma entre matrices
matriz1 +10
matriz1 + matriz1

#La forma de seleccionar un dato de la matriz, es la siguiente
matriz1[2.1]
matriz1['fila2','columna1']

#En el siguiente codigo, se solicitan todas las variable de una fila o una columna de la matriz
matriz1['fila2',]
matriz1[,"columna3"]









