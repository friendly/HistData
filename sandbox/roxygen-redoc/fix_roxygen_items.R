#!/usr/bin/env Rscript

# Fix roxygen2 \item formatting
# Changes \item{list("VarName")} to \item{\code{VarName}}
# 
# Usage:
#   From R: source("fix_roxygen_items.R"); fix_roxygen_items("R/data.R")
#   From command line: Rscript fix_roxygen_items.R R/data.R

fix_roxygen_items <- function(file_path, output_path = NULL, verbose = TRUE) {
  # If no output path specified, overwrite the input file
  if (is.null(output_path)) {
    output_path <- file_path
  }
  
  # Read the file
  if (!file.exists(file_path)) {
    stop(sprintf("File not found: %s", file_path))
  }
  
  lines <- readLines(file_path, warn = FALSE)
  
  # Replace pattern: \item{list("VarName")} with \item{\code{VarName}}
  # The pattern matches:
  #   \\item\{list\(" - literal \item{list("
  #   ([^"]*) - capture group: any characters except quotes (the variable name)
  #   "\)\} - literal ")}
  fixed_lines <- gsub('\\\\item\\{list\\("([^"]*)"\\)\\}', 
                      '\\\\item{\\\\code{\\1}}', 
                      lines)
  
  # Write the fixed content
  writeLines(fixed_lines, output_path)
  
  # Report changes
  n_changes <- sum(lines != fixed_lines)
  if (verbose) {
    cat(sprintf("Fixed %d lines in %s\n", n_changes, file_path))
    if (!is.null(output_path) && output_path != file_path) {
      cat(sprintf("Output written to %s\n", output_path))
    }
  }
  
  invisible(n_changes)
}

# Batch process multiple files
fix_all_roxygen_files <- function(directory = "R", pattern = "\\.R$", 
                                   recursive = FALSE, verbose = TRUE) {
  files <- list.files(directory, pattern = pattern, 
                     full.names = TRUE, recursive = recursive)
  
  if (length(files) == 0) {
    cat(sprintf("No files matching pattern '%s' found in %s\n", pattern, directory))
    return(invisible(NULL))
  }
  
  results <- sapply(files, function(f) {
    if (verbose) {
      cat(sprintf("\nProcessing %s...\n", f))
    }
    fix_roxygen_items(f, verbose = verbose)
  })
  
  if (verbose) {
    cat(sprintf("\n=================================\n"))
    cat(sprintf("Total files processed: %d\n", length(files)))
    cat(sprintf("Total lines changed: %d\n", sum(results)))
  }
  
  invisible(results)
}

# Command-line interface
if (!interactive()) {
  args <- commandArgs(trailingOnly = TRUE)
  
  if (length(args) == 0) {
    cat("Usage: Rscript fix_roxygen_items.R <input_file> [output_file]\n")
    cat("       Rscript fix_roxygen_items.R --dir <directory> [--pattern <pattern>]\n\n")
    cat("Options:\n")
    cat("  input_file        Path to the R file to fix\n")
    cat("  output_file       Optional output path (default: overwrites input)\n")
    cat("  --dir             Process all files in directory\n")
    cat("  --pattern         File pattern (default: '\\\\.R$')\n\n")
    cat("Examples:\n")
    cat("  Rscript fix_roxygen_items.R R/data.R\n")
    cat("  Rscript fix_roxygen_items.R R/data.R R/data_fixed.R\n")
    cat("  Rscript fix_roxygen_items.R --dir R\n")
    cat("  Rscript fix_roxygen_items.R --dir R --pattern 'data.*\\\\.R$'\n")
    quit(status = 1)
  }
  
  # Check for directory mode
  if (args[1] == "--dir") {
    if (length(args) < 2) {
      cat("Error: --dir requires a directory path\n")
      quit(status = 1)
    }
    
    directory <- args[2]
    pattern <- "\\.R$"
    
    # Check for pattern argument
    if (length(args) >= 4 && args[3] == "--pattern") {
      pattern <- args[4]
    }
    
    if (!dir.exists(directory)) {
      cat(sprintf("Error: Directory '%s' not found\n", directory))
      quit(status = 1)
    }
    
    fix_all_roxygen_files(directory, pattern)
    
  } else {
    # Single file mode
    input_file <- args[1]
    output_file <- if (length(args) > 1) args[2] else NULL
    
    if (!file.exists(input_file)) {
      cat(sprintf("Error: File '%s' not found\n", input_file))
      quit(status = 1)
    }
    
    fix_roxygen_items(input_file, output_file)
  }
}
