#!/bin/bash

# This script is vibe coded. Needs imagemagick in path to work.

SUPPORTED_EXTENSIONS="png|jpg|jpeg"

convert_image() {
  local file="$1"
  local ext="${file##*.}"
  local ext_lc=$(echo "$ext" | tr '[:upper:]' '[:lower:]')

  if [[ "$ext_lc" == "webp" ]]; then
    return
  fi

  if [[ "$ext_lc" =~ ^($SUPPORTED_EXTENSIONS)$ ]]; then
    local base="${file%.*}"
    local output="${base}.webp"

    if magick "$file" "$output"; then
      echo "Converted: $file -> $output"
      rm "$file"
      echo "Deleted original: $file"
    else
      echo "Failed to convert: $file" >&2
    fi
  fi
}

if [ -z "$1" ]; then
  echo "Usage: $0 <path-to-file-or-folder>"
  exit 1
fi

TARGET="$1"

if [ -d "$TARGET" ]; then
  find "$TARGET" -type f | while read -r file; do
    convert_image "$file"
  done
elif [ -f "$TARGET" ]; then
  convert_image "$TARGET"
else
  echo "Error: '$TARGET' is not a valid file or directory."
  exit 1
fi 
