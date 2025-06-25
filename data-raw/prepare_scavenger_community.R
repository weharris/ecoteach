
# Data preparation for Scavenger community structure along an environmental gradient from boreal for...
# Source: [AUTHOR] et al. (2020) - Dryad repository  
# DOI: 10.1002/ece3.6834
# License: CC0 1.0 Universal
# Prepared: 2025-06-25

library(readr)
library(dplyr)
library(usethis)

# Read the raw data
raw_data <- read_csv("data-raw/raw_data/Gomo_etal_2021_scavenger_community.csv")

# Examine the data structure
cat("Original data structure:\n")
str(raw_data)
cat("\nFirst few rows:\n")
head(raw_data)
cat("\nUnique values in key columns:\n")
# Add specific columns to check:
# sapply(raw_data[c("column1", "column2")], function(x) unique(x))

# Clean and prepare the data for package inclusion
scavenger_community <- raw_data %>%
  # Convert categorical variables to factors
  mutate(
    # Add your factor conversions here
    # column_name = as.factor(column_name)
  ) %>%
  # Convert dates if needed
  # mutate(date_column = as.Date(date_column, format = "%d/%m/%Y")) %>%
  # Arrange logically
  arrange()  # Add appropriate columns

# Verify the cleaned data
cat("\nCleaned data structure:\n")
str(scavenger_community)

# Check for any missing values or issues
cat("\nMissing values per column:\n")
sapply(scavenger_community, function(x) sum(is.na(x)))

# Save to package data (compressed .rda format for CRAN)
usethis::use_data(scavenger_community, overwrite = TRUE)

cat("\n✅ Dataset '", dataset_name, "' prepared and saved!\n")
cat("Size of final dataset:", object.size(scavenger_community), "bytes\n")

