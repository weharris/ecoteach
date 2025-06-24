# Data preparation for Mate copying in Drosophila simulans
# Source: Nöbel, Sabine and Kaufmann, Tim (2025) - Dryad repository  
# DOI: 10.5061/DRYAD.ZS7H44JMC
# License: CC0 1.0 Universal
# Prepared: 2023-06-24

library(readr)
library(dplyr)
library(usethis)

# Read the raw data
raw_data <- read_csv("data-raw/raw_data/Nobel_Kaufmann_2025_Dsimulans_matechoice.csv")

# Examine the data structure
cat("Original data structure:\n")
str(raw_data)
cat("\nFirst few rows:\n")
head(raw_data)
cat("\nUnique values in key columns:\n")
cat("Strain unique values:", paste(unique(raw_data$Strain), collapse = ", "), "\n")
cat("Treatment unique values:", paste(unique(raw_data$Treatment), collapse = ", "), "\n")
cat("ColourDemo unique values:", paste(unique(raw_data$ColourDemo), collapse = ", "), "\n")
cat("MCS unique values:", paste(unique(raw_data$MCS), collapse = ", "), "\n")

# Clean and prepare the data for package inclusion
Dsimulans_matechoice <- raw_data %>%
  # Convert categorical variables to factors
  mutate(
    # Experimenter
    Experimentor = factor(Experimentor),
    
    # Strain (fly population)
    Strain = factor(Strain, levels = c("H", "S", "D"), 
                    labels = c("Haale", "Maison Salasar", "Deyme")),
    
    # Treatment (mate copying = informed, control = uninformed)
    Treatment = factor(Treatment, levels = c("MC", "C"), 
                       labels = c("Mate copying", "Control")),
    
    # Color variables
    ColourDemo = factor(ColourDemo, levels = c("G", "P"), 
                        labels = c("Green", "Pink")),
    Colour1Court = factor(Colour1Court, levels = c("G", "P"), 
                          labels = c("Green", "Pink")),
    Colour2Court = factor(Colour2Court, levels = c("G", "P"), 
                          labels = c("Green", "Pink")),
    ColourTest = factor(ColourTest, levels = c("G", "P", "p"), 
                        labels = c("Green", "Pink", "Pink")),
    
    # Chamber position
    Chamber = factor(Chamber),
    
    # Device number
    Device = factor(Device),
    
    # Mate-copying score
    MCS = factor(MCS, levels = c(0, 1), 
                labels = c("Different color", "Same color")),
    
    # Convert date to proper Date object
    Date = as.Date(Date, format = "%d/%m/%Y")
  ) %>%
  # Arrange by date and time
  arrange(Date, TimeDemo)

# Verify the cleaned data
cat("\nCleaned data structure:\n")
str(Dsimulans_matechoice)

# Check for any missing values or issues
cat("\nMissing values per column:\n")
sapply(Dsimulans_matechoice, function(x) sum(is.na(x)))

# Save to package data (compressed .rda format for CRAN)
usethis::use_data(Dsimulans_matechoice, overwrite = TRUE)

cat("\n✅ Dataset 'Dsimulans_matechoice' prepared and saved!\n")
cat("Size of final dataset:", object.size(Dsimulans_matechoice), "bytes\n")

