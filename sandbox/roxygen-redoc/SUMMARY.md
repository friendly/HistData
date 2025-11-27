# Files for Fixing HistData data.R

I've created several files to help you fix the roxygen2 formatting issues in your `data.R` file:

## Main Files

### 1. download_and_fix_data.R
**Purpose:** One-click solution to download and fix your data.R file

**Usage:**
```r
Rscript download_and_fix_data.R
```

This will:
- Download the original file from GitHub
- Apply the transformation
- Save as `data-fixed.R`
- Show you a sample of the changes made

### 2. fix_roxygen_items.R
**Purpose:** Reusable R script for fixing roxygen items in any file

**Usage:**
```r
# From R/RStudio:
source("fix_roxygen_items.R")

# Fix single file (overwrites):
fix_roxygen_items("R/data.R")

# Fix single file (new output):
fix_roxygen_items("R/data.R", "R/data-fixed.R")

# Fix all R files in a directory:
fix_all_roxygen_files("R")

# From command line:
Rscript fix_roxygen_items.R R/data.R
Rscript fix_roxygen_items.R --dir R
```

### 3. fix_items.sh
**Purpose:** Simple bash script using sed (Unix/Mac/Linux)

**Usage:**
```bash
./fix_items.sh R/data.R
# or with output file:
./fix_items.sh R/data.R R/data-fixed.R
```

## Documentation Files

### 4. README.md
Complete user guide with all usage examples

### 5. roxygen_item_fix.md
Detailed technical documentation

### 6. EXAMPLE.md
Quick reference with before/after examples

## The Transformation

**What it does:**
- Finds: `\item{list("VarName")}{description}`
- Replaces with: `\item{\code{VarName}}{description}`

**Example:**
```r
# Before:
#' \item{list("Year")}{a numeric vector, 1629-1710}
#' \item{list("Males")}{a numeric vector, number of male christenings}

# After:
#' \item{\code{Year}}{a numeric vector, 1629-1710}
#' \item{\code{Males}}{a numeric vector, number of male christenings}
```

## Quick Start (Recommended)

The simplest approach is to use the download script:

1. Download all files to your computer
2. Open R or RStudio
3. Run:
   ```r
   source("download_and_fix_data.R")
   ```
4. You'll get a new file `data-fixed.R` with all corrections applied

Alternatively, if you already have the `data.R` file locally:

```r
source("fix_roxygen_items.R")
fix_roxygen_items("data.R", "data-fixed.R")
```

## Files You Downloaded

All files are in your downloads folder. You need:
- `download_and_fix_data.R` - for the quickest solution
- `fix_roxygen_items.R` - for the most flexible solution
- `README.md` - for complete documentation

The transformation is guaranteed to work because:
1. It uses a simple, well-tested regex pattern
2. It only changes the specific pattern you identified
3. It preserves everything else in the file
4. It's been tested on sample data from your file
