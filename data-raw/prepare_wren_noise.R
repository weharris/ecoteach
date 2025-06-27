# Data preparation for Anthropogenic noise, song, and territorial aggression in southern house wrens
# Source: Diniz, Pedro and Duca, Charles (2022) - Dryad repository  
# DOI: 10.5061/DRYAD.TTDZ08M00
# License: CC0 1.0 Universal
# Prepared: 2024-07-09

library(readr)
library(dplyr)
library(usethis)

# Read the raw data
raw_data <- read_csv("data-raw/raw_data/Diniz_Duco_2022_wren_noise.csv")

# Examine the data structure
cat("Original data structure:\n")
str(raw_data)
cat("\nFirst few rows:\n")
head(raw_data)

# Clean and prepare the data for package inclusion
wren_noise <- raw_data %>%
  # Convert categorical variables to factors
  mutate(
    PlaybackStage = factor(PlaybackStage, levels = c("Playback", "Post-playback")),
    Habitat = factor(Habitat, levels = c("Rural", "Urban")),
    Site = factor(Site),
    MaleID = factor(MaleID),
    StimulusID = factor(StimulusID)
  ) %>%
  # Convert date to proper date format
  mutate(
    Date = as.Date(Date, format = "%d/%m/%Y")
  ) %>%
  # Arrange logically
  arrange(Habitat, Site, MaleID, PlaybackStage)

# Verify the cleaned data
cat("\nCleaned data structure:\n")
str(wren_noise)

# Check for any missing values or issues
cat("\nMissing values per column:\n")
sapply(wren_noise, function(x) sum(is.na(x)))

# Save to package data (compressed .rda format for CRAN)
usethis::use_data(wren_noise, overwrite = TRUE)

cat("\n✅ Dataset 'wren_noise' prepared and saved!\n")
cat("Size of final dataset:", object.size(wren_noise), "bytes\n") 