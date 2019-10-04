#' Shiny
#' 
#' @import shiny httr jsonlite

shinyServer(
  function(input, output){
    output$distPlot <- renderPlot({
      
      get_rka(input$info, input$ages)
      
      
      
    })
    
    
  }
)

shinyUI(fluidPage(
  titlePanel(title = "Income"),
  sidebarLayout(
    sidebarPanel((""),
                 textInput(inputId = "info", 
                           "Enter the County Council", 
                           "Stockholm"),
                 selectInput("ages", "Age interval:", choices=c("25-44","45-59"))
    ),
    
    
    mainPanel(
      plotOutput(outputId = "distPlot")
    )
  )
))

shiny::shinyApp(ui=ui, server=server)

