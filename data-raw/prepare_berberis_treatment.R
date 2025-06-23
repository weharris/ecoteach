# Data preparation for Berberis aquifolium Management Treatment Dataset
# Source: Adriaens et al. (2019) - Dryad repository
# DOI: 10.5061/DRYAD.ZKH189361
# License: CC0 1.0 Universal
# Prepared: [TODAY'S DATE]

library(readr)
library(dplyr)
library(usethis)

# Read the raw data
raw_data <- read_csv("data-raw/raw_data/Adriaens_etal_Neobiota_data.csv")

# Examine the data structure
cat("Original data structure:\n")
str(raw_data)
cat("\nFirst few rows:\n")
head(raw_data)
cat("\nSummary:\n")
summary(raw_data)

# Clean and prepare the data for package inclusion
berberis_treatment <- raw_data %>%
  # Convert categorical variables to factors
  mutate(
    region = as.factor(region),
    treatment = factor(treatment, 
                       levels = c("Dig", "Leaf", "Stub", "Salt"),
                       labels = c("Manual digging", "Leaf spray (glyphosate)", 
                                  "Stem cut + glyphosate", "Stem cut + salt")),
    regrowth = factor(regrowth, 
                      levels = c("Dead", "Limited", "Vital"),
                      ordered = TRUE),
    # Convert dates to proper date format
    date = as.Date(date, format = "%d/%m/%Y"),
    date_regrowth = as.Date(date_regrowth, format = "%d/%m/%Y")
  ) %>%
  # Add derived variables for analysis
  mutate(
    # Calculate time between treatment and assessment
    days_to_assessment = as.numeric(date_regrowth - date),
    # Create binary success variable (Dead = successful treatment)
    treatment_success = ifelse(regrowth == "Dead", "Success", "Failure"),
    treatment_success = as.factor(treatment_success),
    # Calculate clone volume approximation (assuming cylindrical)
    volume_approx = pi * (diameter/2)^2 * height
  ) %>%
  # Arrange logically
  arrange(region, treatment, plant_id)

# Verify the cleaned data
cat("\nCleaned data structure:\n")
str(berberis_treatment)
cat("\nTreatment summary:\n")
table(berberis_treatment$treatment)
cat("\nRegrowth summary:\n")
table(berberis_treatment$regrowth)
cat("\nTreatment success by method:\n")
table(berberis_treatment$treatment, berberis_treatment$treatment_success)

# Check for any missing values or issues
cat("\nMissing values per column:\n")
sapply(berberis_treatment, function(x) sum(is.na(x)))

# Save to package data (compressed .rda format for CRAN)
usethis::use_data(berberis_treatment, overwrite = TRUE)

cat("\n✅ Dataset 'berberis_treatment' prepared and saved!\n")
cat("Size of final dataset:", object.size(berberis_treatment), "bytes\n")