library("ggmap")
library("dplyr")
# install.packages('forcats', dependencies = TRUE)
library("forcats")


us <- c(left = -125, bottom = 25.75, right = -67, top = 49)
get_stamenmap(us, zoom = 5, maptype = "toner-lite") %>% ggmap()

`%notin%` <- function(lhs, rhs) !(lhs %in% rhs)
# reduce crime to violent crimes in San Francisco
violent_crimes <- crime %>% 
  filter(
    offense %notin% c("auto theft", "theft", "burglary"),
    -95.39681 <= lon & lon <= -95.342,
    29.73631 <= lat & lat <=  29.78450
  ) %>% 
  mutate(
    offense = fct_drop(offense),
    offense = fct_relevel(offense, c("robbery", "aggravated assault", "rape", "murder"))
  )
# use qmplot to make a scatterplot on a map
qmplot(lon, lat, data = violent_crimes, zoom = 14, maptype = "toner-lite", color = I("red"))
