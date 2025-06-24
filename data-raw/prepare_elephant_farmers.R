# Data preparation for Elephant agricultural use metrics in Mara-Serengeti ecosystem
# Source: Hahn, Nathan (2021) - Dryad repository  
# DOI: 10.5061/DRYAD.RN8PK0PBN
# License: CC0 1.0 Universal
# Prepared: 2023-06-24

library(readr)
library(dplyr)
library(usethis)

# Read the raw data
raw_data <- read_csv("data-raw/raw_data/Hahn_2021_elephant_farmers.csv")

# Examine the data structure
cat("Original data structure:\n")
str(raw_data)
cat("\nFirst few rows:\n")
head(raw_data)
cat("\nUnique values in key columns:\n")
cat("tactic.aggregate unique values:", paste(unique(raw_data$tactic.aggregate), collapse = ", "), "\n")
cat("tactic.season unique values:", paste(unique(raw_data$tactic.season), collapse = ", "), "\n")
cat("subject_sex unique values:", paste(unique(raw_data$subject_sex), collapse = ", "), "\n")
cat("subject_ageClass unique values:", paste(unique(raw_data$subject_ageClass), collapse = ", "), "\n")
cat("tactic.change unique values:", paste(unique(raw_data$tactic.change), collapse = ", "), "\n")

# Clean and prepare the data for package inclusion
elephant_farmers <- raw_data %>%
  # Convert categorical variables to factors
  mutate(
    # Individual ID
    subject_name = factor(subject_name),
    
    # Tactic classifications (1=Rare, 2=Sporadic, 3=Seasonal, 4=Habitual)
    tactic.aggregate = factor(tactic.aggregate, 
                              levels = c(1, 2, 3, 4),
                              labels = c("Rare", "Sporadic", "Seasonal", "Habitual")),
    
    tactic.season = factor(tactic.season, 
                           levels = c(1, 2, 3, 4),
                           labels = c("Rare", "Sporadic", "Seasonal", "Habitual")),
    
    tactic.prev = factor(tactic.prev, 
                         levels = c(1, 2, 3, 4),
                         labels = c("Rare", "Sporadic", "Seasonal", "Habitual")),
    
    # Sex and age class
    subject_sex = factor(subject_sex),
    subject_ageClass = factor(subject_ageClass),
    
    # Tactic change (0=no change, 1=changed)
    tactic.change = factor(tactic.change, 
                           levels = c(0, 1),
                           labels = c("No change", "Changed")),
    
    # Convert date strings to Date objects
    year.begin = as.Date(year.begin),
    year.end = as.Date(year.end)
  ) %>%
  # Arrange by subject name and season year
  arrange(subject_name, season.year)

# Verify the cleaned data
cat("\nCleaned data structure:\n")
str(elephant_farmers)

# Check for any missing values or issues
cat("\nMissing values per column:\n")
sapply(elephant_farmers, function(x) sum(is.na(x)))

# Save to package data (compressed .rda format for CRAN)
usethis::use_data(elephant_farmers, overwrite = TRUE)

cat("\n✅ Dataset 'elephant_farmers' prepared and saved!\n")
cat("Size of final dataset:", object.size(elephant_farmers), "bytes\n")

