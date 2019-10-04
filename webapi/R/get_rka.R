#' To get the city information from RKA API
#'
#' @name get_rka
#'
#' @param city The name of the city in Sweden
#' @return the informations of the city
#' @export
#' @import httr jsonlite
#' 
library(httr)
library(jsonlite)

get_rka <- function(city){

  rka  <- "http://api.kolada.se/v1/municipality/"
  
  rka_js <- GET(paste(rka,city, sep=""))
  
  parsed <- jsonlite::fromJSON(content(rka_js,"text"), simplifyVector = FALSE)
  
  df <- data.frame(parsed$values[[1]])

  return(df)
}

#library("httr")
#library("jsonlite")

#gives a dataframe for the municipality data.
#df_mun <- GET("http://api.kolada.se/v1/municipality")

#make dataframe into list.
#ls_mun <- content(df_mun)










