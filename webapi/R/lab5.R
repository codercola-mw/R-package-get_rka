library("httr")
library("jsonlite")

#gives a dataframe for the municipality data.
df_mun <- GET("http://api.kolada.se/v1/municipality")

#make dataframe into list.
ls_mun <- content(df_mun)

df_kpi <- GET("http://api.kolada.se/v1/kpi")

ls_kpi <- content(df_kpi)

df_kost <- GET("http://api.kolada.se/v1/kpi/grundskola%20kostnad")

ls_kost <- content(df_kost)