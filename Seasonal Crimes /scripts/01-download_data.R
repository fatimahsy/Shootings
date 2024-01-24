#### Preamble ####
# Purpose: Downloads and saves the data from opendatatoronto
# Author: Fatimah Yunusa
# Date: 23 January 2024
# Contact: fatimah.yunusa@mail.utoronto.ca
# License: MIT
# Pre-requisites: none



#### Workspace setup ####
library(tidyverse)
library(dplyr)
library(opendatatoronto)

shooting_data_raw <- read.csv("shooting_data.csv", header = TRUE, sep = ",")


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
data <- filter(datastore_resources, row_number()==1) %>% get_resource()
data

shooting_data_raw <-get_resource(resource ="b4fd5f2f-fe0d-4229-af47-d87d91fc14ce")
shooting_data_raw

#### Save data ####
# [...UPDATE THIS...]
# change the_raw_data to whatever name you assigned when you downloaded it.
write.csv(shooting_data_raw, "inputs/data/shooting_data_raw.csv") 

         
shooting_data_raw <- read.csv("shooting_data.csv", header = TRUE, sep = ",")

