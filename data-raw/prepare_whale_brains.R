# Data preparation for The evolution of hearing and brain size in Eocene whales
# Source: Peacock, John and Waugh, David and Bajpai, Sunil and Thewissen, JGM (2025) - Dryad repository  
# DOI: 10.5061/DRYAD.SF7M0CGH1
# License: CC0 1.0 Universal
# Prepared: 2023-06-24

library(readr)
library(dplyr)
library(usethis)

# Read the raw data
raw_data <- read_csv("data-raw/raw_data/Peacock_etal_2025_whale_brains.csv")

# Examine the data structure
cat("Original data structure:\n")
str(raw_data)
cat("\nFirst few rows:\n")
head(raw_data)
cat("\nUnique values in key columns:\n")
cat("Number of families:", length(unique(raw_data$family)), "\n")
cat("Number of species:", length(unique(raw_data$binomial_name)), "\n")
cat("NA values in endocranial_volume:", sum(is.na(raw_data$endocranial_volume)), "\n")
cat("NA values in brain_mass:", sum(is.na(raw_data$brain_mass)), "\n")
cat("NA values in ocw_mm:", sum(is.na(raw_data$ocw_mm)), "\n")
cat("NA values in body_mass:", sum(is.na(raw_data$body_mass)), "\n")

# Extract family names to check for whale families
whale_families <- c("Aetiocetidae", "Agorophiidae", "Ambulocetidae", "Basilosauridae", 
                    "Balaenidae", "Balaenopteridae", "Delphinidae", "Eschrictiidae", 
                    "Eosqualodontidae", "Eurhinodelphidae", "Iniidae", "Kogiidae", 
                    "Monodontidae", "Phocoenidae", "Ziphiidae", "Cetotheriidae")

# Clean and prepare the data for package inclusion
whale_brains <- raw_data %>%
  # Convert categorical variables to factors
  mutate(
    # Create a taxonomic group column
    taxonomic_group = case_when(
      family %in% whale_families ~ "Cetacean",
      family %in% c("Hippopotamidae") ~ "Hippopotamid",
      TRUE ~ "Other Mammal"
    ),
    
    # Convert to factors
    taxonomic_group = factor(taxonomic_group, 
                             levels = c("Cetacean", "Hippopotamid", "Other Mammal")),
    family = factor(family),
    binomial_name = factor(binomial_name),
    common_name = factor(common_name),
    
    # Create a time period column (extant vs fossil)
    time_period = case_when(
      is.na(common_name) ~ "Fossil",
      TRUE ~ "Extant"
    ),
    time_period = factor(time_period, levels = c("Extant", "Fossil"))
  ) %>%
  # Arrange by taxonomic group and family
  arrange(taxonomic_group, family, binomial_name)

# Verify the cleaned data
cat("\nCleaned data structure:\n")
str(whale_brains)

# Check for any missing values or issues
cat("\nMissing values per column:\n")
sapply(whale_brains, function(x) sum(is.na(x)))

# Save to package data (compressed .rda format for CRAN)
usethis::use_data(whale_brains, overwrite = TRUE)

cat("\n✅ Dataset 'whale_brains' prepared and saved!\n")
cat("Size of final dataset:", object.size(whale_brains), "bytes\n")

