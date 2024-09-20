#Graficas con movimientos
#Se importan la libreria tidyverse que tiene una tabla de informacion
install.packages("tidyverse")
install.packages("gganimate")
install.packages("gifski")
install.packages("gapminder")

#Se importa la libreria
library(tidyverse)
library(gganimate)
library(gifski)

#Instalar paquete con datos
install.packages("gapminder")
library(gapminder)

#Traemos los datos 
data("gapminder")

#Cargar datos en pantalla
head(gapminder)

#En el siguiente codigo se crea una grafica sencilla
gapminder %>% group_by(year, continent) %>% summarize(mean_life = mean(lifeExp)) %>% ggplot(aes(x = year, y = mean_life, color = continent)) + geom_line()

#Se le anexa la animacion a la grafica
gapminder %>% group_by(year, continent) %>% summarize(mean_life = mean(lifeExp)) %>% ggplot(aes(x = year, y = mean_life, color = continent)) + geom_line() + transition_reveal(year)

#El siguiente codigo nos da un mejor diseño de grafica animada
gapminder %>% group_by(year, continent) %>% summarize(mean_life = mean(lifeExp)) %>% ggplot(aes(x = year, y = mean_life, color = continent)) + 
geom_line(size = 2) + geom_point(size = 4) + labs(title = 'Esperanza de vida en {frame_along}', x = 'Fecha', y = 'Años de vida') + 
theme_minimal() + transition_reveal(year)


































































