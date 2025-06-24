#' Elephant Agricultural Use Metrics in Mara-Serengeti Ecosystem
#'
#' A dataset containing agricultural use metrics for 66 elephants in the Mara-Serengeti ecosystem
#' in Kenya and Tanzania. The data were collected to characterize crop use tactics by elephants
#' and to understand how elephants interact with agricultural areas. The dataset includes metrics 
#' such as mean agricultural use, maximum use from a moving average, and the difference between 
#' mean and max use. These metrics were used to classify agricultural use tactics for each elephant 
#' using Gaussian mixture models. The dataset contains individual-year agricultural use metrics, 
#' space use, and elephant metadata, with tactic classifications for both lifetime tracks and 
#' individual years.
#'
#' @format A data frame with 202 rows and 17 variables:
#' \describe{
#'   \item{subject_name}{Individual elephant ID}
#'   \item{tactic.aggregate}{Tactic classification for lifetime GPS track of individual: 
#'                          Rare, Sporadic, Seasonal, or Habitual}
#'   \item{season.year}{Year cuts (cut date April 1 of each year)}
#'   \item{tactic.season}{Tactic classification for the associated year: 
#'                       Rare, Sporadic, Seasonal, or Habitual}
#'   \item{year.begin}{Data start date for a given year}
#'   \item{year.end}{Data stop date for a given year}
#'   \item{n.fixes}{Number of GPS relocations for an individual in a given year}
#'   \item{year.mean}{Mean agricultural use for a given year}
#'   \item{year.max}{Maximum agricultural use from a 90-day moving average for a given year}
#'   \item{year.delta}{Difference in mean and max agricultural use for a given year}
#'   \item{year.mcp.area}{MCP homerange for an individual in a given year}
#'   \item{mu.daily.disp}{Mean daily displacement for an individual in a given year}
#'   \item{subject_sex}{Sex of the individual (male or female)}
#'   \item{subject_ageClass}{Age class of individual (young adult or mature adult)}
#'   \item{centroid.dist.meters}{Distance from centroid of homerange to agriculture (meters)}
#'   \item{tactic.prev}{Tactic of the previous year (NA if no previous tactic could be confirmed)}
#'   \item{tactic.change}{Whether an individual changed tactics ("Changed") or stayed the same ("No change")}
#' }
#' @source Hahn, Nathan (2021). Elephant agricultural use metrics in Mara-Serengeti ecosystem. 
#'   Dryad Digital Repository. \doi{10.5061/DRYAD.RN8PK0PBN}
#' @examples
#' \donttest{
#' # Load the dataset
#' data(elephant_farmers)
#' 
#' # Basic exploration
#' head(elephant_farmers)
#' summary(elephant_farmers)
#' 
#' # Examine distribution of tactics by sex
#' table(elephant_farmers$subject_sex, elephant_farmers$tactic.season)
#' 
#' # Compare agricultural use metrics across tactics
#' boxplot(year.mean ~ tactic.season, data = elephant_farmers, 
#'         main = "Mean Agricultural Use by Tactic",
#'         ylab = "Mean Agricultural Use")
#'         
#' # Examine tactic changes over time
#' # Count how many elephants changed tactics vs stayed the same
#' table(elephant_farmers$tactic.change, useNA = "ifany")
#' 
#' # Look at relationship between distance to agriculture and tactic
#' boxplot(centroid.dist.meters ~ tactic.season, data = elephant_farmers,
#'         main = "Distance to Agriculture by Tactic",
#'         ylab = "Distance (meters)")
#' }
"elephant_farmers"

