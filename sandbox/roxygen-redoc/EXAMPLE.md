## Example: Before and After Transformation

### Input (before):
```r
#' @format A data frame with 82 observations on the following 7 variables.
#' \describe{ 
#' \item{list("Year")}{a numeric vector, 1629-1710}
#' \item{list("Males")}{a numeric vector, number of male christenings}
#' \item{list("Females")}{a numeric vector, number of female christenings}
#' \item{list("Plague")}{a numeric vector, number of deaths from plague}
#' \item{list("Mortality")}{a numeric vector, total mortality}
#' \item{list("Ratio")}{a numeric vector, ratio of Males/Females}
#' \item{list("Total")}{a numeric vector, total christenings in London (000s)}
#' }
```

### Output (after):
```r
#' @format A data frame with 82 observations on the following 7 variables.
#' \describe{ 
#' \item{\code{Year}}{a numeric vector, 1629-1710}
#' \item{\code{Males}}{a numeric vector, number of male christenings}
#' \item{\code{Females}}{a numeric vector, number of female christenings}
#' \item{\code{Plague}}{a numeric vector, number of deaths from plague}
#' \item{\code{Mortality}}{a numeric vector, total mortality}
#' \item{\code{Ratio}}{a numeric vector, ratio of Males/Females}
#' \item{\code{Total}}{a numeric vector, total christenings in London (000s)}
#' }
```

### Quick Usage:

#### Option 1: Using R
```r
# Source the function
source("fix_roxygen_items.R")

# Fix a single file (overwrites original)
fix_roxygen_items("R/data.R")

# Fix a single file (create new file)
fix_roxygen_items("R/data.R", "R/data_fixed.R")

# Fix all R files in a directory
fix_all_roxygen_files("R")
```

#### Option 2: Using command line
```bash
# Fix a single file (overwrites)
Rscript fix_roxygen_items.R R/data.R

# Fix a single file (create new)
Rscript fix_roxygen_items.R R/data.R R/data_fixed.R

# Fix all files in directory
Rscript fix_roxygen_items.R --dir R
```

#### Option 3: Using sed (Unix/Mac/Linux)
```bash
# Create backup and fix in place
sed -i.bak -E 's/\\item\{list\("([^"]*)"\)\}/\\item{\\code{\1}}/g' R/data.R

# Or use the shell script
./fix_items.sh R/data.R
```
