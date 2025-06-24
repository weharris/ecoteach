#' Habitat Occupancy of the Critically Endangered Chinese Pangolin
#'
#' A dataset containing habitat occupancy observations of the Critically Endangered Chinese pangolin 
#' (\emph{Manis pentadactyla}) in the urban landscape of Dharan Sub-metropolitan City, Nepal. 
#' The data were collected to analyze spatial distribution, habitat use patterns, and anthropogenic 
#' impacts on habitat occupancy of Chinese pangolins. The study used a single-season occupancy 
#' modeling approach, investigating factors influencing detection probability and habitat occupancy 
#' across 134 grid cells of 600m × 600m each.
#' 
#' The dataset is particularly valuable for teaching concepts in wildlife conservation, occupancy 
#' modeling, and human-wildlife interactions in urban environments. It demonstrates how ecological 
#' and anthropogenic factors affect endangered species in human-dominated landscapes.
#'
#' @format A data frame with 152 rows and 18 variables:
#' \describe{
#'   \item{object_id}{Unique identifier for each grid cell}
#'   \item{replicate_1}{Detection (1) or non-detection (0) in first survey replicate}
#'   \item{replicate_2}{Detection (1) or non-detection (0) in second survey replicate}
#'   \item{replicate_3}{Detection (1) or non-detection (0) in third survey replicate}
#'   \item{replicate_4}{Detection (1) or non-detection (0) in fourth survey replicate}
#'   \item{replicate_5}{Detection (1) or non-detection (0) in fifth survey replicate}
#'   \item{replicate_6}{Detection (1) or non-detection (0) in sixth survey replicate}
#'   \item{distance_to_water}{Distance to nearest water body in meters}
#'   \item{terrain_ruggedness}{Terrain Ruggedness Index (TRI), a measure of topographic heterogeneity}
#'   \item{mean_ndvi}{Mean Normalized Difference Vegetation Index, a measure of vegetation density}
#'   \item{habitat_type}{Type of habitat: "Sal Forest", "Mixed Forest", "Human Settlement", or "Agricultural Land"}
#'   \item{habitat_structure}{Topographic structure: "Terrace" or "Cliff"}
#'   \item{human_disturbance_index}{Index of human disturbance, ranging from 0 (low) to 1 (high)}
#'   \item{termite_mounds}{Number of termite mounds in the grid cell}
#'   \item{detection_sum}{Total number of detections across all six replicates}
#'   \item{detected}{Binary indicator of whether pangolin was detected (1) or not (0) in any replicate}
#'   \item{disturbance_level}{Categorized human disturbance: "Low", "Medium-Low", "Medium-High", or "High"}
#' }
#' @source Subba, Asmit and Tamang, Ganesh and Lama, Sony and Basnet, Nabin and Kyes, Randall C. and Khanal, Laxman (2024). 
#'   Habitat occupancy of the critically endangered Chinese pangolin (\emph{Manis pentadactyla}) under human disturbance 
#'   in an urban environment: Implications for conservation. Dryad Digital Repository. 
#'   \doi{10.5061/DRYAD.73N5TB34T}
#' @examples
#' \donttest{
#' # Load the dataset
#' data(pangolin_habitat)
#' 
#' # Basic exploration
#' head(pangolin_habitat)
#' summary(pangolin_habitat)
#' 
#' # Examine detection rates across habitat types
#' table(pangolin_habitat$habitat_type, pangolin_habitat$detected)
#' 
#' # Visualize the relationship between termite mounds and pangolin detection
#' boxplot(termite_mounds ~ detected, data = pangolin_habitat,
#'         main = "Termite Mounds and Pangolin Detection",
#'         xlab = "Pangolin Detected", ylab = "Number of Termite Mounds",
#'         names = c("Not Detected", "Detected"))
#'         
#' # Examine the effect of human disturbance on pangolin detection
#' boxplot(human_disturbance_index ~ detected, data = pangolin_habitat,
#'         main = "Human Disturbance and Pangolin Detection",
#'         xlab = "Pangolin Detected", ylab = "Human Disturbance Index",
#'         names = c("Not Detected", "Detected"))
#'         
#' # Visualize detection across disturbance levels
#' barplot(prop.table(table(pangolin_habitat$disturbance_level, 
#'                          pangolin_habitat$detected), 1)[,2],
#'         main = "Pangolin Detection Rate by Disturbance Level",
#'         xlab = "Disturbance Level", ylab = "Detection Rate")
#' }
"pangolin_habitat"

