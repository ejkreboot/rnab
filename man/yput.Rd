% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/api.R
\name{yput}
\alias{yput}
\title{Core PUT request wrapper}
\usage{
yput(endpoint, body, token = NULL)
}
\arguments{
\item{endpoint}{the API endpoint to request.}

\item{body}{data to send to the endpoint}

\item{token}{API token to use. (May be omitted if YNAB_TOKEN env variable
is set.)}
}
\value{
boolean indicating whether PUT was successful
}
\description{
Core PUT request wrapper
}
