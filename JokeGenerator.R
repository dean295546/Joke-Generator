library(httr)
library(jsonlite)

get_joke <- function() {
  response <- GET("https://v2.jokeapi.dev/joke/Any")
  joke_data <- fromJSON(content(response, "text"))
  
  if (joke_data$type == "single") {
    return(joke_data$joke)
  } else {
    return(paste(joke_data$setup, "\n\n", joke_data$delivery))
  }
}

cat(get_joke(), "\n")