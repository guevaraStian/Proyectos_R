#Factores o variables catregoricas
#Primero creamos un arreglo con datos en mayuscula y minuscula
tallas <- c('m','g','S','S','m','M')
plot(tallas) #con plot se grafica 

#Convertimos las tallas en factores
tallas_factor <- factor(tallas)
plot(tallas_factor)

#Recodificamos las tallas para que en minuscula, se conviertan en mayusculas
tallas_recodificado <- factor(tallas, 
                              levels = c("g","m","M","S"), 
                              labels = c("G","M","M","S"))
plot(tallas_recodificado)

#Las organizamos de mayor a menor, en este caso de S,M y G
tallas_ordenadas <- factor(tallas, 
                              ordered = TRUE,
                              levels = c("S","m","M","g"), 
                              labels = c("S","M","M","G"))
tallas_ordenadas
plot(tallas_ordenadas)

