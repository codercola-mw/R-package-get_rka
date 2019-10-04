#' This is an example of the shiny app.
#' 
#' @importFrom  shiny runApp
#' @export

get_rka <- function(){
 
  directions <- base::system.file("app", "app.R", package = "lab5") 
  shiny::runapp(directions, display.mode = "normal")
}
