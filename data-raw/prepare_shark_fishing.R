# Data preparation for Estimates of Shark at-vessel, Post-release Mortality, and Retention Ban Effects on Stopping Overfishing
# Source: Feitosa, Leonardo Manir et al. (2025) - Dryad repository  
# DOI: 10.5061/DRYAD.0P2NGF27T
# License: CC0 1.0 Universal
# Prepared: 2024-07-09

library(readr)
library(dplyr)
library(usethis)

# Read the raw data
raw_data <- read_csv("data-raw/raw_data/Feitosa_etal_2025_shark_fishing.csv")

# Examine the data structure
cat("Original data structure:\n")
str(raw_data)
cat("\nFirst few rows:\n")
head(raw_data)
cat("\nUnique values in key columns:\n")
sapply(raw_data[c("estimate_type", "gear_class", "reproductive_mode", "habitat")], function(x) unique(x))

# Clean and prepare the data for package inclusion
shark_fishing <- raw_data %>%
  # Convert categorical variables to factors
  mutate(
    scientific_name = as.factor(scientific_name),
    family = as.factor(family),
    reproductive_mode = as.factor(reproductive_mode),
    ventilation_method = as.factor(ventilation_method),
    habitat = as.factor(habitat),
    estimate_type = as.factor(estimate_type),
    gear_class = as.factor(gear_class),
    estimate_type_new = as.factor(estimate_type_new)
  ) %>%
  # Arrange logically
  arrange(scientific_name, estimate_type)

# Verify the cleaned data
cat("\nCleaned data structure:\n")
str(shark_fishing)

# Check for any missing values or issues
cat("\nMissing values per column:\n")
sapply(shark_fishing, function(x) sum(is.na(x)))

# Save to package data (compressed .rda format for CRAN)
usethis::use_data(shark_fishing, overwrite = TRUE)

cat("\n✅ Dataset 'shark_fishing' prepared and saved!\n")
cat("Size of final dataset:", object.size(shark_fishing), "bytes\n") 