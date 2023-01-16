# functions in this file are to convert API responses to a tidy data format,
# preserving numerical data types where applicable, converting NULL to NA (to
# prevent dropping variables) and converting lists to vectors.


#'
#' converts NULL to NA in list or vector
#'
#' @param x the vector to convert
#' @noRd
null_to_na <- function(x) {
  x[sapply(x, is.null)] <- NA
  x
}

#' converts list of lists to a data.frame
#'
#' NULLs are converted to NA, numeric values are converted to appropriate
#' type, and lists are converted to vectors.
#'
#' @param x the list of lists to convert
#' @importFrom dplyr mutate across
#' @importFrom magrittr "%>%"
#' @noRd
l_of_l_to_df <- function(x) {
  r <- sapply(x, null_to_na)
  as.data.frame(t(r)) %>%
    mutate(across(.fns = char_to_numeric)) %>%
    mutate(across(.fns = unlist))
}

#'
#' convert character to numeric if possible.
#'
#' If vector cannot be converted to numeric without introducing NA's,
#' returns original data (unlisted where applicable). Numeric data is
#' divide by 1000 to convert to decimal.
#'
#' @param x the list of lists to convert
#' @noRd
char_to_numeric <- function(x) {
  if(sum(is.na(x)) == length(x))
    return(x)
  o <- sum(is.na(x))
  a <- sum(is.na(suppressWarnings(as.numeric(x))))
  if(o == a) {
    return(as.numeric(x)/1000)
  }
  else if(class(x) == "logical") {
    return(as.logical(x))
  } else {
    return(as.character(x))
  }
}
