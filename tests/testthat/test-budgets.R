library(testthat)
library(httptest)
library(rnab)
library(withr)

with_mock_api({
  with_envvar(c(YNAB_TOKEN = "testingtoken"), {
    test_that("We can get retrieve a budget id", {
      id <- get_budget_id(1)
      expect_equal(id, "2af1")
    })
    test_that("We can get retrieve budget names", {
      n <- get_budget_names()
      expect_equal(n[2], "Budget 2")
    })
  })
})
