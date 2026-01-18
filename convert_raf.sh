#!/bin/bash

# Script to convert RAF files to JPEG
# Usage: ./convert_raf.sh [input_directory] [output_directory]

INPUT_DIR="${1:-./images/archive photos}"
OUTPUT_DIR="${2:-./images/archive photos}"

# Create output directory if it doesn't exist
mkdir -p "$OUTPUT_DIR"

# Find all RAF files (case-insensitive)
find "$INPUT_DIR" -type f \( -iname "*.RAF" -o -iname "*.raf" \) | while read raf_file; do
    # Get filename without extension
    filename=$(basename "$raf_file")
    name_no_ext="${filename%.*}"
    
    # Output JPEG path
    output_file="$OUTPUT_DIR/${name_no_ext}.jpg"
    
    echo "Converting: $raf_file -> $output_file"
    
    # Convert using sips (macOS built-in tool)
    sips -s format jpeg -s formatOptions 90 "$raf_file" --out "$output_file"
    
    if [ $? -eq 0 ]; then
        echo "✓ Successfully converted: $output_file"
    else
        echo "✗ Failed to convert: $raf_file"
    fi
done

echo ""
echo "Conversion complete!"

