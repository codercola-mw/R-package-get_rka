[![Build Status](https://travis-ci.org/codercola-mw/lab5.svg?branch=master)](https://travis-ci.org/codercola-mw/lab5)
# lab5
A package connect to the API


# Example use of this package
This packages uses function e.g.`< get_rka(city = "Stockholm")  >` to find out the income gap between male and female in the particular municipality by accessing the API: http://api.kolada.se/v1/data/permunicipality/


The function will show a plot that indicates the income of male and female by time series.

## The income in Stockholm
```{r, include = TRUE}
get_rka(city = "Stockholm", "25-44")

```

## The income in Uppsala
```{r, include = TRUE}
get_rka(city = "Uppsala", "25-44")
```

# Shiny
If you want to find the graph via Shiny, you can use
`<shiny::runGitHub(repo = "codercola-mw/lab5/", subdir = "inst/app")>`

