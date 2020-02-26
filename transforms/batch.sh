#!/bin/bash

set -euo pipefail

first=$(find $1 -name "*.pdf" | head -n 1)
dir=$(basename "$first" .pdf)
mkdir -p "$2$dir/"

for file in $1/*; do
  ln -s "$1$(basename "$file")" "$2$dir/$(basename "$file")"
done
