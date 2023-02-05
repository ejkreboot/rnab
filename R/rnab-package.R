#' @keywords internal
#' @title RNAB Package
#'
#' @description
#' This package provides a thin wrapper around the
#' \href{https://api.youneedabudget.com/}{YNAB API} for incorporation into
#' your R projects. See man pages for individual functions (linked below)
#' for details.
#'
#' Note that to use these functions you will need an
#' \href{https://api.youneedabudget.com/#quick-start}{API token} for your YNAB.
#' You can provide your token to each function call as an argument,
#' but it will be simpler to set the YNAB_TOKEN environment variable instead.
#' You can do this from an R session with:
#' \code{Sys.setenv("YNAB_TOKEN" = "YOUR_YNAB_TOKEN")}
#'
#' @rdname rnab
#'
#' @examples
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
#' \link[rnab]{update_transactions}
#'
#' @aliases rnab
"_PACKAGE"

## usethis namespace: start
## usethis namespace: end
NULL
