context("get_rka")

  test_that("get_rka rejects errounous input", {
    expect_error(get_rka("Paris", "23"))
    expect_error(get_rka("12345", "53"))
  })
  
  test_that("get_rka class is correct", {
    test_rka <- get_rka(city = "Stockholm", "25-44")
    expect_is(test_rka, "list")
  })
  
  test_that("The web API is not correct", {
    expect_error(check_API("http://api.kolada.se/v1/data/permunicipality/"))
  })
  
  test_that("get_rka gives correct output", {
    test_rka <- get_rka(city = "Stockholm", "25-44")
    test_rka <- data.frame(test_rka)
    expect_that(length(test_rka[1,1]), equals(1))
    expect_output(print(test_rka[1,2]), "106817.8")
  })
    
  test_that("get_rka gives correct plot attribute names", {
    test_rka <- unlist(get_rka(city = "Stockholm", "25-44"))
    expect_true(names(test_rka)[1] == "rect.w")
    expect_true(names(test_rka)[5] == "text.x1")
  })
  
  test_that("get_rka gives correct output", {
    test_rka <- get_rka("Uppsala", "25-44")
    expect_true(all(round(test_rka$text$x,3) %in% c(2013.924, 2013.924)))
    expect_true(all(test_rka$rect$left %in% c(2010)))
    expect_true(all(test_rka$rect$left %in% 2010))
    expect_output(print(test_rka$rect$top),"140000")
  })
  
  test_that("get_rka gives wrong output", {
    test_rka <- get_rka("Uppsala", "25-44")
    expect_false(all(test_rka$rect$h %in% 106818.8))
    expect_false(all(test_rka$rect$left %in% 2011))
  })
  
  
  