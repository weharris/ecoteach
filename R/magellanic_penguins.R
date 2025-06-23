#' Magellanic Penguin Foraging and Reproductive Data
#'
#' Data from satellite tracking of Magellanic penguins (Spheniscus magellanicus)
#' at Punta Tombo, Argentina, spanning 23 breeding seasons. The dataset contains
#' information on foraging site fidelity, trip characteristics, and reproductive
#' success for individual penguins.
#'
#' @format A data frame with 212 rows and 21 variables:
#' \describe{
#'   \item{SeasonYear}{Integer, breeding season year}
#'   \item{PenguinID}{Integer, unique identifier for each penguin}
#'   \item{PenguinSeq}{Integer, sequential penguin number within season}
#'   \item{InstrumentSeq}{Integer, instrument deployment sequence}
#'   \item{NTripPairsLong}{Integer, number of long trip pairs}
#'   \item{DistBetMean}{Numeric, mean distance between foraging sites (km)}
#'   \item{DistBetSD}{Numeric, standard deviation of distance between sites (km)}
#'   \item{DistBetMin}{Numeric, minimum distance between foraging sites (km)}
#'   \item{DistBetMax}{Numeric, maximum distance between foraging sites (km)}
#'   \item{InstrType}{Factor, type of tracking instrument used}
#'   \item{InstrModel}{Character, model of tracking instrument}
#'   \item{NFledged}{Integer, number of chicks that fledged successfully}
#'   \item{DurDaysMean}{Numeric, mean trip duration in days}
#'   \item{TripDistMean}{Numeric, mean trip distance (km)}
#'   \item{BearingMean}{Numeric, mean bearing of foraging trips (degrees)}
#'   \item{PenguinSex}{Factor, sex of penguin ("Male", "Female")}
#'   \item{NumTrips}{Integer, total number of foraging trips}
#'   \item{NumChicksDeploy}{Integer, number of chicks at deployment}
#'   \item{NumChicksStarved}{Integer, number of chicks that starved}
#'   \item{DeployDurDays}{Integer, deployment duration in days}
#'   \item{ChlaMean}{Numeric, mean chlorophyll-a concentration}
#' }
#' @source Rebstock, G., Abrahms, B., & Boersma, D. (2022). Data from: Site 
#'   fidelity increases reproductive success by increasing foraging efficiency 
#'   in a marine predator. Dryad Digital Repository. 
#'   \doi{10.5061/DRYAD.8931ZCRSV}
#' @references Rebstock, G.A., Abrahms, B. & Boersma, P.D. (2022). Site fidelity 
#'   increases reproductive success by increasing foraging efficiency in a marine 
#'   predator. Proceedings of the Royal Society B, 289(1975), 20220175.
#' @examples
#' \donttest{
#' # Load the dataset
#' data(magellanic_penguins)
#' 
#' # Basic exploration
#' head(magellanic_penguins)
#' summary(magellanic_penguins)
#' 
#' # Examine foraging efficiency by sex
#' boxplot(TripDistMean ~ PenguinSex, data = magellanic_penguins,
#'         main = "Mean Trip Distance by Sex",
#'         xlab = "Sex", ylab = "Mean Trip Distance (km)")
#' 
#' # Relationship between site fidelity and reproductive success
#' plot(magellanic_penguins$DistBetMean, magellanic_penguins$NFledged,
#'      xlab = "Mean Distance Between Sites (km)",
#'      ylab = "Number of Chicks Fledged",
#'      main = "Site Fidelity vs Reproductive Success")
#' }
"magellanic_penguins"