#' Shiny
#' 
#' @import shiny
library(webapi)
server <- function(input, output){
    output$distPlot <- renderPlot({
      
      get_rka(input$info, input$ages)
      
      
      
    })
    
    
}

#' Ui
#' 
#' @import shiny

ui <- shiny::fluidPage(
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
)

shiny::shinyApp(ui=ui, server=server)

