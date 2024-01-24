#### Preamble ####
# Purpose: Cleans the raw shooting data
# Author:fatimah Yunusa
# Date: 23 January 2024
# Contact: Fatimah Yunusa
# License: MIT


#### Workspace setup ####
library(tidyverse)
library(janitor)
library(dplyr)

#### Clean data ####
shooting_data_raw <- read_csv("inputs/data/shooting_data_raw.csv")

shootings <-shooting_data_raw |>
  janitor::clean_names()|>#this cleans up the names in the original data
  select(-c(index,category)) |># we will not be using these two columns
  rename(num_shootings=counter) #this alters the name of the numshootings column


#### Save data ####
write.csv(shootings, "inputs/data/shooting_data.csv")
