#' Date time convenience function (internal)
#' @noRd
current_date <- function() {
  Sys.Date();
}

#' Date time convenience function (internal)
#' @noRd
day_of_the_month <- function() {
  as.numeric(format.Date(current_date(), format="%e"))
}

#' Date time convenience function (internal)
#' @noRd
first_of_the_month <- function() {
  today <- day_of_the_month();
  current_date() - today + 1;
}
