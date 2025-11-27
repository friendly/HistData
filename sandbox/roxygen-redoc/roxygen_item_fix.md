# Fixing Roxygen2 \item Formatting

## Problem
The `rd2roxygen` package converts `\item{VarName}` to `\item{list("VarName")}`, but the correct roxygen2 format should be `\item{\code{VarName}}`.

## Solutions

### Solution 1: R Script

```r
#!/usr/bin/env Rscript

# Fix roxygen2 \item formatting
# Changes \item{list("VarName")} to \item{\code{VarName}}

fix_roxygen_items <- function(file_path, output_path = NULL) {
  # If no output path specified, overwrite the input file
  if (is.null(output_path)) {
    output_path <- file_path
  }
  
  # Read the file
  lines <- readLines(file_path, warn = FALSE)
  
  # Replace pattern: \item{list("VarName")} with \item{\code{VarName}}
  fixed_lines <- gsub('\\\\item\\{list\\("([^"]*)"\\)\\}', 
                      '\\\\item{\\\\code{\\1}}', 
                      lines)
  
  # Write the fixed content
  writeLines(fixed_lines, output_path)
  
  # Report changes
  n_changes <- sum(lines != fixed_lines)
  cat(sprintf("Fixed %d lines in %s\n", n_changes, file_path))
  if (!is.null(output_path) && output_path != file_path) {
    cat(sprintf("Output written to %s\n", output_path))
  }
  
  invisible(n_changes)
}

# Usage examples:
# From within R:
#   source("fix_roxygen_items.R")
#   fix_roxygen_items("R/data.R")  # overwrites file
#   fix_roxygen_items("R/data.R", "R/data_fixed.R")  # creates new file

# From command line:
#   Rscript fix_roxygen_items.R R/data.R
#   Rscript fix_roxygen_items.R R/data.R R/data_fixed.R
```

### Solution 2: Using sed (Unix/Linux/Mac)

```bash
#!/bin/bash
# One-liner to fix in place:
sed -i.bak -E 's/\\item\{list\("([^"]*)"\)\}/\\item{\\code{\1}}/g' R/data.R

# Or create a new file:
sed -E 's/\\item\{list\("([^"]*)"\)\}/\\item{\\code{\1}}/g' R/data.R > R/data_fixed.R
```

For Windows (using Git Bash or similar):
```bash
sed -E 's/\\item\{list\("([^"]*)"\)\}/\\item{\\code{\1}}/g' R/data.R > R/data_fixed.R
```

### Solution 3: Batch Processing Multiple Files

```r
# Fix all R files in a directory
fix_all_roxygen_files <- function(directory = "R", pattern = "\\.R$") {
  files <- list.files(directory, pattern = pattern, full.names = TRUE)
  
  results <- sapply(files, function(f) {
    cat(sprintf("\nProcessing %s...\n", f))
    fix_roxygen_items(f)
  })
  
  cat(sprintf("\n\nTotal files processed: %d\n", length(files)))
  cat(sprintf("Total lines changed: %d\n", sum(results)))
  
  invisible(results)
}

# Usage:
# fix_all_roxygen_files("R")
```

## Pattern Explanation

The regex pattern matches:
- `\\item\{list\(` - Literal text `\item{list(`
- `"([^"]*)"` - Captures the variable name between quotes
- `\)\}` - Literal text `)}`

And replaces with:
- `\\item{\\code{\1}}` - Where `\1` is the captured variable name

## Examples

### Before:
```r
#' \item{list("Year")}{a numeric vector, 1629-1710}
#' \item{list("Males")}{a numeric vector, number of male christenings}
#' \item{list("Females")}{a numeric vector, number of female christenings}
```

### After:
```r
#' \item{\code{Year}}{a numeric vector, 1629-1710}
#' \item{\code{Males}}{a numeric vector, number of male christenings}
#' \item{\code{Females}}{a numeric vector, number of female christenings}
```
