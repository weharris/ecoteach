# Data preparation for Dormouse Hibernation Dataset
# Source: Bieber et al. (2019) - Dryad repository  
# DOI: 10.5061/DRYAD.8004G37
# License: CC0 1.0 Universal
# Prepared: 2025-06-25

library(readr)
library(dplyr)
library(usethis)

# Read the raw data
raw_data <- read_csv("data-raw/raw_data/Bieber_etal_2019_dormouse_hibernation.csv")

# Examine the data structure
cat("Original data structure:\n")
str(raw_data)
cat("\nFirst few rows:\n")
head(raw_data)
cat("\nUnique values in key columns:\n")
sapply(raw_data[c("sex", "diet", "repro_active")], function(x) unique(x))

# Clean and prepare the data for package inclusion
dormouse_hibernation <- raw_data %>%
  # Fix column names - rename problematic columns
  rename(
    animal_id = `a name`,
    hibernation_duration = `hibdur days`,
    hibernation_start = hibstart,
    hibernation_end = hibend,
    hibernation_end_year_before = hibendyearbefore,
    body_mass_before = bm_before,
    body_mass_after = bm_after,
    body_mass_spring = bmspring,
    age_death = `age death`
  ) %>%
  # Convert categorical variables to factors
  mutate(
    sex = factor(sex, levels = c("m", "f"), labels = c("male", "female")),
    diet = factor(diet, levels = c("medium", "high fat", "protein")),
    repro_active = factor(repro_active, levels = c("yes", "no")),
    # Convert dates to proper format if needed - these appear to be in DD.MM.YY format
    # For now, keeping as character strings since they're inconsistently formatted
    # Arrange by animal ID and year
    year = as.integer(year)
  ) %>%
  arrange(animal_id, year)

# Verify the cleaned data
cat("\nCleaned data structure:\n")
str(dormouse_hibernation)

# Check for any missing values or issues
cat("\nMissing values per column:\n")
sapply(dormouse_hibernation, function(x) sum(is.na(x)))

# Save to package data (compressed .rda format for CRAN)
usethis::use_data(dormouse_hibernation, overwrite = TRUE)

cat("\n✅ Dataset 'dormouse_hibernation' prepared and saved!\n")
cat("Size of final dataset:", object.size(dormouse_hibernation), "bytes\n")

