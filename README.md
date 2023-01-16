
# rnab

<!-- badges: start -->
<!-- badges: end -->

This package provide a basic wrapper to the You Need A Budget API.

## Pre-requisites

You will need an [API token](https://api.youneedabudget.com/#quick-start) for your need a budget account to use this package.

You can provide your token to each function call as an argument, but it will 
be simpler to set the YNAB_TOKEN environment variable instead. You can do 
this from an R session with:

```
Sys.setenv("YNAB_TOKEN" = "YOUR_YNAB_TOKEN")

```

Or other approaches, such as using the `dotenv` package, setting in your 
`.bashrc` file, or elsewhere.


## Installation

``` r
# install.packages("devtools")
devtools::install_github("ejkreboot/rnab")
```

## Example

This is a basic example which shows you how to solve a common problem:

``` r
library(rnab)

# get a list of your budgets
budgets <- get_budget_names(YOUR_TOKEN)

# get a summary of your activity month to date for the first budget 
# in YNAB's list of your budgets (which may be the only budget if you 
# only have one.)
this_month <- get_current_month(1, YOUR_TOKEN);

```

## Function List

For a complete list of functions and links to their help pages enter the 
following in an R session and follow the resulting link:

```
??rnab
```


