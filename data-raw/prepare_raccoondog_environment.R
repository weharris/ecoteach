# Data preparation for Seasonal activity changes in raccoon dogs and environmental factors
# Source: Miyamoto et al. (2025) - Dryad repository  
# DOI: 10.5061/DRYAD.C866T1GJN
# License: CC0 1.0 Universal
# Prepared: 2025-06-25

library(readr)
library(dplyr)
library(usethis)

# Read the raw data
raw_data <- read_csv("data-raw/raw_data/Miyamoto_2025_raccoondog_environment.csv")

# Examine the data structure
cat("Original data structure:\n")
str(raw_data)
cat("\nFirst few rows:\n")
head(raw_data)
cat("\nUnique values in key columns:\n")
sapply(raw_data[c("Season", "Vegetation")], function(x) unique(x))

# Clean and prepare the data for package inclusion
raccoondog_environment <- raw_data %>%
  # Convert categorical variables to factors
  mutate(
    Pt = as.factor(Pt),
    Season = factor(Season, levels = c("Autumn", "Winter")),
    Vegetation = factor(Vegetation, levels = unique(Vegetation)),
    # Convert Day to numeric if it's not already
    Day = as.numeric(Day)
  ) %>%
  # Rename columns for clarity
  rename(
    point_id = Pt,
    asian_badger = `Asian badger`,
    wild_boar = Boar,
    hog_badger = `Hog badger`,
    leopard_cat = `Leopard cat`,
    masked_palm_civet = `Masked palm civet`,
    rock_squirrel = `Pere David's rock squirrel`,
    raccoon_dog = `Raccoon dog`,
    red_squirrel = `Red squirrel`,
    roe_deer = `Siberian roe deer`,
    siberian_weasel = `Siberian weasel`,
    striped_squirrel = `Swinhoe's striped squirrel`,
    tolai_hare = `Tolai hare`,
    dist_impervious = `Impervious areas`,
    dist_agricultural = `Agricultural land`,
    dist_water = `Water sources`,
    dist_roads = Roads,
    tpi = TPI
  ) %>%
  # Arrange logically by point_id and season
  arrange(point_id, Season)

# Verify the cleaned data
cat("\nCleaned data structure:\n")
str(raccoondog_environment)

# Check for any missing values or issues
cat("\nMissing values per column:\n")
sapply(raccoondog_environment, function(x) sum(is.na(x)))

# Save to package data (compressed .rda format for CRAN)
usethis::use_data(raccoondog_environment, overwrite = TRUE)

cat("\n✅ Dataset 'raccoondog_environment' prepared and saved!\n")
cat("Size of final dataset:", object.size(raccoondog_environment), "bytes\n")

