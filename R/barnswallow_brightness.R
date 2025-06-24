#' Barn Swallow Plumage Brightness and Mate Selection
#'
#' This dataset contains information on plumage brightness measurements for North American 
#' barn swallows (Hirundo rustica erythrogaster) and their mating patterns. The data includes 
#' measurements of belly and breast brightness for social pairs and extra-pair mates.
#' This dataset was used to study assortative mating patterns in barn swallows, investigating
#' how plumage coloration affects mate selection both within social pairs and through
#' extra-pair fertilizations.
#'
#' @format A data frame with 19 rows and 7 variables:
#' \describe{
#'   \item{MaleID}{Band ID for the focal male}
#'   \item{PairID}{Band ID for the female social mate}
#'   \item{EPID}{Band ID for the extra-pair mate}
#'   \item{PairB_bright}{Belly brightness for the social male (unitless measurement of reflectance)}
#'   \item{PairR_bright}{Breast brightness for the social male (unitless measurement of reflectance)}
#'   \item{EPB_bright}{Belly brightness for the extra-pair male (unitless measurement of reflectance)}
#'   \item{EPR_bright}{Breast brightness for the extra-pair male (unitless measurement of reflectance)}
#' }
#' @source Morosse, Omar, Tsunekage, Toshi, Kenny-Duddela, Heather, Schield, Drew, Keller, Kayleigh, Safran, Rebecca, & Levin, Iris (2025). 
#'   North American barn swallows pair, mate, and interact assortatively. Dryad Digital Repository. 
#'   \doi{10.5061/DRYAD.1G1JWSV8G}
#' @examples
#' \donttest{
#' # Load the dataset
#' data(barnswallow_brightness)
#' 
#' # Basic exploration
#' head(barnswallow_brightness)
#' summary(barnswallow_brightness)
#' 
#' # Compare brightness between social and extra-pair males
#' boxplot(barnswallow_brightness$PairB_bright, barnswallow_brightness$EPB_bright,
#'         names = c("Social Male", "Extra-pair Male"),
#'         main = "Comparison of Belly Brightness",
#'         ylab = "Brightness")
#'         
#' # Correlation between social and extra-pair male brightness
#' plot(barnswallow_brightness$PairB_bright, barnswallow_brightness$EPB_bright,
#'      main = "Correlation between Social and Extra-pair Male Brightness",
#'      xlab = "Social Male Belly Brightness",
#'      ylab = "Extra-pair Male Belly Brightness")
#' abline(lm(EPB_bright ~ PairB_bright, data = barnswallow_brightness), col = "red")
#' }
"barnswallow_brightness"

