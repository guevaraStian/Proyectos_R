#Arbole desicion
#Se importan la libreria shiny que tiene una tabla de informacion
install.packages("ggplot2")
library(ggplot2)

#En las siguientes linea se adquiere la tabla con los datos, traida desde internet
file <- "https://raw.githubusercontent.com/fhernanb/datos/master/propelente"
datos <- read.table(file=file, header=TRUE)
head(datos) # se muestran las primeras 6 filas

#Se muestra la grafica de la informacion sin regresion lineal
ggplot(datos, aes(x=Edad, y=Resistencia)) + 
  geom_point() + theme_light()

#Teniendo el nombre de las columnas resistenia y edad, se realiza el lm para calcular los datos de la regresion lineal
mod1 <- lm(Resistencia ~ Edad, data=datos)
mod1
summary(mod1)

#Se grafica la informacion con los valores de la regresion lineal
ggplot(datos, aes(x=Edad, y=Resistencia)) + 
  geom_point() +
  geom_smooth(method='lm', formula=y~x, se=FALSE, col='dodgerblue1') +
  theme_light()






























































