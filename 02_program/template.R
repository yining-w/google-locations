remove(list=ls())

# load packages
library(ggmap)
library(tidyverse)
library(tidyr)

## Set Up Directory
user <- Sys.getenv("USERNAME")

clone <- paste0("C:/Users/", user, "/Github/google-locations")

## Register API
# Walkthrough to Set Up Google API Key here: 
# https://towardsdatascience.com/breaking-down-geocoding-in-r-a-complete-guide-1d0f8acd0d4b
register_google(key = 'ENTER GOOGLE API KEY')

## Read Data
facilities <- read.csv(paste0(clone, "/01_raw/data.csv"))

## If applicable, concatenate levels of location vars into one (Ex, name + district + province)
# unite(): unite('new var name', first col:last col, separator, remove original cols=FALSE)
facilities <- facilities %>% unite('location', facility:province, sep=", ", remove=FALSE)

# Run the search based on the name 
facilities_geocoded <- geocode(location = facilities$location, output = "more", source = "google")
