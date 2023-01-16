library(testthat)
library(rnab)
library(httptest)

with_mock_api({
  test_that("We can get retrieve account info", {
    accts <- get_account_info(1)
    expect_identical(class(accts), "data.frame")
    expect_type(accts[,1], "character")
  })
})
