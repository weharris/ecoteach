# Complete helper to automate dataset addition with .bib file parsing

# Parse .bib file to extract citation info
parse_bib_file <- function(bib_filename) {
  bib_path <- paste0("data-raw/raw_data/", bib_filename)
  
  if (!file.exists(bib_path)) {
    stop("BibTeX file not found: ", bib_path)
  }
  
  # Read the .bib file
  bib_lines <- readLines(bib_path)
  bib_text <- paste(bib_lines, collapse = "\n")
  
  # Extract key information using regex
  extract_field <- function(field_name, text) {
    pattern <- paste0(field_name, "\\s*=\\s*\\{([^}]+)\\}")
    match <- regexpr(pattern, text, ignore.case = TRUE, perl = TRUE)
    if (match != -1) {
      start <- attr(match, "capture.start")
      length <- attr(match, "capture.length")
      return(substr(text, start, start + length - 1))
    }
    return(NA)
  }
  
  # Extract fields
  title <- extract_field("title", bib_text)
  author <- extract_field("author", bib_text)
  year <- extract_field("year", bib_text)
  doi <- extract_field("doi", bib_text)
  publisher <- extract_field("publisher", bib_text)
  
  # Clean up text
  clean_text <- function(text) {
    if (is.na(text)) return(text)
    text <- gsub("\\{|\\}", "", text)
    text <- gsub("\\s+", " ", text)
    text <- trimws(text)
    return(text)
  }
  
  return(list(
    title = clean_text(title),
    author = clean_text(author),
    year = clean_text(year),
    doi = clean_text(doi),
    publisher = clean_text(publisher)
  ))
}

# Main function - creates dataset with automatic .bib parsing
auto_dataset_setup <- function(dataset_name, csv_filename, bib_filename) {
  cat("🚀 Setting up dataset:", dataset_name, "\n")
  cat("📖 Parsing BibTeX file:", bib_filename, "\n")
  
  # Parse the .bib file
  bib_info <- parse_bib_file(bib_filename)
  
  # Show what was extracted
  cat("\n📋 Extracted citation information:\n")
  cat("Title:", bib_info$title, "\n")
  cat("Author:", bib_info$author, "\n")
  cat("Year:", bib_info$year, "\n")
  cat("DOI:", bib_info$doi, "\n")
  
  # Create preparation script
  prep_file <- paste0("data-raw/prepare_", dataset_name, ".R")
  prep_content <- paste0('# Data preparation for ', bib_info$title, '
# Source: ', bib_info$author, ' (', bib_info$year, ') - Dryad repository  
# DOI: ', bib_info$doi, '
# License: CC0 1.0 Universal

library(readr)
library(dplyr)
library(usethis)

# Read the raw data
raw_data <- read_csv("data-raw/raw_data/', csv_filename, '")

# Examine the data structure
cat("Original data structure:\\n")
str(raw_data)
head(raw_data)

# Check unique values in key columns
# sapply(raw_data[c("column1", "column2")], function(x) unique(x))

# Clean and prepare the data
', dataset_name, ' <- raw_data %>%
  # Add your factor conversions here
  # mutate(column_name = as.factor(column_name)) %>%
  arrange()  # Add appropriate sorting

# Check the cleaned data
str(', dataset_name, ')

# Save to package data
usethis::use_data(', dataset_name, ', overwrite = TRUE)
cat("✅ Dataset saved!\\n")
')
  writeLines(prep_content, prep_file)
  
  # Create documentation script
  doc_file <- paste0("R/", dataset_name, ".R")
  doc_content <- paste0('#\' ', bib_info$title, '
#\'
#\' [ADD DETAILED DESCRIPTION HERE]
#\'
#\' @format A data frame with [X] rows and [Y] variables:
#\' \\describe{
#\'   \\item{column1}{Description of column 1}
#\'   \\item{column2}{Description of column 2}
#\' }
#\' @source ', bib_info$author, ' (', bib_info$year, '). ', bib_info$title, '. 
#\'   ', bib_info$publisher, ' Digital Repository. \\doi{', bib_info$doi, '}
#\' @examples
#\' \\donttest{
#\' data(', dataset_name, ')
#\' head(', dataset_name, ')
#\' summary(', dataset_name, ')
#\' }
"', dataset_name, '"
')
  writeLines(doc_content, doc_file)
  
  cat("✅ Created preparation script:", prep_file, "\n")
  cat("✅ Created documentation script:", doc_file, "\n")
  cat("\n📋 Next steps:\n")
  cat("1. Edit", prep_file, "\n")
  cat("2. Run: source('", prep_file, "')\n")
  cat("3. Edit", doc_file, "\n")
  cat("4. Run: devtools::document()\n")
}

# Preview what's in a .bib file
preview_bib <- function(bib_filename) {
  bib_info <- parse_bib_file(bib_filename)
  cat("📖 BibTeX Preview:\n")
  cat("Title:", bib_info$title, "\n")
  cat("Author:", bib_info$author, "\n")
  cat("Year:", bib_info$year, "\n")
  cat("DOI:", bib_info$doi, "\n")
}