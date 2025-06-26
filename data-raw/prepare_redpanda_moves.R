# Data preparation for Red pandas on the move: weather and disturbance effects on habitat specialists
# Source: Damber, Bista (2024) - Dryad repository  
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
sapply(raw_data[c("Sex", "Age", "Precipitation", "Snow_cover", "Snow_age")], function(x) unique(x))

# Clean and prepare the data for package inclusion
redpanda_moves <- raw_data %>%
  # Convert categorical variables to factors
  mutate(
    Animal_Id = as.factor(Animal_Id),
    Sex = as.factor(Sex),
    Age = as.factor(Age),
    Precipitation = as.factor(Precipitation),
    Snow_cover = as.factor(Snow_cover),
    Snow_age = as.factor(Snow_age)
  ) %>%
  # Arrange logically
  arrange(Animal_Id, Sex, Age)

# Verify the cleaned data
cat("\nCleaned data structure:\n")
str(redpanda_moves)

# Check for any missing values or issues
cat("\nMissing values per column:\n")
sapply(redpanda_moves, function(x) sum(is.na(x)))

# Save to package data (compressed .rda format for CRAN)
usethis::use_data(redpanda_moves, overwrite = TRUE)

cat("\n✅ Dataset 'redpanda_moves' prepared and saved!\n")
cat("Size of final dataset:", object.size(redpanda_moves), "bytes\n")

