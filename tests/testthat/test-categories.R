library(testthat)
library(httptest)
library(rnab)
library(withr)

with_mock_api({
  with_envvar(c(YNAB_TOKEN = "testingtoken"), {
    test_that("We can get retrieve categories", {
      cats <- get_categories(1)
      expect_equal(cats$name[1], "Card 1")
      ids <- get_category_ids(1)
      expect_equal(ids[1], "91b4")
      ns <- get_category_names(1)
      expect_equal(ns[1], "Card 1")
      acts <- get_category_activities(1)
      expect_equal(acts[5], 4.99, ignore_attr=TRUE)
    })
  })
})
