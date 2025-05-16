# Se carga la libreria quantmod para crear la aplicacion
install.packages("quantmod")  # Solo si no la tienes ya
library(quantmod)

# Se carga la informacion de la libreria y se muestra en pantalla
getSymbols("AAPL", src = "yahoo", from = "2023-01-01", to = Sys.Date())
head(AAPL)

# Se crea la grafica
chartSeries(AAPL, type = "candlesticks", theme = chartTheme("white"), TA = NULL)

chartSeries(AAPL, type = "candlesticks", theme = chartTheme("white"),
            TA = "addSMA(20);addSMA(50)")
















































