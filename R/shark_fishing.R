#' Shark Mortality Predictions from Fishing
#'
#' This dataset contains mean estimates of species-specific at-vessel (AVM) and 
#' post-release mortality (PRM) for shark species caught by longlines and gillnets.
#' The data were derived from a random forest regression model that analyzed 
#' mortality rates based on biological and ecological characteristics of each species.
#' The study assessed how retention bans might impact fishing mortality and whether
#' such measures are sufficient to stop overfishing of threatened shark species.
#'
#' The dataset includes biological traits for each species (family, reproductive mode,
#' median depth, maximum size), ventilation method (ram vs. stationary), habitat type
#' (pelagic vs. demersal), and predicted mortality proportions for different fishing gear.
#' These predictions help evaluate the potential effectiveness of retention bans as a
#' conservation measure for shark populations.
#'
#' @format A data frame with 982 rows and 12 variables:
#' \describe{
#'   \item{scientific_name}{Factor, scientific name of shark species}
#'   \item{family}{Factor, taxonomic family}
#'   \item{reproductive_mode}{Factor, reproductive strategy (matrotrophic viviparity, lecithotrophic viviparity, lecithotrophic oviparity)}
#'   \item{ac}{Numeric, active hypoxia tolerance metric}
#'   \item{median_depth}{Numeric, median depth of occurrence in meters}
#'   \item{max_size_cm}{Numeric, maximum size the species can reach in centimeters}
#'   \item{ventilation_method}{Factor, respiratory method (ram or stationary)}
#'   \item{habitat}{Factor, primary habitat type (pelagic or demersal)}
#'   \item{estimate_type}{Factor, type of mortality estimate (AVM Longline, PRM Longline)}
#'   \item{mortality_prop}{Numeric, proportion of individuals that died (0-1 scale)}
#'   \item{gear_class}{Factor, fishing gear type (Longline)}
#'   \item{estimate_type_new}{Factor, simplified mortality type (AVM or PRM)}
#' }
#' @details
#' The study found that smaller-bodied species inhabiting shallow waters were more likely
#' to suffer at-vessel mortality compared to deep-water species, which were more prone to
#' post-release mortality. For threatened shark species, the median ratio of fishing mortality
#' under retention bans compared to maximum sustainable yield was 2.28, indicating that
#' retention bans alone may be insufficient to prevent overfishing.
#' 
#' Collection period: Data compiled through 2024
#' Study locations: Global analysis
#'
#' @source Feitosa, L. M., Caughman, A., D'Costa, N., Orofino, S., Burns, E., Schiller, L., 
#'   Worm, B., & Bradley, D. (2025). Estimates of Shark at-vessel, Post-release Mortality, 
#'   and Retention Ban Effects on Stopping Overfishing. Dryad Digital Repository. 
#'   \doi{10.5061/DRYAD.0P2NGF27T}
#' @examples
#' \donttest{
#' # Load the dataset
#' data(shark_fishing)
#' 
#' # Basic exploration
#' head(shark_fishing)
#' summary(shark_fishing)
#' 
#' # Compare at-vessel vs post-release mortality
#' boxplot(mortality_prop ~ estimate_type_new, data = shark_fishing,
#'         main = "Mortality by Estimate Type",
#'         xlab = "Mortality Type", ylab = "Proportion")
#'         
#' # Examine relationship between depth and mortality
#' plot(shark_fishing$median_depth, shark_fishing$mortality_prop,
#'      col = as.numeric(shark_fishing$estimate_type_new),
#'      pch = 16, cex = 0.8,
#'      xlab = "Median Depth (m)", ylab = "Mortality Proportion",
#'      main = "Shark Mortality vs. Depth")
#' legend("topright", legend = levels(shark_fishing$estimate_type_new), 
#'        col = 1:nlevels(shark_fishing$estimate_type_new), pch = 16)
#'        
#' # Compare mortality by ventilation method
#' boxplot(mortality_prop ~ ventilation_method, data = shark_fishing,
#'         main = "Mortality by Ventilation Method",
#'         xlab = "Ventilation Method", ylab = "Proportion")
#' }
"shark_fishing" 