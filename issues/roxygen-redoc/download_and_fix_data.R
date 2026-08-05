#!/usr/bin/env Rscript

# Script to download and fix the HistData data.R file
# This script will:
# 1. Download the original file from GitHub
# 2. Apply the \item{list("VarName")} -> \item{\code{VarName}} transformation
# 3. Save the result as data-fixed.R

# URL of the original file
url <- "https://raw.githubusercontent.com/friendly/HistData/refs/heads/rd2roxygen/R/data.R"

cat("Downloading data.R from GitHub...\n")

# Download the file
tryCatch({
  lines <- readLines(url, warn = FALSE)
  cat(sprintf("Downloaded %d lines\n", length(lines)))
  
  # Apply the transformation
  cat("Applying transformation...\n")
  fixed_lines <- gsub('\\\\item\\{list\\("([^"]*)"\\)\\}', 
                      '\\\\item{\\\\code{\\1}}', 
                      lines)
  
  # Count changes
  n_changes <- sum(lines != fixed_lines)
  cat(sprintf("Fixed %d lines\n", n_changes))
  
  # Save to file
  output_file <- "data-fixed.R"
  writeLines(fixed_lines, output_file)
  cat(sprintf("Saved to %s\n", output_file))
  
  # Show a sample of changes
  cat("\nSample of changes:\n")
  cat("==================\n")
  changed_indices <- which(lines != fixed_lines)[1:3]
  for (i in changed_indices) {
    if (!is.na(i)) {
      cat(sprintf("\nLine %d:\n", i))
      cat("BEFORE: ", lines[i], "\n")
      cat("AFTER:  ", fixed_lines[i], "\n")
    }
  }
  
}, error = function(e) {
  cat(sprintf("Error: %s\n", e$message))
  cat("\nIf download fails, you can manually download the file and then run:\n")
  cat("source('fix_roxygen_items.R')\n")
  cat("fix_roxygen_items('data.R', 'data-fixed.R')\n")
})
