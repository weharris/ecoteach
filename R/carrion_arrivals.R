#' Vertebrate scavenger visits to roe deer carrion
#'
#' This dataset contains observations of vertebrate scavenger activity at roe deer evisceration 
#' residues (carrion) in a central European mountainous mixed forest. The data was collected 
#' from 47 roe deer viscera samples from hunted deer that were exposed to vertebrate scavenging 
#' in front of camera traps between May and October 2022. The dataset records visits, feeding, 
#' and removal events by various vertebrate scavengers, with events considered independent if 
#' more than 20 minutes passed between consecutive pictures. Samples were observed for a maximum 
#' of 16 days. The data provides insights into the composition of vertebrate scavenging fauna 
#' using evisceration residues, which species remove entire samples, and how long viscera 
#' remain available to invertebrate scavengers.
#'
#' @format A data frame with 599 rows and 7 variables:
#' \describe{
#'   \item{Samples}{Sample site identifier (factor)}
#'   \item{Dates Setup}{Date when camera and sample were set up (Date)}
#'   \item{Date Event}{Date when the scavenging event was recorded (Date)}
#'   \item{Time}{Time when the scavenging event was recorded (hms)}
#'   \item{Species}{Species of scavenger observed (factor)}
#'   \item{Behaviour}{Type of behavior observed: Visit, Feeding, or Removal (factor)}
#'   \item{Days2}{Time elapsed in days between sample exposure and detected event (numeric)}
#' }
#' @source Schwegmann, Sebastian (2023). Data for: Use of viscera from hunted roe deer by vertebrate scavengers in summer in central European mountainous mixed forest. Dryad Digital Repository. 
#'   \doi{10.5061/DRYAD.Q573N5TPP}
#' @examples
#' \donttest{
#' # Load the dataset
#' data(carrion_arrivals)
#' 
#' # Basic exploration
#' head(carrion_arrivals)
#' summary(carrion_arrivals)
#' 
#' # Count observations by species
#' table(carrion_arrivals$Species)
#' 
#' # Compare behaviors by species
#' table(carrion_arrivals$Species, carrion_arrivals$Behaviour)
#' 
#' # Calculate average days until first scavenger arrival by species
#' library(dplyr)
#' carrion_arrivals %>%
#'   group_by(Species) %>%
#'   summarize(mean_days = mean(Days2, na.rm = TRUE)) %>%
#'   arrange(mean_days)
#' 
#' # Visualize scavenger activity over time
#' if (require(ggplot2)) {
#'   ggplot(carrion_arrivals, aes(x = Days2, fill = Species)) +
#'     geom_histogram(binwidth = 1, position = "stack") +
#'     labs(title = "Scavenger activity over time",
#'          x = "Days since carrion placement",
#'          y = "Number of observations")
#' }
#' }
"carrion_arrivals"

