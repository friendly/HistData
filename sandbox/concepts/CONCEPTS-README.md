# Adding @concept Tags to HistData Documentation

## Overview

I've analyzed all 34 datasets in your HistData package and identified statistical and graphical concepts that each dataset can be used to illustrate. These are provided in multiple formats for your review and editing.

## Files Provided

### 1. [dataset-concepts.md](computer:///mnt/user-data/outputs/dataset-concepts.md)
**Detailed narrative format** with descriptions and complete concept lists for each dataset.
- Organized by dataset
- Includes summary of concept categories
- Good for initial review and understanding

### 2. [dataset-concepts-structured.md](computer:///mnt/user-data/outputs/dataset-concepts-structured.md)  
**Structured format** ready for adding to documentation.
- Bullet lists per dataset
- Includes master alphabetical list of all concepts
- Notes for standardization decisions
- Easy to copy-paste from

### 3. [dataset-concepts.csv](computer:///mnt/user-data/outputs/dataset-concepts.csv)
**Spreadsheet format** for easy editing.
- Open in Excel, Numbers, or Google Sheets
- Edit concepts easily
- Add or remove columns as needed
- Good for team review

### 4. [add_concept_tags.R](computer:///mnt/user-data/outputs/add_concept_tags.R)
**Automation script** to add @concept tags to your data.R file.
- Reads the CSV file
- Finds each dataset's documentation
- Inserts @concept tags automatically
- Preserves all existing documentation

## Workflow

### Step 1: Review and Edit Concepts

Open `dataset-concepts.csv` in your preferred spreadsheet software:

```r
# Or view in R
concepts <- read.csv("dataset-concepts.csv")
View(concepts)
```

Edit the concepts:
- Add new concepts in empty columns
- Remove concepts you don't want
- Standardize terminology
- Fix any errors

### Step 2: Apply to Your Documentation

Once you're happy with the concepts:

```r
# Run the script
Rscript add_concept_tags.R dataset-concepts.csv data.R data-with-concepts.R
```

Or from within R:

```r
source("add_concept_tags.R")
add_all_concepts("dataset-concepts.csv", "data.R", "data-with-concepts.R")
```

### Step 3: Review the Output

The script creates a new file with @concept tags added. Check a few datasets to make sure it worked correctly:

```r
# View the changes for a specific dataset
lines <- readLines("data-with-concepts.R")
# Find Galton dataset
start <- grep("@name Galton", lines)
# Show surrounding lines
lines[(start-2):(start+15)]
```

## Example Output

For the Galton dataset, the script will add:

```r
#' @name Galton
#' @docType data
#' @concept regression
#' @concept correlation
#' @concept bivariate normal
#' @concept scatterplot
#' @concept data ellipse
#' @concept regression to mean
#' @concept heredity
```

## Concept Categories Identified

I identified concepts in several broad categories:

### Statistical Methods (44 concepts)
Including: regression, ANOVA, t-test, logistic regression, robust estimation, least squares, life tables, etc.

### Graphical Methods (39 concepts)  
Including: scatterplot, histogram, mosaic plot, coxcomb plot, choropleth map, sunflower plot, etc.

### Data Types (12 concepts)
Including: time series, spatial data, contingency table, dyadic data, etc.

### Domain-Specific (10 concepts)
Including: epidemiology, anthropometry, military statistics, astronomical data, etc.

## Notes and Decisions Needed

1. **Terminology Standardization**
   - Should "two-way ANOVA" be just "ANOVA"?
   - "Student's t" vs "t-test"?
   - Capitalization: "HE plot" vs "heplot"?

2. **Level of Specificity**
   - Include both general ("time series") and specific ("coxcomb plot")?
   - Include historical terms ("visualization history", "first statistical graph")?

3. **Multiple Related Concepts**
   - Many datasets have both "regression" and "correlation"
   - Some have method + visualization (e.g., "ANOVA" + "mosaic plot")

4. **Unique vs. Common Concepts**
   - Some concepts appear only once (e.g., "coxcomb plot" for Nightingale)
   - Others are very common (e.g., "time series" in 8 datasets)

## Statistics

- **Total datasets:** 34
- **Unique concepts:** ~105 (needs consolidation)
- **Concepts per dataset:** Range 3-10, average 5.5
- **Most common concepts:**
  - time series (8 datasets)
  - regression (7 datasets)
  - scatterplot (6 datasets)
  - mortality (5 datasets)

## Tips for Review

1. **Check Historical Datasets**
   - Arbuthnot, Galton, Nightingale, Snow are famous examples
   - Make sure their key contributions are captured

2. **Look for Missing Concepts**
   - Did I miss any important methods these illustrate?
   - Are there pedagogical uses not mentioned?

3. **Consider Your Audience**
   - What would students/researchers search for?
   - What indexing would be most useful?

4. **Test the Search**
   - Once added, users can find datasets by concept
   - Will `help.search("scatterplot")` return useful results?

## Next Steps

1. Review and edit `dataset-concepts.csv`
2. Run `add_concept_tags.R` to generate updated file
3. Review the output
4. Replace your data.R file
5. Rebuild documentation with roxygen2
6. Test with `help.search()` to verify concepts are indexed

## Questions?

Feel free to modify:
- The concepts themselves
- The script's insertion logic
- The format of the CSV
- Anything else!

The goal is to make your datasets more discoverable and to highlight the rich variety of statistical and graphical methods they illustrate.
