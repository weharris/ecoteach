# Data preparation for Reproductive performance of a tropical apex predator in an unpredictable habitat
# Source: Kalberer, Stephanie et al. (2018) - Dryad repository  
# DOI: 10.5061/DRYAD.6S48579
# License: CC0 1.0 Universal
# Prepared: 2023-06-24

library(readr)
library(dplyr)
library(usethis)

# Read the raw data
raw_data <- read_csv("data-raw/raw_data/Kalberer_etal_2018_lion_reproduction.csv")

# Examine the data structure
cat("Original data structure:\n")
str(raw_data)
cat("\nFirst few rows:\n")
head(raw_data)
cat("\nUnique values in key columns:\n")
cat("OffspringSex unique values:", paste(unique(raw_data$OffspringSex), collapse = ", "), "\n")
cat("exact unique values:", paste(unique(raw_data$exact), collapse = ", "), "\n")

# Clean and prepare the data for package inclusion
lion_reproduction <- raw_data %>%
  # Convert categorical variables to factors
  mutate(
    # Convert sex to factor with meaningful levels (1=Male, 2=Female)
    OffspringSex = factor(OffspringSex, levels = c(1, 2), labels = c("Male", "Female")),
    
    # Convert exact to factor with meaningful levels (0=No, 1=Yes, 2=Unknown)
    exact = factor(exact, levels = c(0, 1, 2), labels = c("No", "Yes", "Unknown")),
    
    # Convert dates to proper Date objects
    MotherBD = as.Date(MotherBD, format = "%d.%m.%Y"),
    FirstPupBorn = as.Date(FirstPupBorn, format = "%d.%m.%Y")
  ) %>%
  # Arrange by mother ID
  arrange(MotherID)

# Verify the cleaned data
cat("\nCleaned data structure:\n")
str(lion_reproduction)

# Check for any missing values or issues
cat("\nMissing values per column:\n")
sapply(lion_reproduction, function(x) sum(is.na(x)))

# Save to package data (compressed .rda format for CRAN)
usethis::use_data(lion_reproduction, overwrite = TRUE)

cat("\n✅ Dataset 'lion_reproduction' prepared and saved!\n")
cat("Size of final dataset:", object.size(lion_reproduction), "bytes\n") 