# Data preparation for Listening and watching: do camera traps or acoustic sensors more efficiently detect wild chimpanzees in an open habitat?
# Source: Crunchant, Anne-Sophie et al. (2020) - Dryad repository  
# DOI: 10.5061/DRYAD.5DV41NS34
# License: CC0 1.0 Universal
# Prepared: 2023-06-23

library(readr)
library(dplyr)
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
camera_info <- raw_data[, c("Camera", "Latitude", "Longitude", "Method", "Vegetation", "Topography")]

# Now reshape the data from wide to long format using base R
# Get date columns (all columns except the first 6)
date_cols <- names(raw_data)[7:ncol(raw_data)]

# Create empty data frame to store results
camera_detections <- data.frame()

# Loop through each camera
for(i in 1:nrow(raw_data)) {
  camera_row <- raw_data[i, ]
  camera_id <- camera_row$Camera
  
  # For each date column, create a row
  for(date_col in date_cols) {
    detection_value <- camera_row[[date_col]]
    
    # Create a new row
    new_row <- data.frame(
      Camera = camera_id,
      Latitude = camera_row$Latitude,
      Longitude = camera_row$Longitude,
      Method = camera_row$Method,
      Vegetation = camera_row$Vegetation,
      Topography = camera_row$Topography,
      date = as.Date(date_col, format = "%d/%m/%Y"),
      detection = detection_value,
      stringsAsFactors = FALSE
    )
    
    # Add to the result data frame
    camera_detections <- rbind(camera_detections, new_row)
  }
}

# Sort by camera and date
camera_detections <- camera_detections[order(camera_detections$Camera, camera_detections$date), ]

# Clean and prepare the data for package inclusion
chimpanzee_cameras <- camera_detections

# Convert categorical variables to factors
chimpanzee_cameras$Camera <- as.factor(chimpanzee_cameras$Camera)
chimpanzee_cameras$Method <- as.factor(chimpanzee_cameras$Method)
chimpanzee_cameras$Vegetation <- as.factor(chimpanzee_cameras$Vegetation)
chimpanzee_cameras$Topography <- as.factor(chimpanzee_cameras$Topography)

# Convert detection to a factor with meaningful levels
# First convert NA values to NA explicitly to avoid factor conversion issues
chimpanzee_cameras$detection_status <- NA  # Create a new column
chimpanzee_cameras$detection_status[chimpanzee_cameras$detection == 0] <- "absent"
chimpanzee_cameras$detection_status[chimpanzee_cameras$detection == 1] <- "present"
chimpanzee_cameras$detection_status <- as.factor(chimpanzee_cameras$detection_status)

# Drop the original detection column
chimpanzee_cameras$detection <- NULL

# Rename the new column back to detection
names(chimpanzee_cameras)[names(chimpanzee_cameras) == "detection_status"] <- "detection"

# Verify the cleaned data
cat("\nCleaned data structure:\n")
str(chimpanzee_cameras)

# Check for any missing values or issues
cat("\nMissing values per column:\n")
print(sapply(chimpanzee_cameras, function(x) sum(is.na(x))))

# Save to package data (compressed .rda format for CRAN)
usethis::use_data(chimpanzee_cameras, overwrite = TRUE)

cat("\n✅ Dataset 'chimpanzee_cameras' prepared and saved!\n")
cat("Size of final dataset:", object.size(chimpanzee_cameras), "bytes\n") 