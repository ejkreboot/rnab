globalVariables("g")

CATEGORIES = NULL;

if(nchar(Sys.getenv("YNAB_CATEGORIES"))) {
  cats <- gsub(", ", ",", Sys.getenv("YNAB_CATEGORIES"))
  cats <- gsub("^ ", "", cats)
  CATEGORIES = strsplit(cats, ",")[[1]]
}

#' Get categories for specified budget
#'
#' @param budget the uuid, name, or index of the desired budget
#' @param last_knowledge optional "last knowledge" value to fetch only new info
#' @param token API token to use. (May be omitted if YNAB_TOKEN env variable
#'   is set.)
#'
#' @return data.frame of categories and related data
#' @importFrom dplyr inner_join
#' @importFrom foreach foreach "%do%"
#' @importFrom uuid as.UUID
#' @export
get_categories <- function(budget, last_knowledge=NULL, token = NULL) {
  id <- as.UUID(budget)

  if(is.na(id)) {
    id <-  get_budget_id(budget)
  }

  groups <- yget(paste0("budgets/", id, "/categories"),
                last_knowledge,
                token)$data$category_groups
  categories <- foreach( g = groups,
                         .errorhandling = "remove",
                         .combine = rbind ) %do% {
    if(length(g$categories) == 0)
      stop()
    r <- l_of_l_to_df(g$categories)
    r
  }
  group_info <- foreach(g = groups, .combine = rbind, .final = as.data.frame) %do% {
    r <- c(g$id, g$name)
    names(r) <- c("category_group_id", "category_name")
    r
  }
  categories <- as.data.frame(categories)
  r <- inner_join(categories, group_info, by=c("category_group_id"))
  if(!is.null(CATEGORIES)) {
    ix <- which(r$category_name %in% CATEGORIES)
    r <- r[ix,]
  }
  r
}

#' Get category ids for specified budget
#'
#' This is a convenience wrapper for get_categories
#'
#' @param ... additional arguments to get_categories (budget,
#' last_knowledge, and token, the last two of which are optional.)
#'
#' @return vector of category ids
#'
#' @export
get_category_ids <- function(...) {
  cats <- get_categories(...);
  cats$id
}

#' Get category names for specified budget
#'
#' This is a convenience wrapper for get_categories
#'
#' @param ... additional arguments to get_categories (budget,
#' last_knowledge, and token, the last two of which are optional.)
#'
#' @return vector of category names
#' @export
get_category_names <- function(...) {
  cats <- get_categories(...)
  cats$name
}

#' Get category balances for specified budget
#'
#' This is a convenience wrapper for get_categories
#'
#' @param ... additional arguments to get_categories (budget,
#' last_knowledge, and token, the last two of which are optional.)
#'
#' @return vector of activities
#' @importFrom purrr map
#' @export
get_category_balances <- function(...) {
  cats <- get_categories(...);
  bals <- cats$balance
  names(bals) <- cats$name;
}


#' Get category activities for specified budget
#'
#' This is a convenience wrapper for get_categories
#'
#' @param ... additional arguments to get_categories (budget,
#' last_knowledge, and token, the last two of which are optional.)
#'
#' @return vector of activities
#' @importFrom purrr map
#' @export
get_category_activities <- function(...) {
  cats <- get_categories(...);
  acts <- cats$activity
  names(acts) <- cats$name
  acts
}

#' Get category goals for specified budget
#'
#' This is a convenience wrapper for get_categories
#'
#' @param ... additional arguments to get_categories (budget,
#' last_knowledge, and token, the last two of which are optional.)
#'
#' @return vector of activities
#' @importFrom purrr map
#' @export
get_category_goals <- function(...) {
  cats <- get_categories(...)
  goals <- cats$goal_target
  names(goals) <- cats$name
  goals
}

