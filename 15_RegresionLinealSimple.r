#Graficas con movimientos
#Se importan la libreria tidyverse que tiene una tabla de informacion
install.packages("tidyverse")

#Se importa la libreria
library(tidyverse)

#Traemos los datos 
data("Orange")

#Cargar datos en pantalla
head(Orange)

#Esta tabla de informacion, tiene cuanto mide la circunferencia de un arbol de naranjas a los 800 dias de plantarlo
Orange %>% ggplot(aes(x= age, y= circumference)) + geom_point() + geom_abline(intercept = 0, slope = 1, col= 'blue')

#En el siguiente codigo se mejora la regresion lineal simple
Orange %>% ggplot(aes(x= age, y= circumference)) + geom_point() + geom_abline(intercept = 0, slope = 1, col= 'blue')

# se usa la funcion lm para mejorar la regresion lineal simple
lm(circumference ~ age, data = Orange)
Orange %>% ggplot(aes(x= age, y= circumference)) + geom_point() + geom_abline(intercept = 17.3997, slope = 0.1068, col= 'blue') + geom_vline(xintercept = 800, col = 'red')

#Se genera la formula de la media
dias <- 800
medida <- 0.1068 * dias + 17.3997
print(medida)



































































