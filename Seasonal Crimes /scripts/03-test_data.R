#### Preamble ####
# Purpose: Tests the simulation data 
# Author: fatimah Yunusa
# Date: 23 January 2024
# Contact: fatimah.yunusa@mail.utoronto.ca
# License: MIT
# Pre-requisites: run 00-simulate_data.R first. 



#### Workspace setup ####
library(tidyverse)
#creates the simulated data we want to test 

generate_simulated_data <- function() {
  set.seed(300)
  years <- rep(2014:2019, each = 45)
  divisions <- rep(paste0("D", 11:55), times = 6)
  shooting_counts <- sample(1:10, 270, replace = TRUE)
  tibble::tibble(
    OccurredYear = years,
    GeoDivision = divisions,
    Count_ = shooting_counts
  )
}

#### Test data ####

# Check if the dimensions are as seen 
expect_equal(nrow(simulated_data), 270)
expect_equal(ncol(simulated_data), 3)

# Check if OccurredYear is within the expected range
expect_true(all(simulated_data$OccurredYear %in% 2014:2019))

# Check if GeoDivision contains the expected divisions
expect_true(all(simulated_data$GeoDivision %in% paste0("D", 11:55)))

# Check if Count_ values are within the expected range
expect_true(all(simulated_data$Count_ %in% 1:10))
})