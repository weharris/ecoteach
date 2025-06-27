#' ecoteach: Educational Datasets for Ecology and Agriculture
#'
#' @description 
#' A collection of curated educational datasets for teaching ecology and
#' agriculture concepts. The package provides clean, well-documented datasets
#' that can be used for teaching data analysis, statistics, and ecological concepts
#' in classroom settings. Each dataset includes comprehensive documentation and
#' examples of potential analyses.
#'
#' @details
#' The package includes the following datasets:
#' \itemize{
#'   \item \code{\link{badger_energy}}: Energy expenditure data for European badgers with tuberculosis
#'   \item \code{\link{barnswallow_brightness}}: Plumage brightness data for barn swallows
#'   \item \code{\link{berberis_treatment}}: Data on invasive Berberis management treatments
#'   \item \code{\link{carrion_arrivals}}: Vertebrate scavenger visits to roe deer carrion
#'   \item \code{\link{chimpanzee_cameras}}: Camera trap detection data for wild chimpanzees
#'   \item \code{\link{dormouse_hibernation}}: Hibernation and reproduction data for edible dormice
#'   \item \code{\link{Dsimulans_matechoice}}: Mate copying data for fruit flies
#'   \item \code{\link{elephant_farmers}}: Agricultural use metrics for elephants
#'   \item \code{\link{leafcutter_disturbance}}: Leaf-cutting ant herbivory under human disturbance
#'   \item \code{\link{lion_reproduction}}: Reproductive data for Galapagos sea lions
#'   \item \code{\link{magellanic_penguins}}: Long-term monitoring data on Magellanic penguins
#'   \item \code{\link{pangolin_habitat}}: Habitat occupancy data for Chinese pangolins
#'   \item \code{\link{raccoondog_environment}}: Raccoon dog activity and environmental factors in China
#'   \item \code{\link{redpanda_moves}}: Movement patterns and weather effects on red pandas
#'   \item \code{\link{scavenger_community}}: Scavenger community structure along environmental gradients
#'   \item \code{\link{shark_fishing}}: Shark mortality predictions from fishing operations
#'   \item \code{\link{vulture_diet}}: Diet composition analysis of African vultures
#'   \item \code{\link{whale_brains}}: Brain size evolution data for cetaceans
#' }
#'
#' All datasets are provided in tidy format, with factors appropriately coded,
#' and include proper citation information. The package aims to make it easy for
#' instructors to incorporate real ecological data into their teaching.
#'
#' @section Data Sources:
#' All datasets are derived from published scientific studies and are available
#' under CC0 or compatible licenses. Full citations and DOIs are provided in the
#' documentation for each dataset.
#'
#' @name ecoteach-package
#' @aliases ecoteach
#' @keywords package
#'
#' @references
#' Adriaens, T., Verschelde, P., Cartuyvels, E., D'hondt, B., Vercruysse, E., 
#' van Gompel, W., Dewulf, E., & Provoost, S. (2019). 
#' A preliminary field trial to compare control techniques for invasive Berberis aquifolium in Belgian coastal dunes.
#' \doi{10.5281/zenodo.3351504}
#'
#' Rebstock, G. A., Boersma, P. D., & García-Borboroglu, P. (2022). 
#' Magellanic penguin nest counts and reproductive success at Punta Tombo, Argentina, 1982-2021.
#' \doi{10.5061/DRYAD.8931ZCRSV}
#'
#' Baino, A., Hopcraft, G., Kendall, C., Munishi, L., Behdenna, A., & Newton, J. (2021). 
#' We are what we eat, plus some per mill: Using stable isotopes to estimate diet composition of African vultures.
#' \doi{10.5061/dryad.1ns1rn8qf}
#'
#' Crunchant, A-S., Borchers, D., Kuehl, H., & Piel, A. K. (2020). 
#' Listening and watching: Do camera traps or acoustic sensors more efficiently detect wild chimpanzees in an open habitat?
#' \doi{10.5061/dryad.5dv41ns34}
#'
#' Kalberer, S., Meise, K., Trillmich, F., & Krüger, O. (2018).
#' Reproductive performance of a tropical apex predator in an unpredictable habitat.
#' \doi{10.5061/DRYAD.6S48579}
#'
#' Morosse, O., Tsunekage, T., Kenny-Duddela, H., Schield, D., Keller, K., Safran, R., & Levin, I. (2025).
#' North American barn swallows pair, mate, and interact assortatively.
#' \doi{10.5061/DRYAD.1G1JWSV8G}
#'
#' Subba, A., Tamang, G., Lama, S., Basnet, N., Kyes, R. C., & Khanal, L. (2024).
#' Habitat occupancy of the critically endangered Chinese pangolin (Manis pentadactyla) under human disturbance
#' in an urban environment: Implications for conservation.
#' \doi{10.5061/DRYAD.73N5TB34T}
#'
#' Peacock, J., Waugh, D., Bajpai, S., & Thewissen, J. G. M. (2025).
#' The evolution of hearing and brain size in Eocene whales.
#' \doi{10.5061/DRYAD.SF7M0CGH1}
#'
#' Hahn, N. (2021).
#' Elephant agricultural use metrics in Mara-Serengeti ecosystem.
#' \doi{10.5061/DRYAD.RN8PK0PBN}
#'
#' Nöbel, S., & Kaufmann, T. (2025).
#' Data from: Mate copying in Drosophila simulans.
#' \doi{10.5061/DRYAD.ZS7H44JMC}
#'
#' Schwegmann, S. (2023).
#' Use of viscera from hunted roe deer by vertebrate scavengers in summer in central European mountainous mixed forest.
#' \doi{10.5061/DRYAD.Q573N5TPP}
#'
#' Gomo, G., Rød-Eriksen, L., Andreassen, H. P., Mattisson, J., Odden, M., Devineau, O., & Eide, N. E. (2020).
#' Scavenger community structure along an environmental gradient from boreal forest to alpine tundra in Scandinavia.
#' \doi{10.1002/ece3.6834}
#'
#' Barbour, K., McClune, D. W., Delahay, R. J., Speakman, J. R., McGowan, N. E., Kostka, B., Montgomery, I. W., Marks, N. J., & Scantlebury, D. M. (2019).
#' No energetic cost of tuberculosis infection in European badgers (Meles meles).
#' \doi{10.5061/DRYAD.MN84H20}
#'
#' Miyamoto, K., Chen, C., & Luan, X. (2025).
#' Seasonal activity changes in raccoon dogs and influences of environmental factors from autumn to winter.
#' \doi{10.5061/DRYAD.C866T1GJN}
#'
#' Bieber, C., Turbill, C., & Ruf, T. (2019).
#' Effects of aging on timing of hibernation and reproduction.
#' \doi{10.5061/DRYAD.8004G37}
#'
#' Damber, B. (2024).
#' Red pandas on the move: Weather and disturbance effects on habitat specialists.
#' \doi{10.5061/dryad.cjsxksngd}
#'
#' Feitosa, L. M., Caughman, A., D'Costa, N., Orofino, S., Burns, E., Schiller, L., Worm, B., & Bradley, D. (2025).
#' Estimates of Shark at-vessel, Post-release Mortality, and Retention Ban Effects on Stopping Overfishing.
#' \doi{10.5061/DRYAD.0P2NGF27T}
#'
#' Siqueira, F. F. S., Ribeiro-Neto, J. D., Tabarelli, M., Andersen, A. N., Wirth, R., & Leal, I. R. (2018).
#' Human disturbance promotes herbivory by leaf-cutting ants in the Caatinga dry forest.
#' \doi{10.5061/DRYAD.KP59G3P}
#'
#' @examples
#' # Load a dataset
#' data(vulture_diet)
#' 
#' # View the structure
#' str(vulture_diet)
#' 
#' # Basic summary
#' summary(vulture_diet)
#' 
#' # See what datasets are available
#' data(package = "ecoteach")
#'
## usethis namespace: start
## usethis namespace: end
"_PACKAGE"
