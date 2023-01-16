library(testthat)
library(httptest)
library(rnab)

with_mock_api({
  test_that("We can get access the API", {
    bud <- yget("budgets")
    expect_gt(length(bud$data), 0)
  })
})
