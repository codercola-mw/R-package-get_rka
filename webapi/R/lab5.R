library("httr")
library("jsonlite")

#gives a dataframe for the municipality data.
df_mun <- GET("http://api.kolada.se/v1/municipality")

#make dataframe into list.
ls_mun <- content(df_mun)


