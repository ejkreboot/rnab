EXCLUDE_CATEGORIES <- c(
  "Starting Balance"
)

#' Get transactions for current month
#'
#' @param budget the uuid, name, or index of the desired budget
#' @param last_knowledge optional "last knowledge" value to fetch only new info
#' @param token API token to use. (May be omitted if YNAB_TOKEN env variable
#'   is set.)
#'
#' @return vector of categories
#' @importFrom uuid as.UUID
#' @export
get_current_transactions <- function(budget, last_knowledge=NULL, token = NULL) {
  first <- first_of_the_month()
  id <- as.UUID(budget)
  categories <- NULL
  if(is.na(id)) {
    id <-  get_budget_id(budget, token)
  }

  url <- paste0("budgets/", id, "/transactions?since_date=", first)
  if(!is.null(last_knowledge)) {
    url <- paste0(url, "&last_knowledge_of_server=", last_knowledge)
  }
  dat <- yget(url, token)$data$transactions
  return(l_of_l_to_df(dat))
}

#' Put a transaction (to modify)
#'
#' @param budget the uuid, name, or index of the desired budget
#' @param transaction the transaction data
#' @param token API token to use. (May be omitted if YNAB_TOKEN env variable
#'   is set.)
#'
#' @return http response
#' @importFrom uuid as.UUID
#' @importFrom jsonlite toJSON unbox
#' @export
put_transaction <- function(budget, transaction, token = NULL) {
  id <- as.UUID(budget)

  if(is.na(id)) {
    id <-  get_budget_id(budget)
  }

  url <- paste0("budgets/", id, "/transactions/", transaction$id)
  yput(url, toJSON(list(transaction=unbox(transaction[1,]))))
}
