#!/usr/bin/env Rscript

# Script to add @concept tags to data.R documentation
# 
# This script reads a CSV file with dataset concepts and adds
# @concept tags to the roxygen documentation in data.R
#
# Usage:
#   Rscript add_concept_tags.R dataset-concepts.csv data.R data-with-concepts.R

# Function to add concept tags to a dataset's documentation
add_concepts <- function(lines, dataset_name, concepts) {
  
  # Find the @name tag for this dataset
  name_pattern <- paste0("#' @name ", dataset_name, "\\b")
  name_index <- grep(name_pattern, lines)
  
  if (length(name_index) == 0) {
    warning(sprintf("Dataset '%s' not found", dataset_name))
    return(lines)
  }
  
  # Find where to insert the @concept tags
  # Look for @keywords or @examples after @name
  insert_after <- name_index[1]
  
  # Find the next roxygen block or NULL
  next_sections <- grep("#' @(keywords|examples|seealso|references|source)", 
                       lines[insert_after:length(lines)])
  
  if (length(next_sections) > 0) {
    insert_after <- insert_after + next_sections[1] - 2
  } else {
    # Insert before NULL if no other tags found
    null_index <- grep("^NULL", lines[insert_after:length(lines)])
    if (length(null_index) > 0) {
      insert_after <- insert_after + null_index[1] - 2
    }
  }
  
  # Create concept tag lines
  concept_lines <- sprintf("#' @concept %s", concepts)
  
  # Insert the concept tags
  if (insert_after < length(lines)) {
    lines <- c(lines[1:insert_after],
               concept_lines,
               lines[(insert_after + 1):length(lines)])
  } else {
    lines <- c(lines, concept_lines)
  }
  
  return(lines)
}

# Main function
add_all_concepts <- function(csv_file, input_file, output_file) {
  
  # Read the CSV file with concepts
  concepts_df <- read.csv(csv_file, stringsAsFactors = FALSE)
  
  # Read the R file
  lines <- readLines(input_file, warn = FALSE)
  
  cat(sprintf("Processing %d datasets\n", nrow(concepts_df)))
  
  # Process each dataset
  for (i in 1:nrow(concepts_df)) {
    dataset <- concepts_df$Dataset[i]
    # cat(paste("processing", dataset, "\n"))
    
    # Get non-empty concepts for this dataset
    concepts <- concepts_df[i, -1]  # All columns except Dataset
    concepts <- concepts[concepts != "" & !is.na(concepts)]
    concepts <- unlist(concepts)
    
    if (length(concepts) > 0) {
      cat(sprintf("Adding %d concepts to %s\n", length(concepts), dataset))
      lines <- add_concepts(lines, dataset, concepts)
    }
  }
  
  # Write the output
  writeLines(lines, output_file)
  cat(sprintf("\nWrote output to %s\n", output_file))
  
  invisible(NULL)
}

# Command line interface
if (!interactive()) {
  args <- commandArgs(trailingOnly = TRUE)
  
  if (length(args) < 3) {
    cat("Usage: Rscript add_concept_tags.R <concepts.csv> <input.R> <output.R>\n\n")
    cat("Example:\n")
    cat("  Rscript add_concept_tags.R dataset-concepts.csv data.R data-with-concepts.R\n\n")
    cat("The CSV file should have columns: Dataset, Concept1, Concept2, ...\n")
    quit(status = 1)
  }
  
  csv_file <- args[1]
  input_file <- args[2]
  output_file <- args[3]
  
  if (!file.exists(csv_file)) {
    cat(sprintf("Error: CSV file '%s' not found\n", csv_file))
    quit(status = 1)
  }
  
  if (!file.exists(input_file)) {
    cat(sprintf("Error: Input file '%s' not found\n", input_file))
    quit(status = 1)
  }
  
  add_all_concepts(csv_file, input_file, output_file)
}

# If sourced, provide the function for interactive use
if (interactive()) {
  cat("Functions loaded:\n")
  cat("  add_all_concepts(csv_file, input_file, output_file)\n")
  cat("\nExample:\n")
  cat("  add_all_concepts('dataset-concepts.csv', 'data.R', 'data-with-concepts.R')\n")
}

csv_file <- here::here("sandbox", "concepts", 'dataset-concepts.csv')
data_file <- here::here("R", "data.R")
out_file <- here::here("R", "data-concepts.R")

add_all_concepts(csv_file, data_file, out_file)
