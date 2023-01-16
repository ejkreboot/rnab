library(testthat)
library(httptest)
library(rnab)
library(withr)

with_mock_api({
  with_envvar(c(YNAB_TOKEN = "testingtoken"), {
    test_that("We can get retrieve categories", {
      month <- get_current_month(1)
      expect_equal(class(month), "data.frame")
      act <- get_current_month_activity(1)
      expect_equal(act, 0)
      total <- get_current_month_activities(1)
      expect_equal(total[1,2], 0)
    })
  })
})
