#!/bin/bash
# Fix roxygen2 \item formatting using sed
# Changes \item{list("VarName")} to \item{\code{VarName}}

if [ $# -eq 0 ]; then
    echo "Usage: $0 <input_file> [output_file]"
    echo "  If output_file is not specified, input_file will be overwritten"
    exit 1
fi

input_file="$1"
output_file="${2:-$input_file}"

if [ ! -f "$input_file" ]; then
    echo "Error: File '$input_file' not found"
    exit 1
fi

# Apply the sed substitution
sed -E 's/\\item\{list\("([^"]*)"\)\}/\\item{\\code{\1}}/g' "$input_file" > "$output_file.tmp"

# Move temp file to output
mv "$output_file.tmp" "$output_file"

echo "Fixed items in $input_file"
if [ "$output_file" != "$input_file" ]; then
    echo "Output written to $output_file"
fi
