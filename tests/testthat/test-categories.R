library(testthat)
library(httptest)
library(rnab)
library(withr)

with_mock_api({
  with_envvar(c(YNAB_TOKEN = "testingtoken",
                YNAB_CATEGORIES = "VARIABLE EXPENSES, FIXED EXPENSES, DEBT PAYMENTS, SAVING"), {
    test_that("We can get retrieve categories", {
      cats <- get_categories(1)
      expect_equal(cats$name[1], "Kids Activities")
      ids <- get_category_ids(1)
      expect_equal(ids[1], "1039")
      ns <- get_category_names(1)
      expect_equal(ns[1], "Kids Activities")
      acts <- get_category_activities(1)
      expect_equal(acts[5], 0, ignore_attr=TRUE)
    })
  })
})
