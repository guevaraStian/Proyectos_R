#Fibonacci
#No se necesita descargar librerias
#install.packages("shiny")

#Se crea la funcion que itera las variables para crear la funcion de fiboncci
fib <- function(n) {
    var1 = 0
    var2 = 1
    for (i in 1:n) {
        tmp = var2
        var2 = var1
        var1 = var1 + tmp
    }
    return(var1)
}
print(fib(79), digits=20)

































































