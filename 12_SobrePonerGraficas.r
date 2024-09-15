#Sobreponer graficas
#Se importan la libreria ggplot2
install.packages("ggplot2")
#Se importa la libreria
library(ggplot2)

#Traemos informacion de flores llamada iris
data("iris")
head(iris)

#El siguiente es un codigo de un ejemplo con puntos y lineas
ggplot(data = iris, mapping = aes(x = Sepal.Length, y = Sepal.Width, color= Species)) + geom_point() + geom_smooth(method = 'lm')

#Este ejemplo 2 es de varias lineas en el mismo grafico
ggplot(data = iris[iris$Species == 'setosa',], mapping = aes(x = 1:50, y = Petal.Width)) + geom_line()

#Este ejemplo 3 es de varias lineas en el mismo grafico
ggplot(data = iris, mapping = aes(x = rep(1:50,3), y = Petal.Width, color = Species)) + geom_line()

#El siguiente codigo ayuda a tener un boxplot con puntos
ggplot(data = iris, mapping = aes(x = Species, y = Petal.Width, fill = Species)) + geom_boxplot() + geom_jitter()

































































