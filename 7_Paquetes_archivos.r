#Instalacion de paquetes e importada de datos excel

#En las 2 siguiente lineas el codigo importa paquetes de r
install.packages('nombre_de_el_paquete')
install.packages('ggplot2')
#En el codigo del programa se adiere el codigo library para hacer uso de ella cada que se habra r
library(ggplot2)
#para ver informacion de una libreria se puede usar help
help("ggplot2") 

#Se importa la libreria readx1
install.packages("readxl")

#Se invoca en la sesion de r
library(readxl)

#Se busca un archivo
file.choose()

#Guardamos la ruta del archivo en una variable
ruta_excel <- "C:\\Users\\NombreUsuario\\Desktop\\R\\Proyectos_en_R_Completo\\gapminder_importar_a_r.xlsx"

#con el siguiente comando se ve los nombres de las hojas del excel
excel_sheets(ruta_excel)

#Cuando la informacion esta bien organizada en la hoja1 y empieza desde la fila 1
caso_ideal <- read_excel(ruta_excel)
caso_ideal

#En el caso de que la informacion necesaria este una hoja diferente hay que agregarle el sheet
caso_medio <- read_excel(ruta_excel, sheet = 'Hoja2')
caso_medio

#Cuando la talba empieza en una fila y columna diferente se agrega un range
final_boss <- read_excel(ruta_excel, sheet='Hoja3', range='C7'F7')































