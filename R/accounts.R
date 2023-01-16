#' Get accounts and balances
#'
#' @param budget Either a numeric index or name of budget.
#' @param last_knowledge An (optional) integer specifying last result from server such
#'   that only new data is returned.
#' @param token API token to use. (May be omitted if YNAB_TOKEN env variable
#'   is set.)
#' @return a dataframe containig account details.
#'
#' @importFrom uuid as.UUID
#' @export
get_account_info <- function(budget, last_knowledge = NULL, token = NULL) {
  first <- first_of_the_month()
  id <- as.UUID(budget)
  if(is.na(id)) {
    id <-  get_budget_id(budget)
  }
  url <- paste0("budgets/", id, "/accounts")
  dat <- yget(url, last_knowledge)
  l_of_l_to_df(dat$data$accounts)
}
