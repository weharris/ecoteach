#' Raccoon dog activity and environmental factors in China
#'
#' This dataset contains records of raccoon dog (*Nyctereutes procyonoides*) detections and other mammal
#' species from camera traps in the Sizuolou Nature Reserve, Beijing, China, along with associated 
#' environmental variables. The data was collected from October 15, 2023, to February 29, 2024, 
#' covering both autumn and winter seasons. The study examined seasonal activity changes in raccoon dogs
#' and their relationship to environmental and mammalian factors.
#'
#' @format A data frame with 144 rows and 21 variables:
#' \describe{
#'   \item{point_id}{Camera installation point ID}
#'   \item{asian_badger}{Number of Asian badger detection events}
#'   \item{wild_boar}{Number of wild boar detection events}
#'   \item{hog_badger}{Number of hog badger detection events}
#'   \item{leopard_cat}{Number of leopard cat detection events}
#'   \item{masked_palm_civet}{Number of masked palm civet detection events}
#'   \item{rock_squirrel}{Number of Père David's rock squirrel detection events}
#'   \item{raccoon_dog}{Number of raccoon dog detection events}
#'   \item{red_squirrel}{Number of red squirrel detection events}
#'   \item{roe_deer}{Number of Siberian roe deer detection events}
#'   \item{siberian_weasel}{Number of Siberian weasel detection events}
#'   \item{striped_squirrel}{Number of Swinhoe's striped squirrel detection events}
#'   \item{tolai_hare}{Number of Tolai hare detection events}
#'   \item{dist_impervious}{Distance from camera to nearest impervious area (meters)}
#'   \item{dist_agricultural}{Distance from camera to nearest agricultural land (meters)}
#'   \item{dist_water}{Distance from camera to nearest water source (meters)}
#'   \item{dist_roads}{Distance from camera to nearest road (meters)}
#'   \item{Altitude}{Elevation of camera installation point (meters above sea level)}
#'   \item{tpi}{Topographic Position Index of the camera installation point}
#'   \item{Day}{Date of detection (days since start of study, October 15, 2023)}
#'   \item{Season}{Season at time of detection ("Autumn" or "Winter")}
#'   \item{Vegetation}{Type of vegetation at the camera installation point}
#' }
#' @source Miyamoto, Keisuke and Chen, Chuan and Luan, Xiaofeng (2025). Seasonal activity changes in raccoon dogs and influences of environmental factors from autumn to winter. Dryad Digital Repository. 
#'   \doi{10.5061/DRYAD.C866T1GJN}
#' @examples
#' \donttest{
#' # Load the dataset
#' data(raccoondog_environment)
#' 
#' # Basic exploration
#' head(raccoondog_environment)
#' summary(raccoondog_environment)
#' 
#' # Compare raccoon dog detections by season
#' boxplot(raccoon_dog ~ Season, data = raccoondog_environment,
#'         main = "Raccoon Dog Detections by Season",
#'         ylab = "Number of Detections", xlab = "Season")
#'         
#' # Examine relationship between environmental factors and raccoon dog presence
#' # Create a binary presence variable
#' raccoondog_presence <- raccoondog_environment
#' raccoondog_presence$presence <- ifelse(raccoondog_presence$raccoon_dog > 0, 1, 0)
#' 
#' # Plot relationship with distance to agricultural land
#' plot(dist_agricultural ~ presence, data = raccoondog_presence,
#'      main = "Raccoon Dog Presence vs. Distance to Agricultural Land",
#'      xlab = "Presence (0=Absent, 1=Present)", 
#'      ylab = "Distance to Agricultural Land (m)")
#'      
#' # Examine vegetation types where raccoon dogs were detected
#' table(raccoondog_presence$Vegetation[raccoondog_presence$presence == 1])
#' }
"raccoondog_environment"

