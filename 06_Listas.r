#Creacion de lista que pueden tener diferentes tipos de variables en vectores o matrices
#Se declaran las varables en numeros, texto y buleano
#Tambien se crea una matriz con la informacion
nombres <- c("pelicula1", "pelicula2", "pelicula3", "pelicula4")
puntuaciones <- c(4.7, 1.8, 7.3, 7.8)
posterior_2005 <- c(TRUE, FALSE, TRUE, FALSE)

# informacion estrenos de peliculas
producciones1 <- c(40, 35, 12, 13, 40, 44, 12, 30, 35)
producciones2 <- c(36, 12, 29, 19, 28, 33, 14, 23, 32)
producciones3 <- c(38, 27, 22, 40, 35, 32, 25, 40, 21)

# crear diferentes estructuras de datos en R
vector_nombres_pelicula <- nombres
matriz_peliculas <- matrix(c(producciones1, producciones2, producciones3),
                    nrow = 9,
                    ncol = 3)
DataFrame_peliculas <- data.frame(nombres,
                           puntuaciones,
                           posterior_2005)

#Con el siguiente comando creamos una lista con la informacion y se muestra en pantalla
lista_nueva <- list(vector_nombres_pelicula, matriz_peliculas)
lista_nueva

#Cambiamos nombre de datagrame
names(lista_nueva) <- c('vector', 'matriz')
lista_nueva

#Para seleccionar un elemento de la lista se muestra el siguiente ejemplo
lista_nueva[['vector']]
#Si se selecciona un vector o una matriz
lista_nueva[['vector']][4]
lista_nueva[['matriz']][5,3]

#agregamos datagrame a la lista
lista_nueva[['data_frame']] <- DataFrame_peliculas
lista_nueva

#Borrar el vector, o ponerlo en nul, se puede hacer con el siguiente codigo
lista_nueva[['vector'] <- NULL
lista_nueva
















