<!-- README.md is generated from README.Rmd. Please edit that file -->

# ecoteach

<!-- badges: start -->

<!-- badges: end -->

The goal of ecoteach is to provide a collection of curated educational datasets for teaching ecology and agriculture concepts. The package includes data on wildlife monitoring, plant treatments, and ecological observations with documentation and examples for educational use.

## Installation

You can install the released version of ecoteach from [CRAN](https://CRAN.R-project.org) with:

``` r
install.packages("ecoteach")
```

And the development version from [GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("username/ecoteach")
```

## Example

This is a basic example which shows you how to explore the datasets in the package:

``` r
library(ecoteach)

# List all available datasets
data(package = "ecoteach")

# Load a specific dataset
data(vulture_diet)

# Examine the structure
str(vulture_diet)

# Basic summary
summary(vulture_diet)

# Calculate Shannon diversity index
shannon_diversity(c(10, 15, 8, 12, 5))
```

## Available Datasets

The package includes the following datasets:

- `badger_energy`: Energy expenditure data for European badgers with tuberculosis
- `barnswallow_brightness`: Plumage brightness data for barn swallows
- `berberis_treatment`: Data on invasive Berberis management treatments
- `carrion_arrivals`: Vertebrate scavenger visits to roe deer carrion
- `chimpanzee_cameras`: Camera trap detection data for wild chimpanzees
- `dormouse_hibernation`: Hibernation and reproduction data for edible dormice
- `Dsimulans_matechoice`: Mate copying data for fruit flies
- `elephant_farmers`: Agricultural use metrics for elephants
- `lion_reproduction`: Reproductive data for Galapagos sea lions
- `magellanic_penguins`: Long-term monitoring data on Magellanic penguins
- `pangolin_habitat`: Habitat occupancy data for Chinese pangolins
- `raccoondog_environment`: Raccoon dog activity and environmental factors in China
- `scavenger_community`: Scavenger community structure along environmental gradients
- `vulture_diet`: Diet composition analysis of African vultures
- `whale_brains`: Brain size evolution data for cetaceans

Each dataset includes comprehensive documentation and examples of potential analyses.
