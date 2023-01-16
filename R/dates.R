#' Date time convenience function (internal)
current_date <- function() {
  Sys.Date();
}

#' Date time convenience function (internal)
day_of_the_month <- function() {
  as.numeric(format.Date(current_date(), format="%e"))
}

#' Date time convenience function (internal)
first_of_the_month <- function() {
  today <- day_of_the_month();
  current_date() - today + 1;
}
