#Uso de dplyr en R
#Se importan la libreria gapminder que tiene una tabla de informacion
install.packages("gapminder")

#Se importa la libreria
library(gapminder)

# Se cargan los datos en el entorno
data(gapminder)

# Se muestran los datos en el entorno
head(gapminder)

# Se descargan los paquetes de tidyverse
install.packages("tidyverse")

#Se importa la informacion
library(tidyverse)

#En este ejemplo se realiza un filtro de pais por mexico
filter(gapminder, country == 'Mexico')

#En este ejemplo se realiza un filtro de pais por mexico
gapminder %>% filter(country == 'Mexico')

#En este ejemplo se realiza un filtro de año 2002
gapminder %>% filter(year == 2002)

#El siguiente es un filtro multiple
gapminder %>% filter(lifeExp <= 40, year == 2002)

#Cantidad de paises en asia
gapminder %>% filter(continent == "Asia", year == 2007) %>% summarise(conteo = n()) 

#Maxima esperanza de vida
gapminder %>% summarise(max_lifeExp = max(lifeExp))

#Agrupando esperanza de vida promedio por año
gapminder %>% group_by(year) %>% summarise(prom_vida = mean(lifeExp))












































































