#Histogramas
#Se ingresan las variables de la tabla
data("mtcars")

# Se crea el histograma basico
hist(mtcars$hp)

#Se le realizan unas modificaciones en las caracteristicas
hist(mtcars$hp, breaks = seq(50, 350, 50), col='darkgray', border ='gray10', main ='titulo', xlab = 'variable x', ylab = 'conteo')

#se importa la libreria ggplot2
library(ggplot2)

#a continuacion se crea el grafico con unas caracteristicas especificas
ggplot(data = mtcars, mapping = aes(x = hp)) + geom_histogram(bins = 9)

#En el siguiente codigo, se le hacen unas modificaciones
ggplot(data = mtcars, mapping = aes(x = hp, fill = factor(vs))) + geom_histogram(bins = 9, position = 'identity', alpha = 0.8) + labs(title = 'titulo', fill = 'vs motor',x='caballos de fuerza', y = 'conteo', subtitle= 'subtitulo', caption = 'fuente de los datos: r')














