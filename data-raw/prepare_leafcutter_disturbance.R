# Data preparation for Human disturbance promotes herbivory by leaf-cutting ants in the Caatinga dry forest
# Source: Siqueira, Felipe F. S. et al. (2018) - Dryad repository  
# DOI: 10.5061/DRYAD.KP59G3P
# License: CC0 1.0 Universal
# Prepared: 2024-07-09

library(readr)
library(dplyr)
library(usethis)

# Read the raw data
raw_data <- read_csv("data-raw/raw_data/Siqueira_etal_2018_leafcutter_disturbance.csv")

# Examine the data structure
cat("Original data structure:\n")
str(raw_data)
cat("\nFirst few rows:\n")
head(raw_data)

# Clean and prepare the data for package inclusion
leafcutter_disturbance <- raw_data %>%
  # Convert to long format for easier analysis
  tidyr::pivot_longer(
    cols = c(Dry_pct_herbivory, Wet_pct_herbivory),
    names_to = "season",
    values_to = "herbivory_percent"
  ) %>%
  # Clean up season names
  mutate(
    season = factor(
      ifelse(season == "Dry_pct_herbivory", "Dry", "Wet"),
      levels = c("Dry", "Wet")
    )
  ) %>%
  # Arrange logically
  arrange(Colony, season)

# Verify the cleaned data
cat("\nCleaned data structure:\n")
str(leafcutter_disturbance)

# Check for any missing values or issues
cat("\nMissing values per column:\n")
sapply(leafcutter_disturbance, function(x) sum(is.na(x)))

# Save to package data (compressed .rda format for CRAN)
usethis::use_data(leafcutter_disturbance, overwrite = TRUE)

cat("\n✅ Dataset 'leafcutter_disturbance' prepared and saved!\n")
cat("Size of final dataset:", object.size(leafcutter_disturbance), "bytes\n") 