#' Get budget name by index or name
#'
#' @param n Either a numeric index or name of budget
#' @param token API token to use. (May be omitted if YNAB_TOKEN env variable
#'   is set.)
#'
#' @return id (uuid format) of matching budget or NULL if not found
#' @export
get_budget_id <- function(n, token = NULL) {
  res <- yget("budgets")$data$budgets
  id <- NULL
  if(is.numeric(n)) {
    tryCatch({
      id <- res[[n]]$id
    }, error = function(e) {
      id <- NULL
    })
  } else if(is.character(n)){
    for(b in res) {
      if(b$name == n)
        id = b$id
    }
  }
  return(id)
}

#' Get vector of budget names
#'
#' @param token API token to use. (May be omitted if YNAB_TOKEN env variable
#'   is set.)
#'
#' @return vector of names
#' @export
get_budget_names <- function(token = NULL) {
  res <- yget("budgets")
  names <- NULL
  for(b in res$data$budgets) {
    names = c(names, b$name)
  }
  names
}

