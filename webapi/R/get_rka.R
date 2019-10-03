#' To get the city information from RKA API
#'
#' @param city The name of the city t
#'
#' @return the informations of the city
#' @export
#' @importFrom jsonlite fromJSON
#'
#' @examples get_rka(city = "stockholm")
#'
library(httr)
library("jsonlite")

get_rka <- function(city){

  rka  <- "http://api.kolada.se/v1/municipality/"
  
  rka_js <- GET(paste(rka,city, sep=""))
  
  parsed <- jsonlite::fromJSON(content(rka_js,"text"), simplifyVector = FALSE)
  
  df <- data.frame(parsed$values[[1]])

  return(df)
}










