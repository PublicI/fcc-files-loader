#!/bin/bash

set -euo pipefail

response=$(curl -s "https://publicfiles.fcc.gov/api/service/facility/search/*.json")

for type in tvFacility amFacility fmFacility cableSystems; do
    facilities=$(echo $response | jq -r -c '.results.globalSearchResults.'$type'List[]')

    while IFS= read -r facility; do
        id=$(echo $facility | jq -r '.id')
        echo $facility > $1'/'$id'.json'
    done <<< "$facilities"
done
