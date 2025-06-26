
# Data preparation for Data from: Red
# Source: [AUTHOR] et al. (2024) - Dryad repository  
# DOI: https://doi.org/10.5061/dryad.cjsxksngd
# License: CC0 1.0 Universal
# Prepared: 2025-06-26

library(readr)
library(dplyr)
library(usethis)

# Read the raw data
raw_data <- read_csv("data-raw/raw_data/Damber_2024_redpanda_moves.csv")

# Examine the data structure
cat("Original data structure:\n")
str(raw_data)
cat("\nFirst few rows:\n")
head(raw_data)
cat("\nUnique values in key columns:\n")
# Add specific columns to check:
# sapply(raw_data[c("column1", "column2")], function(x) unique(x))

# Clean and prepare the data for package inclusion
redpanda_moves <- raw_data %>%
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
str(redpanda_moves)

# Check for any missing values or issues
cat("\nMissing values per column:\n")
sapply(redpanda_moves, function(x) sum(is.na(x)))

# Save to package data (compressed .rda format for CRAN)
usethis::use_data(redpanda_moves, overwrite = TRUE)

cat("\n✅ Dataset '", dataset_name, "' prepared and saved!\n")
cat("Size of final dataset:", object.size(redpanda_moves), "bytes\n")

