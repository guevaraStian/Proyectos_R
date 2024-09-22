#Arbole desicion
#Se importan la libreria tidyverse que tiene una tabla de informacion
install.packages("tidyverse")
install.packages("titanic")

#Los siguientes librerias sirve para organizar los datos y darle forma a la grafica
install.packages("rpart")
install.packages("rattle")
install.packages("rpart.plot")

#Se importa la libreria
library(tidyverse)
library(titanic)

library(rpart)
library(rattle)
library(rpart.plot)

#Traemos los datos 
data("titanic_train")

#Cargar datos en pantalla
head(titanic_train)

#Con el siguiente codigo se modela con arboles de desicion
arbol <- rpart(formula = Survived ~ Sex + Age, data= titanic_train, method = 'class')

#Graficando el arbol
fancyRpartPlot(arbol)

#Mostrar los datos en tabla con la prediccion del arbol
pred_arbol <- predict(arbol, type = 'class')
titanic_pred <- cbind(titanic_train, pred_arbol)

#Ver calculo en 1 solo ejemplo
predict(object = arbol, newdata = data.frame(Age = 4, Sex = 'male'), type = 'class')

































































