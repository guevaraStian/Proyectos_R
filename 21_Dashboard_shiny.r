install.packages("shiny")
library(shiny)

# Interfaz de usuario
ui <- fluidPage(
  titlePanel("Ejemplo de Dashboard con la libreria Shiny"),

  sidebarLayout(
    sidebarPanel(
      selectInput("xvar", "Variable en el eje X:", choices = names(mtcars), selected = "mpg"),
      selectInput("yvar", "Variable en el eje Y:", choices = names(mtcars), selected = "hp")
    ),

    mainPanel(
      plotOutput("scatterPlot"),
      verbatimTextOutput("summary")
    )
  )
)

# Lógica del servidor
server <- function(input, output) {

  output$scatterPlot <- renderPlot({
    plot(
      mtcars[[input$xvar]], mtcars[[input$yvar]],
      xlab = input$xvar,
      ylab = input$yvar,
      main = paste("Gráfico de", input$yvar, "vs", input$xvar),
      col = "blue", pch = 19
    )
  })

  output$summary <- renderPrint({
    summary(mtcars[, c(input$xvar, input$yvar)])
  })
}

# Ejecutar la aplicación
shinyApp(ui = ui, server = server)



























































