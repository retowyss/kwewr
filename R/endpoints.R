#' Get Keyword Data
#'
#' @description Get Volume, CPC and competition for a set of keywords.
#'    For details consult [Keywords Everywhere API Docs](https://api.keywordseverywhere.com/docs/#/keywords/get_keywords_data)
#'
#' @param keywords Vector of keywords, has to be fewer than 100.
#' @param country Counry code also see \link[kwewr]{get_countries}
#' @param currency Currency code also see \link[kwewr]{get_currencies}
#' @param data_source "gkp" or "cli", NULL will default to cli
#' @inheritParams get_countries
#'
#' @return list with volume, cpc, competion by keyword
#' @export
#'
#' @examples
#' \dontrun{
#' get_keywords_data(c("keywords tool", "keyword planner"))
#' get_keywords_data(c("keywords tool", "keyword planner"), country = "us")
#' }
get_keyword_data <- function(keywords = c(),
                             country = NULL,
                             currency = NULL,
                             data_source = NULL,
                             api_key = config::get("key"),
                             parse_response = TRUE) {
  stopifnot(length(keywords) > 0 & length(keywords) <= 100)
  endpoint <- "https://api.keywordseverywhere.com/v1/get_keyword_data"
  # Have to build list containing multiple items named "kw[]"
  query <- c(
    list(
      country = country,
      currency = currency,
      dataSource = data_source
    ),
    do.call(c, args = lapply(keywords, function(kw) list("kw[]" = kw)))
  )
  response <- POST(url = endpoint,
    body = query,
    kwew_headers(api_key),
    encode = "form"
  )
  handle_response(response, parse_response)
}

#' Get Countries
#'
#' @description List of the countries supported by the API.
#'
#' @param api_key API key
#' @param parse_response Should we parse the response as a list?
#'
#' @return list of countries
#' @export
#'
#' @examples
#' \dontrun{
#' get_countries()
#' }
get_countries <- function(api_key = config::get("key"), parse_response = TRUE) {
  endpoint <- "https://api.keywordseverywhere.com/v1/countries"
  response <- GET(url = endpoint, kwew_headers(api_key))
  handle_response(response, parse_response)
}

#' Get Currencies
#'
#' @description List of the currencies supported by the API.
#'
#' @inheritParams get_countries
#' @return list of currencies
#' @export
#'
#' @examples
#' \dontrun{
#' get_currencies()
#' }
get_currencies <- function(api_key = config::get("key"),
                           parse_response = TRUE) {
  endpoint <- "https://api.keywordseverywhere.com/v1/currencies"
  response <- GET(url = endpoint, kwew_headers(api_key))
  handle_response(response, parse_response)
}
