#' European badger energy expenditure and tuberculosis infection data
#'
#' This dataset contains measurements of daily energy expenditure (DEE) and related variables
#' for European badgers (Meles meles) in relation to their tuberculosis (TB) infection status.
#' The data were collected to examine how disease status and other factors like season, group size,
#' sex, age, and body mass affect energy balance in wild badgers. Some individuals were measured
#' multiple times across different seasons.
#'
#' @format A data frame with 56 rows and 7 variables:
#' \describe{
#'   \item{ID}{Unique identifier for each badger}
#'   \item{age}{Age class of the badger: "cub" or "adult"}
#'   \item{sex}{Sex of the badger: "F" (female) or "M" (male)}
#'   \item{group_size}{Number of badgers in the social group}
#'   \item{body_mass}{Body mass in kilograms (kg)}
#'   \item{daily_energy}{Daily energy expenditure (DEE) in kilojoules per day (kJ/day)}
#'   \item{season}{Season when measurements were taken: "Winter", "Spring", "Summer", or "Autumn"}
#'   \item{disease}{Tuberculosis infection status: "Negative", "Diseased", or "Exposed"}
#' }
#' @source Barbour, Katie and McClune, David W. and Delahay, Richard J. and Speakman, John R. and McGowan, Natasha E. and Kostka, Berit and Montgomery, Ian W. and Marks, Nikki J. and Scantlebury, David M. (2019). Data from: No energetic cost of tuberculosis infection in European badgers (Meles meles). Dryad Digital Repository. 
#'   \doi{10.5061/DRYAD.MN84H20}
#' @examples
#' \donttest{
#' # Load the dataset
#' data(badger_energy)
#' 
#' # Basic exploration
#' head(badger_energy)
#' summary(badger_energy)
#' 
#' # Compare energy expenditure by disease status
#' boxplot(daily_energy ~ disease, data = badger_energy, 
#'         main = "Daily Energy Expenditure by TB Status",
#'         ylab = "DEE (kJ/day)", xlab = "TB Status")
#'         
#' # Examine relationship between body mass and energy expenditure
#' plot(daily_energy ~ body_mass, data = badger_energy,
#'      col = as.numeric(disease), pch = 16,
#'      main = "Energy Expenditure vs Body Mass",
#'      xlab = "Body Mass (kg)", ylab = "DEE (kJ/day)")
#' legend("topright", levels(badger_energy$disease), 
#'        col = 1:3, pch = 16)
#' }
"badger_energy"

