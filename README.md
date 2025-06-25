
<!-- README.md is generated from README.Rmd. Please edit that file -->

# ecoteach

<!-- badges: start -->

<!-- badges: end -->

The goal of ecoteach is to provide a collection of curated educational
datasets for teaching ecology and agriculture concepts. The package
includes data on wildlife monitoring, plant treatments, and ecological
observations with documentation and examples for educational use.

## Installation

You can install the released version of ecoteach from
[CRAN](https://CRAN.R-project.org) with:

``` r
install.packages("ecoteach")
```

And the development version from [GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("username/ecoteach")
```

## Example

This package provides datasets that can be used to teach ecological and
statistical concepts. Here’s an example using the dormouse hibernation
dataset:

``` r
# Load the package
library(ecoteach)
# Or use devtools::load_all() during development
# devtools::load_all()

# Load the dormouse hibernation dataset
data(dormouse_hibernation)

# View the first few rows
head(dormouse_hibernation)
#>   animal_id year_birth age log_age body_mass_before body_mass_after
#> 1         1       2002   2  0.3010              261             167
#> 2         1       2002   4  0.6021              265             227
#> 3         1       2002   5  0.6990              315             182
#> 4         1       2002   6  0.7782              318             173
#> 5         1       2002   7  0.8451              264             189
#> 6         1       2002   8  0.9031              190             135
#>   hibernation_duration hibernation_start hibernation_end
#> 1                  237          20.08.04        14.04.05
#> 2                  335          23.05.06        23.04.07
#> 3                  264          26.07.07        15.04.08
#> 4                  357          07.05.08        29.04.09
#> 5                  335          27.05.09        27.04.10
#> 6                  181          21.09.10        21.03.11
#>   hibernation_end_year_before body_mass_spring year  sex     diet age_death
#> 1                        <NA>               NA 2004 male   medium        11
#> 2                    10.05.06              215 2006 male   medium        11
#> 3                    23.04.07              227 2007 male high fat        11
#> 4                    15.04.08              182 2008 male   medium        11
#> 5                    29.04.09              173 2009 male  protein        11
#> 6                    27.04.10              189 2010 male high fat        11
#>   repro_active
#> 1          yes
#> 2           no
#> 3          yes
#> 4           no
#> 5           no
#> 6          yes
```

### Exploring the data

The dormouse hibernation dataset contains data on hibernation patterns
and body mass changes in edible dormice (*Glis glis*). We can create a
simple visualization to explore how body mass changes during
hibernation:

``` r
# Basic analysis of body mass loss during hibernation
library(ggplot2)

# Calculate percentage of body mass lost
dormouse_hibernation$mass_loss_percent <- 
  (dormouse_hibernation$body_mass_before - dormouse_hibernation$body_mass_after) / 
  dormouse_hibernation$body_mass_before * 100

# Create a boxplot of mass loss percentage by sex
ggplot(dormouse_hibernation, aes(x = sex, y = mass_loss_percent, fill = sex)) +
  geom_boxplot() +
  labs(title = "Body Mass Loss During Hibernation in Dormice",
       x = "Sex",
       y = "Body Mass Loss (%)") +
  theme_minimal()
```

This example shows how the dataset can be used to explore sex
differences in hibernation physiology, which could be used in a teaching
context to demonstrate boxplots, t-tests, or ANOVA.

## Available Datasets

The package includes the following datasets:

- `badger_energy`: Energy expenditure data for European badgers with
  tuberculosis
- `barnswallow_brightness`: Plumage brightness data for barn swallows
- `berberis_treatment`: Data on invasive Berberis management treatments
- `carrion_arrivals`: Vertebrate scavenger visits to roe deer carrion
- `chimpanzee_cameras`: Camera trap detection data for wild chimpanzees
- `dormouse_hibernation`: Hibernation and reproduction data for edible
  dormice
- `Dsimulans_matechoice`: Mate copying data for fruit flies
- `elephant_farmers`: Agricultural use metrics for elephants
- `lion_reproduction`: Reproductive data for Galapagos sea lions
- `magellanic_penguins`: Long-term monitoring data on Magellanic
  penguins
- `pangolin_habitat`: Habitat occupancy data for Chinese pangolins
- `raccoondog_environment`: Raccoon dog activity and environmental
  factors in China
- `scavenger_community`: Scavenger community structure along
  environmental gradients
- `vulture_diet`: Diet composition analysis of African vultures
- `whale_brains`: Brain size evolution data for cetaceans

Each dataset includes comprehensive documentation with details about the
variables, source references, and suggested analyses for teaching
purposes.
