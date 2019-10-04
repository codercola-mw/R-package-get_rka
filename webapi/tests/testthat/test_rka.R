context("test_rka.R")
library(httr)
library(jsonlite)

  test_that("get_rka rejects errounous input", {
    expect_error(get_rka("Paris", "23"))
    expect_error(get_rka("12345", "53"))
  })
  
  # test_that("get_rka class is correct", {
  #   test_rka <- get_rka(city = "Stockholm", "25-44")
  #   expect_is(test_rka, "list")
  # })
  

  
