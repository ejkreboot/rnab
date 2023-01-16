#' Core GET request wrapper
#'
#' @param endpoint the API endpoint to request.
#' @param last_knowledge the last_knowledge value, if known, to prevent
#'   reloading data previously requested.
#' @param token API token to use. (May be omitted if YNAB_TOKEN env variable
#'   is set.)
#'
#' @return data returned by request.
#' @importFrom httr GET add_headers content
#' @export
yget <- function(endpoint, last_knowledge=NULL, token = NULL) {
  if(is.null(token)) {
      t = Sys.getenv("YNAB_TOKEN")
      if(nchar(t) > 0) {
        token <- t
      } else {
        stop("API Token must be provided as argument or stored in YNAB_TOKEN environment variable.")
      }
  }
  url <- paste0("https://api.youneedabudget.com/v1/", endpoint)
  if(!is.null(last_knowledge)) {
    url <- paste0(url, "?last_knowledge_of_server=", last_knowledge)
  }
  r  <- GET(url,
            add_headers(Authorization = paste("Bearer", token)))
  content(r)
}

#' Core PUT request wrapper
#'
#' @param endpoint the API endpoint to request.
#' @param body data to send to the endpoint
#' @param token API token to use. (May be omitted if YNAB_TOKEN env variable
#'   is set.)
#'
#' @return boolean indicating whether PUT was successful
#' @importFrom httr PUT add_headers status_code
#' @export
yput <- function(endpoint, body, token = NULL) {
  if(is.null(token)) {
    t = Sys.getenv("YNAB_TOKEN")
    if(nchar(t) > 0) {
      token <- t
    } else {
      stop("API Token must be provided as argument or stored in YNAB_TOKEN environment variable.")
    }
  }
  url <- paste0("https://api.youneedabudget.com/v1/", endpoint)
  r  <- PUT(url,
            body = body,
            add_headers('Content-Type' = "application/json", 'Authorization' = paste("Bearer", token)))
  print(httr::headers(r))
  print(r)
  if(status_code(r) == 200) {
    return(TRUE)
  } else {
    return(FALSE)
  }
}
