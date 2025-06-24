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
#'   \item \code{\link{berberis_treatment}}: Data on invasive Berberis management treatments
#'   \item \code{\link{magellanic_penguins}}: Long-term monitoring data on Magellanic penguins
#'   \item \code{\link{vulture_diet}}: Diet composition analysis of African vultures
#'   \item \code{\link{chimpanzee_cameras}}: Camera trap detection data for wild chimpanzees
#'   \item \code{\link{lion_reproduction}}: Reproductive data for Galapagos sea lions
#'   \item \code{\link{simple_data}}: A simple example dataset for teaching purposes
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
#' \doi{10.5061/dryad.7wm37pvz7}
#'
#' Baino, A., Hopcraft, G., Kendall, C., Munishi, L., Behdenna, A., & Newton, J. (2021). 
#' We are what we eat, plus some per mill: Using stable isotopes to estimate diet composition of African vultures.
#' \doi{10.5061/dryad.1ns1rn8qf}
#'
#' Crunchant, A-S., Borchers, D., Kuehl, H., & Piel, A. K. (2020). 
#' Listening and watching: do camera traps or acoustic sensors more efficiently detect wild chimpanzees in an open habitat?
#' \doi{10.5061/dryad.5dv41ns34}
#'
#' Kalberer, S., Meise, K., Trillmich, F., & Krüger, O. (2018).
#' Reproductive performance of a tropical apex predator in an unpredictable habitat.
#' \doi{10.5061/DRYAD.6S48579}
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
