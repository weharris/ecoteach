#' Simple Shannon Diversity Calculator
#'
#' @param counts Numeric vector of species counts
#' @return Shannon diversity index
#' @export
#' @examples
#' shannon_diversity(c(10, 15, 8, 12, 5))
shannon_diversity <- function(counts) {
  counts <- counts[counts > 0]
  if (length(counts) == 0) return(0)
  p <- counts / sum(counts)
  -sum(p * log(p))
}
