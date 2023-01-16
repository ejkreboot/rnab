library(testthat)
library(httptest)
library(rnab)
library(withr)

with_mock_api({
  with_envvar(c(YNAB_TOKEN = "testingtoken"), {
      test_that("We can get access the API", {
      bud <- yget("budgets")
      expect_gt(length(bud$data), 0)
    })
  })
})
