# Adding New Datasets to ecoteach Package

## Quick Workflow

### 1. Prepare Files
Copy to `data-raw/raw_data/`:
- `dataset.csv` (your data file)
- `dataset.bib` (citation file)
- `dataset.txt` (optional description of data) 

### 2. Run Automation
```r
source("data-raw/dataset_helper.R")
auto_dataset_setup("dataset_name", "file.csv", "file.bib")
```

### 3. Customize Preparation Script
Edit `data-raw/prepare_dataset_name.R`:
- Check unique values: `unique(raw_data$column_name)`
- Add factor conversions
- Add date formatting if needed
- Add any data cleaning steps

### 4. Run Preparation
```r
source("data-raw/prepare_dataset_name.R")
```

### 5. Complete Documentation
Edit `R/dataset_name.R`:
- Add detailed description
- List all variables with descriptions
- Add meaningful examples

### 6. Generate and Test
```r
devtools::document()
data(dataset_name)
head(dataset_name)
devtools::check()
```

### 7. Commit
```r
git add .
git commit -m "Add dataset_name dataset"
git push
```

## That's It!

**Time per dataset:** ~10-15 minutes

**Requirements:**
- CSV file with clean data
- BibTeX file with citation
- Files must be CC0 or compatible license
- Individual datasets <5MB

## Helper Functions

- `preview_bib("file.bib")` - Check citation extraction
- `auto_dataset_setup()` - Full automated setup
- `quick_dataset_setup()` - Manual citation entry