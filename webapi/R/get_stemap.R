library(httr)
openmap = " https://api.openstreetmap.org/"

get_stemap <- function(zoom , x ,y ){

z = 12
x = 657
y = 1583
#https://stamen-tiles.a.ssl.fastly.net

a <- paste("http://tile.stamen.com/terrain/",z,"/",x,"/",y,".jpg", sep="" )

stemap <- GET(a)

return()

}