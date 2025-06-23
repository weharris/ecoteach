# Data preparation for Magellanic Penguin Deployments
# Source: Rebstock et al. (2022) - Dryad repository
# DOI: 10.5061/DRYAD.8931ZCRSV
# License: CC0 1.0 Universal
# Prepared: 2025-06-23

library(readr)
library(dplyr)
library(usethis)

# Read the raw data
raw_data <- read_csv("data-raw/raw_data/Rebstock_MagPenguinDeployments.csv")

# Examine the data structure
cat("Original data structure:\n")
str(raw_data)
cat("\nFirst few rows:\n")
head(raw_data)
cat("\nSummary:\n")
summary(raw_data)

# Clean and prepare the data for package inclusion
magellanic_penguins <- raw_data %>%
  # Convert categorical variables to factors where appropriate
  mutate(
    InstrType = as.factor(InstrType),
    PenguinSex = case_when(
      PenguinSex == 0 ~ "Male",
      PenguinSex == 1 ~ "Female",
      TRUE ~ NA_character_
    ),
    PenguinSex = as.factor(PenguinSex)
  ) %>%
  # Arrange by season and penguin for logical ordering
  arrange(SeasonYear, PenguinID)

# Verify the cleaned data
cat("\nCleaned data structure:\n")
str(magellanic_penguins)
cat("\nFinal summary:\n")
summary(magellanic_penguins)

# Check for any missing values or issues
cat("\nMissing values per column:\n")
sapply(magellanic_penguins, function(x) sum(is.na(x)))

# Save to package data (compressed .rda format for CRAN)
usethis::use_data(magellanic_penguins, overwrite = TRUE)

cat("\n✅ Dataset 'magellanic_penguins' prepared and saved!\n")
cat("Size of final dataset:", object.size(magellanic_penguins), "bytes\n")
