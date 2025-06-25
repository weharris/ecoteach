# Data preparation for Scavenger community structure along an environmental gradient from boreal forest to alpine tundra in Scandinavia
# Source: Gomo, Gjermund et al. (2020) - Dryad repository  
# DOI: 10.1002/ece3.6834
# License: CC0 1.0 Universal
# Prepared: 2025-06-25

library(readr)
library(dplyr)
library(usethis)

# Read the raw data
raw_data <- read_csv("data-raw/raw_data/Gomo_etal_2021_scavenger_community.csv")

# Examine the data structure
cat("Original data structure:\n")
str(raw_data)
cat("\nFirst few rows:\n")
head(raw_data)
cat("\nUnique values in key columns:\n")
sapply(raw_data[c("habitat", "species", "Behaviour")], function(x) unique(x))

# Clean and prepare the data for package inclusion
scavenger_community <- raw_data %>%
  # Convert categorical variables to factors
  mutate(
    # Site and sample identifiers
    id = factor(id),
    session = factor(session),
    
    # Species and behavior variables
    species = factor(species),
    Behaviour = factor(Behaviour),
    
    # Environmental variables
    habitat = factor(habitat, levels = c(0, 1), 
                    labels = c("Alpine tundra", "Boreal forest")),
    scover = factor(scover, levels = c(0, 1),
                   labels = c("No snow cover", "Snow cover"))
  ) %>%
  # Replace "#FELT!" with NA
  mutate(across(everything(), ~ifelse(. == "#FELT!", NA, .))) %>%
  # Convert numeric variables that were read as character due to "#FELT!"
  mutate(
    altitude = as.numeric(altitude),
    sdepth = as.numeric(sdepth),
    hosl = as.numeric(hosl),
    loghosl = as.numeric(loghosl),
    tamean = as.numeric(tamean),
    samean = as.numeric(samean)
  ) %>%
  # Arrange logically by site ID, year, and Julian day
  arrange(id, year, jd)

# Verify the cleaned data
cat("\nCleaned data structure:\n")
str(scavenger_community)

# Check for any missing values or issues
cat("\nMissing values per column:\n")
sapply(scavenger_community, function(x) sum(is.na(x)))

# Save to package data (compressed .rda format for CRAN)
usethis::use_data(scavenger_community, overwrite = TRUE)

cat("\n✅ Dataset 'scavenger_community' prepared and saved!\n")
cat("Size of final dataset:", object.size(scavenger_community), "bytes\n")

