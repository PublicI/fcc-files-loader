#!/bin/bash

set -euo pipefail

mkdir -p ./data/facilities
mkdir -p ./data/files
# ./transforms/facilities.sh ./data/facilities/
./transforms/files.sh ./data/facilities/ ./data/files/
