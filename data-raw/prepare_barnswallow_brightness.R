# Data preparation for North American barn swallows pair, mate, and interact assortatively
# Source: Morosse, Omar et al. (2025) - Dryad repository  
# DOI: 10.5061/DRYAD.1G1JWSV8G
# License: CC0 1.0 Universal
# Prepared: 2023-06-24

library(readr)
library(dplyr)
library(usethis)

# Read the raw data
raw_data <- read_csv("data-raw/raw_data/Morosse_etal_2025_barnswallow_brightness.csv")

# Examine the data structure
cat("Original data structure:\n")
str(raw_data)
cat("\nFirst few rows:\n")
head(raw_data)
cat("\nUnique values in key columns:\n")
# Add specific columns to check:
# sapply(raw_data[c("column1", "column2")], function(x) unique(x))

# Clean and prepare the data for package inclusion
barnswallow_brightness <- raw_data %>%
  # No categorical variables to convert to factors
  # No date conversions needed
  # Arrange by MaleID
  arrange(MaleID)

# Verify the cleaned data
cat("\nCleaned data structure:\n")
str(barnswallow_brightness)

# Check for any missing values or issues
cat("\nMissing values per column:\n")
sapply(barnswallow_brightness, function(x) sum(is.na(x)))

# Save to package data (compressed .rda format for CRAN)
usethis::use_data(barnswallow_brightness, overwrite = TRUE)

cat("\n✅ Dataset 'barnswallow_brightness' prepared and saved!\n")
cat("Size of final dataset:", object.size(barnswallow_brightness), "bytes\n")

