#' Helper functions for adding new datasets to ecoteach package
#' These functions automate the dataset preparation process

#' Create preparation script template
#' @param dataset_name Name for the dataset (will be used for filenames)
#' @param csv_filename Name of the CSV file in raw_data/
#' @param description Brief description of the dataset
#' @param doi DOI for the dataset
#' @param year Publication year
create_prep_script <- function(dataset_name, csv_filename, description, doi, year) {
  
  filename <- paste0("data-raw/prepare_", dataset_name, ".R")
  
  template <- paste0('
# Data preparation for ', description, '
# Source: [AUTHOR] et al. (', year, ') - Dryad repository  
# DOI: ', doi, '
# License: CC0 1.0 Universal
# Prepared: ', Sys.Date(), '

library(readr)
library(dplyr)
library(usethis)

# Read the raw data
raw_data <- read_csv("data-raw/raw_data/', csv_filename, '")

# Examine the data structure
cat("Original data structure:\\n")
str(raw_data)
cat("\\nFirst few rows:\\n")
head(raw_data)
cat("\\nUnique values in key columns:\\n")
# Add specific columns to check:
# sapply(raw_data[c("column1", "column2")], function(x) unique(x))

# Clean and prepare the data for package inclusion
', dataset_name, ' <- raw_data %>%
  # Convert categorical variables to factors
  mutate(
    # Add your factor conversions here
    # column_name = as.factor(column_name)
  ) %>%
  # Convert dates if needed
  # mutate(date_column = as.Date(date_column, format = "%d/%m/%Y")) %>%
  # Arrange logically
  arrange()  # Add appropriate columns

# Verify the cleaned data
cat("\\nCleaned data structure:\\n")
str(', dataset_name, ')

# Check for any missing values or issues
cat("\\nMissing values per column:\\n")
sapply(', dataset_name, ', function(x) sum(is.na(x)))

# Save to package data (compressed .rda format for CRAN)
usethis::use_data(', dataset_name, ', overwrite = TRUE)

cat("\\n✅ Dataset \'", dataset_name, "\' prepared and saved!\\n")
cat("Size of final dataset:", object.size(', dataset_name, '), "bytes\\n")
')
  
  writeLines(template, filename)
  cat("✅ Created preparation script:", filename, "\n")
  cat("📝 Edit this file to add your specific data cleaning steps\n")
}

#' Create documentation template
#' @param dataset_name Name for the dataset
#' @param description Brief description
#' @param doi DOI for the dataset
#' @param author_citation Full citation
create_doc_template <- function(dataset_name, description, doi, author_citation) {
  
  filename <- paste0("R/", dataset_name, ".R")
  
  template <- paste0("
#' ", description, "
#'
#' [ADD DETAILED DESCRIPTION HERE]
#'
#' @format A data frame with [X] rows and [Y] variables:
#' \\describe{
#'   \\item{column1}{Description of column 1}
#'   \\item{column2}{Description of column 2}
#'   [ADD ALL COLUMNS HERE]
#' }
#' @source ", author_citation, " 
#'   \\doi{", doi, "}
#' @examples
#' \\donttest{
#' # Load the dataset
#' data(", dataset_name, ")
#' 
#' # Basic exploration
#' head(", dataset_name, ")
#' summary(", dataset_name, ")
#' 
#' # Add relevant examples here
#' }
\"", dataset_name, "\"
")
  
  writeLines(template, filename)
  cat("✅ Created documentation template:", filename, "\n")
  cat("📝 Edit this file to add complete documentation\n")
}

#' Quick dataset setup - creates both template files
#' @param dataset_name Name for the dataset (use underscores, no spaces)
#' @param csv_filename Name of CSV file in raw_data/
#' @param description Brief description
#' @param doi DOI string
#' @param year Publication year
#' @param author_citation Full citation
quick_dataset_setup <- function(dataset_name, csv_filename, description, 
                                doi, year, author_citation) {
  cat("🚀 Setting up dataset:", dataset_name, "\n")
  create_prep_script(dataset_name, csv_filename, description, doi, year)
  create_doc_template(dataset_name, description, doi, author_citation)
  cat("\n📋 Next steps:\n")
  cat("1. Edit data-raw/prepare_", dataset_name, ".R\n", sep="")
  cat("2. Run: source('data-raw/prepare_", dataset_name, ".R')\n", sep="")
  cat("3. Edit R/", dataset_name, ".R\n", sep="")
  cat("4. Run: devtools::document()\n")
  cat("5. Test: data(", dataset_name, ")\n", sep="")
}

#' Parse BibTeX file to extract citation information
#' @param bib_filename Name of the .bib file in raw_data/
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
  
  # Extract common fields
  title <- extract_field("title", bib_text)
  author <- extract_field("author", bib_text)
  year <- extract_field("year", bib_text)
  doi <- extract_field("doi", bib_text)
  publisher <- extract_field("publisher", bib_text)
  
  # Clean up the extracted text (remove extra braces, clean formatting)
  clean_text <- function(text) {
    if (is.na(text)) return(text)
    # Remove extra braces and clean up
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

#' Enhanced dataset setup with automatic BibTeX parsing
#' @param dataset_name Name for the dataset (use underscores, no spaces)
#' @param csv_filename Name of CSV file in raw_data/
#' @param bib_filename Name of .bib file in raw_data/
auto_dataset_setup <- function(dataset_name, csv_filename, bib_filename) {
  cat("🚀 Setting up dataset:", dataset_name, "\n")
  cat("📖 Parsing BibTeX file:", bib_filename, "\n")
  
  # Parse the .bib file
  bib_info <- parse_bib_file(bib_filename)
  
  # Display extracted information
  cat("\n📋 Extracted citation information:\n")
  cat("Title:", bib_info$title, "\n")
  cat("Author:", bib_info$author, "\n")
  cat("Year:", bib_info$year, "\n")
  cat("DOI:", bib_info$doi, "\n")
  cat("Publisher:", bib_info$publisher, "\n\n")
  
  # Create short description from title
  description <- bib_info$title
  if (nchar(description) > 80) {
    description <- paste0(substr(description, 1, 77), "...")
  }
  
  # Format author citation
  author_citation <- paste0(bib_info$author, " (", bib_info$year, "). ", 
                            bib_info$title, ". ", bib_info$publisher, " Digital Repository.")
  
  # Create the files using the parsed information
  create_prep_script(dataset_name, csv_filename, description, bib_info$doi, bib_info$year)
  create_doc_template(dataset_name, description, bib_info$doi, author_citation)
  
  cat("📋 Next steps:\n")
  cat("1. Review and edit data-raw/prepare_", dataset_name, ".R\n", sep="")
  cat("2. Run: source('data-raw/prepare_", dataset_name, ".R')\n", sep="")
  cat("3. Review and edit R/", dataset_name, ".R\n", sep="")
  cat("4. Run: devtools::document()\n")
  cat("5. Test: data(", dataset_name, ")\n", sep="")
  
  return(bib_info)
}

#' Quick check of .bib file contents
#' @param bib_filename Name of .bib file in raw_data/
preview_bib <- function(bib_filename) {
  bib_info <- parse_bib_file(bib_filename)
  cat("📖 BibTeX Preview for:", bib_filename, "\n")
  cat("Title:", bib_info$title, "\n")
  cat("Author:", bib_info$author, "\n") 
  cat("Year:", bib_info$year, "\n")
  cat("DOI:", bib_info$doi, "\n")
  return(bib_info)
}