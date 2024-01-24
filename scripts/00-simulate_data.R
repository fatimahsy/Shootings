#### Preamble ####
# Purpose: Simulates the data for number of shootings in Toronto. 
# Author: Fatimah Yunusa 
# Date: 23 January 2024
# Contact: fatimah.yunusa@mail.utoronto.ca
# License: MIT
# Pre-requisites: 



#### Workspace setup ####
library(tidyverse)
library(ggplot2)
library(tibble)

#### Simulate data ####


# Create a simulated dataset
set.seed(300)
years <- rep(2014:2019, each = 1)  # Years 2014 to 2019
crime_counts <- sample(50:100, 6, replace = TRUE)  # Simulated crime counts

simulated_data <- data.frame(OccurredYear = years, Count_ = crime_counts)

# Plot the time series graph
ggplot(simulated_data, aes(x = OccurredYear, y = Count_, group = 1)) +
  geom_line() +
  geom_point() +
  labs(title = "Simulated Number of Crimes in Toronto (2014-2019)",
       x = "Year",
       y = "Number of Crimes") +
  theme_minimal()


# Define years and geographic divisions
years <- rep(2014:2019, each = 45)  # 45 divisions per year
divisions <- rep(paste0("D", 11:55), times = 6)  # D11 to D55 divisions

# Simulates the  shooting occurrence counts
shooting_counts <- sample(1:10, 270, replace = TRUE)

# Creates a simulated tibble
simulated_data <- tibble(
  OccurredYear = years,
  GeoDivision = divisions,
  Count_ = shooting_counts
)

head(simulated_data)



