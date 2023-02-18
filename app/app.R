
# The App was made by following the tutorial at:https://shiny.rstudio.com/articles/shinyapps.html?_ga=2.189887211.113184949.1676739881-376124887.1676739881

library(shiny)

# Define UI for application that draws a histogram
ui <- fluidPage( selectInput("dataset", label = "Dataset", choices = ls("package:datasets")),
                 verbatimTextOutput("summary"),
                 tableOutput("table"))

server <- function(input, output, session){
  dataset <- reactive({
    get(input$dataset, "package:datasets")
  })
  
  output$summary <- renderPrint({
    # Use a reactive expression by calling it like a function
    summary(dataset())
  })
  
  output$table <- renderTable({
    dataset()
  })
}

shinyApp(ui, server)