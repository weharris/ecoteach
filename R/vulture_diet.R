#' Gyps Vulture Stable Isotope Analysis - Feather Data (AR.feather subset)
#'
#' Stable isotope data (carbon, nitrogen, and sulfur) from Gyps vulture feathers
#' collected in Tanzania for dietary analysis using stable isotope mixing models (SIMM).
#' This dataset represents the AR.feather subset containing raw consumer isotope values
#' from vulture feathers. Data was collected over 10 months from two protected areas:
#' Serengeti National Park and Selous Game Reserve to analyze vulture dietary patterns
#' across space and time using stable isotope analysis.
#'
#' Vultures were captured using noose lines around provisioned or natural bait, processed,
#' and released. Feather samples were analyzed for δ13C, δ15N, and δ34S using a PyroCube
#' elemental analyzer at the NERC Life Sciences Mass Spectrometry Facility. The isotope
#' signatures provide insights into vulture diet composition, with δ13C distinguishing
#' between C3 and C4 plant consumers (browsers vs grazers), δ15N indicating trophic level,
#' and δ34S helping separate geographic regions.
#'
#' @format A data frame with 21 rows and 5 variables:
#' \describe{
#'   \item{d13C}{Numeric, delta 13C carbon isotope values per mill (‰)}
#'   \item{d15N}{Numeric, delta 15N nitrogen isotope values per mill (‰)}
#'   \item{d34S}{Numeric, delta 34S sulfur isotope values per mill (‰)}
#'   \item{species}{Factor, vulture species sampled (African white-backed or Rüppell's griffon)}
#'   \item{tissue}{Factor, tissue type analyzed (feathers)}
#' }
#' @details
#' This subset was specifically prepared for use in stable isotope mixing models to estimate
#' diet composition in Gyps vultures. The study found that vulture diet consisted primarily
#' of grazing herbivores, with those in Serengeti National Park consuming higher proportions
#' (>87%) of grazing species. Coordinates in the original study were denatured by +0.5 degrees
#' to preserve geographic distribution while ensuring location confidentiality.
#' 
#' Collection period: August 18, 2018 to May 31, 2019
#' Study locations: Serengeti National Park (2.1540°S, 34.6857°E) and 
#' Selous Game Reserve (9.0000°S, 37.5000°E), Tanzania
#'
#' @source Baino, A., Hopcraft, G., Kendall, C., Munishi, L., Behdenna, A., & Newton, J. (2021). 
#'   We are what we eat, plus some per mill: Using stable isotopes to estimate diet composition 
#'   in Gyps vultures over space and time. Dryad Digital Repository. 
#'   \doi{10.5061/DRYAD.1NS1RN8QF}
#' @examples
#' \donttest{
#' # Load the dataset
#' data(vulture_diet)
#' head(vulture_diet)
#' summary(vulture_diet)
#' 
#' # Examine isotope signatures by species
#' boxplot(d13C ~ species, data = vulture_diet,
#'         main = "Carbon Isotope Signatures by Vulture Species",
#'         xlab = "Species", ylab = "δ13C (‰)")
#' 
#' # Create isotope biplot
#' plot(vulture_diet$d13C, vulture_diet$d15N,
#'      col = as.numeric(vulture_diet$species),
#'      pch = 16, cex = 1.2,
#'      xlab = "δ13C (‰)", ylab = "δ15N (‰)",
#'      main = "Vulture Feather Isotope Signatures")
#' legend("topright", legend = levels(vulture_diet$species), 
#'        col = 1:nlevels(vulture_diet$species), pch = 16)
#' 
#' # Summary statistics by species
#' aggregate(. ~ species, data = vulture_diet[,1:4], FUN = mean)
#' }
"vulture_diet"