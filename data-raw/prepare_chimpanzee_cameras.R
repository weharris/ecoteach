# Data preparation for Listening and watching: do camera traps or acoustic sensors more efficiently detect wild chimpanzees in an open habitat?
# Source: Crunchant, Anne-Sophie et al. (2020) - Dryad repository  
# DOI: 10.5061/DRYAD.5DV41NS34
# License: CC0 1.0 Universal
# Prepared: 2023-06-23

library(readr)
library(dplyr)
library(tidyr)
library(usethis)

# Read the raw data
raw_data <- read_csv("data-raw/raw_data/crunchant_etal_2020_chimpanzee_cameras.csv")

# Examine the data structure
cat("Original data structure:\n")
str(raw_data)
cat("\nFirst few rows:\n")
head(raw_data)

# The dataset has camera locations as rows and dates as columns
# We need to reshape it to a more tidy format

# First, let's get the basic camera information
camera_info <- raw_data %>%
  select(Camera, Latitude, Longitude, Method, Vegetation, Topography)

# Now reshape the data from wide to long format
camera_detections <- raw_data %>%
  # Convert to long format
  pivot_longer(
    cols = -c(Camera, Latitude, Longitude, Method, Vegetation, Topography),
    names_to = "date",
    values_to = "detection"
  ) %>%
  # Convert date strings to actual Date objects
  mutate(
    date = as.Date(date, format = "%d/%m/%Y")
  ) %>%
  # Sort by camera and date
  arrange(Camera, date)

# Clean and prepare the data for package inclusion
chimpanzee_cameras <- camera_detections %>%
  # Convert categorical variables to factors
  mutate(
    Camera = as.factor(Camera),
    Method = as.factor(Method),
    Vegetation = as.factor(Vegetation),
    Topography = as.factor(Topography),
    # Convert detection to a factor with meaningful levels
    detection = factor(detection, 
                       levels = c(0, 1, NA), 
                       labels = c("absent", "present", NA))
  )

# Verify the cleaned data
cat("\nCleaned data structure:\n")
str(chimpanzee_cameras)

# Check for any missing values or issues
cat("\nMissing values per column:\n")
sapply(chimpanzee_cameras, function(x) sum(is.na(x)))

# Save to package data (compressed .rda format for CRAN)
usethis::use_data(chimpanzee_cameras, overwrite = TRUE)

cat("\n✅ Dataset 'chimpanzee_cameras' prepared and saved!\n")
cat("Size of final dataset:", object.size(chimpanzee_cameras), "bytes\n") 