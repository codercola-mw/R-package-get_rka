#' This is an example of the shiny app.
#' 
#' @import shiny
#' @export

get_rkaApp <- function(){
   directions <- base::system.file("app", "app.R", package = "lab5") 
  shiny::runApp(directions, display.mode = "normal")
}
