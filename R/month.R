#' Get current month's data
#'
#' @param budget the uuid, name, or index of the desired budget
#' @param last_knowledge optional "last knowledge" value to fetch only new info
#' @param token API token to use. (May be omitted if YNAB_TOKEN env variable
#'   is set.)
#' @return data.frame of this month's activity
#'
#' @importFrom uuid as.UUID
#' @export
get_current_month <- function(budget, last_knowledge=NULL, token=NULL) {
  categories <- NULL
  id <- as.UUID(budget)

  if(is.na(id)) {
    id <-  get_budget_id(budget)
  }
  dat <- yget(paste0("budgets/", id, "/months/current"),
                last_knowledge)$data$month
  return(l_of_l_to_df(dat$categories))
}


#' Get current month's total activity
#'
#' This is a convenience wrapper for get_current_month
#'
#' @param ... additional parameters passed to get_current_month including
#'    budget, last_knowledge, and token (the last two being optional.)
#'
#' @return vector of categories
#' @export
get_current_month_activity<- function(...) {
  return(sum(get_current_month(...)$activity))
}

#' Get current month's activities by category
#'
#' This is a convenience wrapper for get_current_month
#'
#' @param ... additional parameters passed to get_current_month including
#'    budget, last_knowledge, and token (the last two being optional.)
#'
#' @return vector of categories
#' @export
get_current_month_activities<- function(...) {
  dat <- get_current_month(...);
  dat <- dat[ , c('name', 'activity', 'budgeted')]
  return(dat)
}
