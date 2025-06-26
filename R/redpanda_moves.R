#' Red Pandas on the Move: Weather and Disturbance Effects on Habitat Specialists
#'
#' This dataset contains GPS telemetry data from 10 red pandas (Ailurus fulgens) tracked for 
#' four months (December 2019 to March 2020) in the Himalayas. The data includes daily movement 
#' distances and associated weather conditions, allowing for analysis of how weather events and 
#' environmental factors affect the movement patterns of these habitat specialists.
#'
#' The study examined how challenging weather events, particularly snowfall, affect the movement
#' patterns and habitat use of red pandas. The data shows that males traveled further than females
#' when there was snow on the ground, and red pandas generally exhibited risk aversion behavior
#' by occupying areas away from human settlements, showing affinity for higher elevations, and
#' avoiding steep slopes when the forest was covered with snow.
#'
#' @format A data frame with 220 rows and 7 variables:
#' \describe{
#'   \item{Animal_Id}{Factor, unique identifier for each of the 10 study animals}
#'   \item{Sex}{Factor, sex of the animal (Male or Female)}
#'   \item{Age}{Factor, age category of the animal (Adult or Subadult)}
#'   \item{Distance}{Numeric, daily travel distance (m) covered by an individual in 24 hours}
#'   \item{Precipitation}{Factor, weather condition (Clear, Snowfall, or Rainfall)}
#'   \item{Snow_cover}{Factor, presence of snow cover (Yes or No)}
#'   \item{Snow_age}{Factor, age of snow if present (Fresh, Old, or No_snow)}
#'   \item{Temperature}{Numeric, mean daily temperature in degrees Celsius}
#' }
#' @details
#' The data was collected using GPS satellite collars. Weather data (except temperature) was 
#' collected in the field, while temperature was recorded by in-built sensors in the GPS collars.
#' Given the endangered status of red pandas, the exact coordinates of their locations are not 
#' included in this dataset.
#' 
#' The mean daily distance traveled by red pandas was 748 ± 40 m (median 573 m). Red pandas 
#' moved between 2,528 and 3,250 m elevation during the study period, with a mean elevation 
#' of 2,857 ± 107 m when snow was on the ground and 2,816 ± 99 m without snow.
#'
#' @source Damber, B. (2024). Red pandas on the move: Weather and disturbance effects on habitat specialists. 
#'   Dryad Digital Repository. 
#'   \doi{https://doi.org/10.5061/dryad.cjsxksngd}
#' @examples
#' \donttest{
#' # Load the dataset
#' data(redpanda_moves)
#' 
#' # Basic exploration
#' head(redpanda_moves)
#' summary(redpanda_moves)
#' 
#' # Compare movement distances by sex
#' boxplot(Distance ~ Sex, data = redpanda_moves,
#'         main = "Red Panda Movement Distances by Sex",
#'         ylab = "Daily Distance (m)")
#'         
#' # Examine effect of snow cover on movement
#' boxplot(Distance ~ Snow_cover, data = redpanda_moves,
#'         main = "Effect of Snow Cover on Movement Distance",
#'         ylab = "Daily Distance (m)")
#'         
#' # Compare male and female movement with snow
#' library(dplyr)
#' redpanda_moves %>%
#'   group_by(Sex, Snow_cover) %>%
#'   summarize(mean_distance = mean(Distance),
#'             sd_distance = sd(Distance))
#' }
"redpanda_moves"

