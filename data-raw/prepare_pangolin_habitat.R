# Data preparation for Habitat occupancy of the critically endangered Chinese pangolin
# Source: Subba, Asmit and Tamang, Ganesh and Lama, Sony and Basnet, Nabin and Kyes, Randall C. and Khanal, Laxman (2024) - Dryad repository  
# DOI: 10.5061/DRYAD.73N5TB34T
# License: CC0 1.0 Universal
# Prepared: 2023-06-24

library(readr)
library(dplyr)
library(usethis)

# Read the raw data
raw_data <- read_csv("data-raw/raw_data/Subba_etal_2024_pangolin_habitat.csv")

# Examine the data structure
cat("Original data structure:\n")
str(raw_data)
cat("\nFirst few rows:\n")
head(raw_data)
cat("\nUnique values in key columns:\n")
cat("Habitat type unique values:", paste(unique(raw_data$`Habitat type`), collapse = ", "), "\n")
cat("Habitat structure unique values:", paste(unique(raw_data$`Habitat structure`), collapse = ", "), "\n")
cat("Human Disturbance Index range:", min(raw_data$`Human Disturbance Index`), "-", max(raw_data$`Human Disturbance Index`), "\n")
cat("Termite mounds range:", min(raw_data$`Termite mounds`), "-", max(raw_data$`Termite mounds`), "\n")

# Clean and prepare the data for package inclusion
pangolin_habitat <- raw_data %>%
  # Rename columns to remove spaces and make them more R-friendly
  rename(
    object_id = `OBJECT ID`,
    replicate_1 = `Replicate 1`,
    replicate_2 = `Replicate 2`,
    replicate_3 = `Replicate 3`,
    replicate_4 = `Replicate 4`,
    replicate_5 = `Replicate 5`,
    replicate_6 = `Replicate 6`,
    distance_to_water = `Distance to water body`,
    terrain_ruggedness = `Terrain Ruggedness Index`,
    mean_ndvi = Mean_NDVI,
    habitat_type = `Habitat type`,
    habitat_structure = `Habitat structure`,
    human_disturbance_index = `Human Disturbance Index`,
    termite_mounds = `Termite mounds`
  ) %>%
  # Create a detection history column
  mutate(
    detection_sum = replicate_1 + replicate_2 + replicate_3 + 
                    replicate_4 + replicate_5 + replicate_6,
    detected = ifelse(detection_sum > 0, 1, 0)
  ) %>%
  # Convert categorical variables to factors with meaningful labels
  mutate(
    habitat_type = factor(habitat_type, 
                         levels = c("SF", "MF", "HS", "AG"),
                         labels = c("Sal Forest", "Mixed Forest", "Human Settlement", "Agricultural Land")),
    habitat_structure = factor(habitat_structure,
                              levels = c("T", "C"),
                              labels = c("Terrace", "Cliff")),
    # Create disturbance level category
    disturbance_level = cut(human_disturbance_index, 
                           breaks = c(-0.01, 0.25, 0.5, 0.75, 1.01),
                           labels = c("Low", "Medium-Low", "Medium-High", "High"))
  ) %>%
  # Arrange logically by object_id
  arrange(object_id)

# Verify the cleaned data
cat("\nCleaned data structure:\n")
str(pangolin_habitat)

# Check for any missing values or issues
cat("\nMissing values per column:\n")
sapply(pangolin_habitat, function(x) sum(is.na(x)))

# Check detection statistics
cat("\nDetection statistics:\n")
cat("Number of sites with pangolin detected:", sum(pangolin_habitat$detected), "\n")
cat("Percentage of sites with pangolin detected:", round(100 * sum(pangolin_habitat$detected) / nrow(pangolin_habitat), 2), "%\n")

# Save to package data (compressed .rda format for CRAN)
usethis::use_data(pangolin_habitat, overwrite = TRUE)

cat("\n✅ Dataset 'pangolin_habitat' prepared and saved!\n")
cat("Size of final dataset:", object.size(pangolin_habitat), "bytes\n")

