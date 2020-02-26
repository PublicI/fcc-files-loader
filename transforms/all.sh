#!/bin/bash

set -euo pipefail

mkdir -p ./data/facilities
mkdir -p ./data/files
mkdir -p ./data/download
mkdir -p ./data/batch
./transforms/facilities.sh ./data/facilities/
./transforms/files.sh ./data/facilities/ ./data/files/
./transforms/download.sh ./data/files/ ./data/download/
./transforms/batch.sh ./data/download ./data/batch/
