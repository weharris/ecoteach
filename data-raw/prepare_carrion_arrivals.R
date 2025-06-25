# Data preparation for Data for: Use of viscera from hunted roe deer by vertebrate scavengers
# Source: Schwegmann, Sebastian (2023) - Dryad repository  
# DOI: 10.5061/DRYAD.Q573N5TPP
# License: CC0 1.0 Universal
# Prepared: 2025-06-25

library(readr)
library(dplyr)
library(usethis)
library(lubridate)

# Read the raw data
raw_data <- read_csv("data-raw/raw_data/Schwegmann_2023_carrion_arrivals.csv")

# Examine the data structure
cat("Original data structure:\n")
str(raw_data)
cat("\nFirst few rows:\n")
head(raw_data)
cat("\nUnique values in key columns:\n")
sapply(raw_data[c("Species", "Behaviour")], function(x) unique(x))

# Clean and prepare the data for package inclusion
carrion_arrivals <- raw_data %>%
  # Convert categorical variables to factors
  mutate(
    # Convert Species and Behaviour to factors
    Species = factor(Species),
    Behaviour = factor(Behaviour),
    Samples = factor(Samples)
  ) %>%
  # Convert dates to proper Date format
  mutate(
    `Dates Setup` = dmy(`Dates Setup`),
    `Date Event` = dmy(`Date Event`)
  ) %>%
  # Convert time to proper format
  mutate(
    Time = hms::as_hms(Time)
  ) %>%
  # Arrange logically by sample, date, and time
  arrange(Samples, `Date Event`, Time)

# Verify the cleaned data
cat("\nCleaned data structure:\n")
str(carrion_arrivals)

# Check for any missing values or issues
cat("\nMissing values per column:\n")
sapply(carrion_arrivals, function(x) sum(is.na(x)))

# Save to package data (compressed .rda format for CRAN)
usethis::use_data(carrion_arrivals, overwrite = TRUE)

cat("\n✅ Dataset 'carrion_arrivals' prepared and saved!\n")
cat("Size of final dataset:", object.size(carrion_arrivals), "bytes\n")

