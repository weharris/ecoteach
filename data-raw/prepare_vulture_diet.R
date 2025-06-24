# Data preparation for We are what we eat, plus some per mill: Using
# Source: Baino, Allan and Hopcraft, Grant and Kendall, Corinne and Munishi, Linus and Behdenna, Abdelkader and Newton, Jason (2021) - Dryad repository  
# DOI: 10.5061/DRYAD.1NS1RN8QF
# License: CC0 1.0 Universal

library(readr)
library(dplyr)
library(usethis)

# Read the raw data
raw_data <- read_csv("data-raw/raw_data/baino_etal_2021_vulture_diet.csv")

# Examine the data structure
cat("Original data structure:\n")
str(raw_data)
head(raw_data)

# Check unique values in key columns
# sapply(raw_data[c("column1", "column2")], function(x) unique(x))

# Clean and prepare the data
vulture_diet <- raw_data %>%
  # Add your factor conversions here
  mutate(
    species = as.factor(species),
    tissue = as.factor(tissue)
  # mutate(column_name = as.factor(column_name)) %>%
  # arrange()  # Add appropriate sorting
  )
# Check the cleaned data
str(vulture_diet)

# Save to package data
usethis::use_data(vulture_diet, overwrite = TRUE)
cat("✅ Dataset saved!\n")

