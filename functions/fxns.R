
# A .R script that contains commonly used functions for cleaning and exploratory analysis

library(tidyverse)
library(vroom)
library(janitor)
library(sf)
library(viridis)
library(leaflet)
library(htmltools)

#lowers case of every character column in a dataframe
lower_df <- function(input_df){
  names <- colnames(input_df)
  output_df <- input_df
  names <- colnames(output_df)
  for (name in names){
    if (is.character(output_df[[name]])){
      output_df[[name]] <- tolower(output_df[[name]])
      #print('yes')
    } else {
      output_df[[name]] <- output_df[[name]]
      #print('no')
    }
  }
  return(output_df)
}



clean_df <- function(input_df){
  temp <- input_df %>%
    clean_names() %>%
    lower_df()
  return(temp)

}

# Negate the %in% function
Negate("%in%") -> `%notin%`
