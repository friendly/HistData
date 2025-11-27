# Roxygen2 Item Formatter

Tools to fix roxygen2 `\item` formatting issues created by `rd2roxygen` package.

## Problem

The `rd2roxygen` package converts:
- **From:** `\item{VarName}{description}`  
- **To:** `\item{list("VarName")}{description}` ❌

But the correct roxygen2 format should be:
- **Correct:** `\item{\code{VarName}}{description}` ✅

## Files Included

1. **fix_roxygen_items.R** - Main R script with full functionality
2. **fix_items.sh** - Simple bash/sed script for Unix systems  
3. **roxygen_item_fix.md** - Detailed documentation
4. **EXAMPLE.md** - Quick examples with before/after

## Quick Start

### Method 1: R Script (Recommended)

```r
# In R or RStudio:
source("fix_roxygen_items.R")
fix_roxygen_items("R/data.R")  # Fix one file

# Or from command line:
Rscript fix_roxygen_items.R R/data.R
```

### Method 2: Bash Script (Unix/Mac/Linux)

```bash
./fix_items.sh R/data.R
```

### Method 3: One-liner with sed

```bash
sed -i.bak -E 's/\\item\{list\("([^"]*)"\)\}/\\item{\\code{\1}}/g' R/data.R
```

## Detailed Usage

### R Script Options

```r
# Fix single file (overwrites original)
fix_roxygen_items("R/data.R")

# Fix single file (save to new file)
fix_roxygen_items("R/data.R", "R/data_fixed.R")

# Fix all R files in directory
fix_all_roxygen_files("R")

# Fix with custom pattern
fix_all_roxygen_files("R", pattern = "data.*\\.R$")
```

### Command Line Options

```bash
# Single file
Rscript fix_roxygen_items.R R/data.R
Rscript fix_roxygen_items.R R/data.R R/data_fixed.R

# Directory
Rscript fix_roxygen_items.R --dir R
Rscript fix_roxygen_items.R --dir R --pattern "data.*\\.R$"
```

## Example Transformation

**Before:**
```r
#' \item{list("Year")}{a numeric vector, 1629-1710}
#' \item{list("Males")}{a numeric vector, number of male christenings}
```

**After:**
```r
#' \item{\code{Year}}{a numeric vector, 1629-1710}
#' \item{\code{Males}}{a numeric vector, number of male christenings}
```

## How It Works

The scripts use a regular expression to find and replace:
- **Pattern:** `\\item\{list\("([^"]*)"\)\}`
- **Replacement:** `\\item{\\code{\1}}`

Where `\1` captures the variable name between the quotes.

## Platform Compatibility

- **R script:** Works on all platforms (Windows, Mac, Linux)
- **Bash script:** Unix/Mac/Linux/WSL only
- **sed one-liner:** Unix/Mac/Linux/Git Bash

## Notes

- The R script creates a backup implicitly (you can specify output file)
- The sed command with `-i.bak` creates a `.bak` backup file
- All scripts preserve the original file structure and comments
- The transformation only affects `\item{list("...")}` patterns

## Author

Created for the HistData package to fix roxygen2 documentation issues.
