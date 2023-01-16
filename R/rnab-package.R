#' @keywords internal
#' @title RNAB Package
#'
#' These functions are used to convert
#
#' @rdname rnab
#' @param budget integer index or UUID of desired budget
#' @param token API token (may be omitted if specified in YNAB_TOKEN
#'   environment variable.
#' @examples # Stringify some data
#' @aliases rnab
#'
#' \dontrun{
#' library(rnab)
#' # get a list of your budgets
#' budgets <- get_budget_names(YOUR_TOKEN)
#'
#' get a summary of your activity month to date for the first budget
#' in YNAB's list of your budgets (which may be the only budget if you
#' only have one.)
#' this_month <- get_current_month(1, YOUR_TOKEN);
#' }
#'
#' @section Functions:
#'
#'
#' \link[rnab]{get_budget_id}
#'
#' \link[rnab]{get_categories}
#'
#' \link[rnab]{get_account_info}
#'
#' \link[rnab]{get_budget_id}
#'
#' \link[rnab]{get_budget_names}
#'
#' \link[rnab]{get_categories}
#'
#' \link[rnab]{get_category_actvities}
#'
#' \link[rnab]{get_category_balances}
#'
#' \link[rnab]{get_category_goals}
#'
#' \link[rnab]{get_get_category_ids}
#'
#' \link[rnab]{get_get_category_names}
#'
#' \link[rnab]{get_current_month}
#'
#' \link[rnab]{get_current_month_activities}
#'
#' \link[rnab]{get_current_month_activity}
#'
#' \link[rnab]{get_current_transactions}
#'
#' \link[rnab]{put_transaction}
#'
"_PACKAGE"

## usethis namespace: start
## usethis namespace: end
NULL
