#Graficas 2
#Se ingresan las variables de la tabla
#ingresa los datos
data(mtcars)

#Se muestra la informacion ingresada
head(mtcars)

#Se muestra la informacion en la columna cyl
table(mtcars$cyl)

#Se crea la grafica con la informacion de la columna cyl
barplot(table(mtcars$cyl))

#Se modifican las caracteristicas de la grafica, con la informacion que uno desee
barplot(table(mtcars$cyl), col = 'blue', border = 'red', main = 'Grafica de barras', sub = 'subtitulo', xlab = 'cilindros', ylab = 'cantidad')

#En el siguiente ejemplo de graficas se usa la libreria ggplot2
#Cargar la libreria ggplot2
install.packages("ggplot2")

#Se anexa la libreria
library(ggplot2)

#Con el siguiente comando se crea la grafica
ggplot(data = mtcars, mapping = aes(x= factor(cyl))) + geom_bar() + coord_flip()

#Guardamos la informacion en p
p <- ggplot(data = mtcars, mapping = aes(x = factor(cyl), fill = factor(gear)))

#En esta grafica queda organizada la informacion en la misma barra
p + geom_bar(position = 'stack', stat = 'count')

#Convertimos la grafica en dodge donde se separan las barras
p + geom_bar(position = 'dodge', stat = 'count')











































