#!/bin/bash

set -euo pipefail

mkdir -p ./data/facilities
mkdir -p ./data/list
./transforms/facilities.sh ./data/facilities/
./transforms/list.sh ./data/facilities/ ./data/list/
