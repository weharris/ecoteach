# Data preparation for European badger energy expenditure and tuberculosis infection data
# Source: Barbour et al. (2019) - Dryad repository  
# DOI: 10.5061/DRYAD.MN84H20
# License: CC0 1.0 Universal
# Prepared: 2025-06-25

library(readr)
library(dplyr)
library(usethis)

# Read the raw data
raw_data <- read_csv("data-raw/raw_data/Barbour_etal_2019_badger_energy.csv")

# Examine the data structure
cat("Original data structure:\n")
str(raw_data)
cat("\nFirst few rows:\n")
head(raw_data)
cat("\nUnique values in key columns:\n")
sapply(raw_data[c("age", "sex", "season", "disease")], function(x) unique(x))

# Clean and prepare the data for package inclusion
badger_energy <- raw_data %>%
  # Remove empty columns
  select(-matches("^$")) %>%
  # Clean whitespace in character columns
  mutate(sex = trimws(sex)) %>%
  # Convert categorical variables to factors
  mutate(
    ID = as.factor(ID),
    age = factor(age, levels = c("cub", "adult")),
    sex = factor(sex, levels = c("F", "M")),
    season = factor(season, levels = c("Winter", "Spring", "Summer", "Autumn")),
    disease = factor(disease, levels = c("N", "D", "E"),
                    labels = c("Negative", "Diseased", "Exposed"))
  ) %>%
  # Rename columns for clarity
  rename(
    group_size = `group size`,
    body_mass = mass,
    daily_energy = DEE
  ) %>%
  # Arrange logically by ID and season
  arrange(ID, season)

# Verify the cleaned data
cat("\nCleaned data structure:\n")
str(badger_energy)

# Check for any missing values or issues
cat("\nMissing values per column:\n")
sapply(badger_energy, function(x) sum(is.na(x)))

# Save to package data (compressed .rda format for CRAN)
usethis::use_data(badger_energy, overwrite = TRUE)

cat("\n✅ Dataset 'badger_energy' prepared and saved!\n")
cat("Size of final dataset:", object.size(badger_energy), "bytes\n")

