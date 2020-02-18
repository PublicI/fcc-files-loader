#!/bin/bash

# set -euo pipefail

for file in $1*.json; do
    id=$(basename $file .json)
    wget -q -N -P $2 "https://files.fcc.gov/download/"$id".pdf"
done
