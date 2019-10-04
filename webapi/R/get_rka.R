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


#http://api.kolada.se/v2/oudata/kpi/N15033/year/2019,2009

get_rka <- function(city){

  rka  <- "http://api.kolada.se/v1/municipality/"
  
  rka_js <- GET(paste(rka,city, sep=""))
  
  parsed <- jsonlite::fromJSON(content(rka_js,"text"), simplifyVector = FALSE)
  
  df <- data.frame(parsed$values[[1]])
  
  rka2 <- GET(paste("http://api.kolada.se/v1/data/permunicipality/N60946/",df[,1], sep=""))
  parsed2 <- jsonlite::fromJSON(content(rka2,"text"), simplifyVector = FALSE)
  
  newparsed <- parsed2[-2]
  salaries <- matrix(unlist(newparsed), ncol = 6, byrow = TRUE)
  Years <- salaries[,3]
  b <- salaries[,5]
  c <- salaries[,6]
  
  
  df2 <- data.frame(salaries[,3], salaries[,4], salaries[,5], salaries[,6])
  colnames(df2) <- c("Years", "Median_income", "Male", "Female")
  print(df2)
  
  theplot <- function(){
    plot(Years,b, main = city, ylab = "Income", ylim = c(0,400000), type="l", yaxt="n", col = 4)
    lines(Years,c, col =2) 
    axis(2,cex.axis=0.9, at=pretty(c(0,b)), labels=format(pretty(c(0,b)), big.mark="", scientific=F)) 
    legend(2010,140000, legend=c("Men", "Women"), col=c("blue", "red"), lty=1:2, cex=0.8)
  }

  return(theplot())
  
  
}

# get_rka("Stockholm")




