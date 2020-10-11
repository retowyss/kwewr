kwew_headers <- function(api_key) {
  add_headers(
    "Authorization" = paste("Bearer", api_key),
    "Accept" = "application/json"
  )
}

handle_response <- function(response, parse_response) {
  if(parse_response) {
    result <- fromJSON(rawToChar(response$content))
    result$time_stamp <- response$date
    result
  } else {
    response
  }
}
