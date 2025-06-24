
# Data preparation for The evolution of hearing and brain size in Eocene
# Source: [AUTHOR] et al. (2025) - Dryad repository  
# DOI: 10.5061/DRYAD.SF7M0CGH1
# License: CC0 1.0 Universal
# Prepared: 2025-06-24

library(readr)
library(dplyr)
library(usethis)

# Read the raw data
raw_data <- read_csv("data-raw/raw_data/Peacock_etal_2025_whale_brains.csv")

# Examine the data structure
cat("Original data structure:\n")
str(raw_data)
cat("\nFirst few rows:\n")
head(raw_data)
cat("\nUnique values in key columns:\n")
# Add specific columns to check:
# sapply(raw_data[c("column1", "column2")], function(x) unique(x))

# Clean and prepare the data for package inclusion
whale_brains <- raw_data %>%
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
str(whale_brains)

# Check for any missing values or issues
cat("\nMissing values per column:\n")
sapply(whale_brains, function(x) sum(is.na(x)))

# Save to package data (compressed .rda format for CRAN)
usethis::use_data(whale_brains, overwrite = TRUE)

cat("\n✅ Dataset '", dataset_name, "' prepared and saved!\n")
cat("Size of final dataset:", object.size(whale_brains), "bytes\n")

