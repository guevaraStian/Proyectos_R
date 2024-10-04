#Arbole desicion
#Se importan la libreria shiny que tiene una tabla de informacion
install.packages("shiny")

library(shiny)
#Se crea las variables que tendra la parte visual de la aplicacion
ui <- fluidPage(titlePanel("Old faithful geyser Data"), sidebarLayout(sidebarPanel(sliderInput("bins", "number of bins", min=1, max=50, value=30)), mainPanel(plotOutput("distPlot"))))

#En esta variable server, se crea las funciones iteractivas de la aplicacion
server <- function(input, output) { output$distPlot <- renderPlot({ x <- faithful[, 2] bins <- seq(min(x), max(x), length.out = input$bins + 1) hist(x, breaks = bins, col = 'darkgray', border = 'white', xlab = 'waiting time to next eruption', main = 'Histogram of waiting times')})}

#Se ejecuta shiny app
shinyApp(ui = ui, server = server)



































































