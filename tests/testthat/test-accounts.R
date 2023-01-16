library(testthat)
library(rnab)
library(httptest)
library(withr)

with_mock_api({
  with_envvar(c(YNAB_TOKEN = "testingtoken"), {
    test_that("We can retrieve account info", {
      accts <- get_account_info(1)
      expect_identical(class(accts), "data.frame")
      expect_type(accts[,1], "character")
    })
  })
})
