#### Preamble ####
# Purpose: Downloads and saves the data from the opendatatoronto package 
# Author: Fatimah Yunusa
# Date: 23 January 2024
# Contact: fatimah.yunusa@mail.utoronto.ca
# License: MIT
# Pre-requisites: none



#### Workspace setup ####
install.packages("opendatatoronto")
install.packages("dplyr")
install.packages("tidyverse")
library(tidyverse)
library(dplyr)
library(opendatatoronto)

#### Download data ####
#from https://open.toronto.ca/dataset/police-annual-statistical-report-shooting-occurrences/

# get package
package <- show_package("f29feb49-ceb1-44bf-a2b6-5fc6a0e6147a")
package

# get all resources for this package
resources <- list_package_resources("f29feb49-ceb1-44bf-a2b6-5fc6a0e6147a")

# identify datastore resources; by default, Toronto Open Data sets datastore resource format to CSV for non-geospatial and GeoJSON for geospatial resources
datastore_resources <- filter(resources, tolower(format) %in% c('csv', 'geojson'))

# load the first datastore resource as a sample
shooting_data <- filter(datastore_resources, row_number()==1) %>% get_resource()
shooting_data

#### Save data ####

write_csv(
  x = shooting_data,
  file = "inputs/data/shooting_data.csv")


