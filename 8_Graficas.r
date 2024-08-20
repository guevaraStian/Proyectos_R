#Creacion y control de graficas
#Se ingresan las variables de la tabla
year <- c('2010', '2011', '2012', '2013','2014','2015','2016','2017','2018')
disney<- c(11,13,11,8,12,11,12,8,10)

# Graficndo con codigo sencillo
plot(x= year, y=disney)

#Editamos la grafica en diferentes caracteristicas
plot(x = year, y = disney, main= 'disney',xlab = '', ylab='', col='cornflowerblue', pch=16, panel.first =grid())

#Descargamos y habilitamos una libreria de graficar
install.packages('ggplot2')
library(ggplot2)

#Creamos la variable data frame con la informacion de los vectores year y disney
peliculas <- data.frame(year,disney)

#Creamos la grafica con unas caracteristicas indicadas
ggplot(data = peliculas, mapping = aes(x = year, y = disney)) + geom_point() + labs(title = 'disney')

















