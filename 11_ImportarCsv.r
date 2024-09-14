#Importar CSV
#Se importan la libreria para traer los archivo csv
install.packages("readr")

#Se importa la libreria
library(readr)

#Se abre la opcion de carga el archivo
file.choose()

#Guardamos la ruta que encontramos en el cargador de archivos en la variable ruta_csv
ruta_csv <- "C:\\Users\\Sesagean\\Desktop\\R\\gapminder.csv"

#Usamos la siguiente opcion para extraer la informacion de csv
gapminder <- read_csv(ruta_csv)

#Miramos los datos
head(gapminder)

#Le quitamos los titulos a la informacion
ruta_sintitulo <- "C:\\Users\\Sesagean\\Desktop\\R\\gapminder.csv"
gapminder_sintitulo <- read_csv(ruta_sintitulo, col_names = FALSE)
View(gapminder_sintitulo)

#Para agregar nombres a las columnas se usa el siguiente codigo
gapminder_contitulo <- read_csv(ruta_sintitulo, col_names = c('pais','anio','vida','poblacion'))
View(gapminder_contitulo)



























































