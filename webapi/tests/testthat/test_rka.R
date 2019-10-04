context("test_rka.R")
library(httr)
library(jsonlite)

  
  test_that("get_rka rejects errounous input", {
    expect_error(get_rka("Paris"))
    expect_error(get_rka("12345"))
  })
  
  test_that("get_rka class is correct", {
    test_rka <- get_rka(city = "Stockholm")
    
    expect_is(test_rka, "data.frame")
  })
  
 
  
