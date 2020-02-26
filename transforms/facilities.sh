#!/bin/bash

set -euo pipefail

response=$(curl -s "https://publicfiles.fcc.gov/api/service/facility/search/*.json")

for type in tv am fm; do
    facilities=$(echo $response | jq -r -c '.results.globalSearchResults.'$type'FacilityList[]')

    while IFS= read -r facility; do
        id=$(echo $facility | jq -r '.id')
        echo $facility > /tmp/$id'.json'
        tar -C /tmp -cvf - $id'.json' > $1
    done <<< "$facilities"
done

# cable systems
facilities=$(echo $response | jq -r -c '.results.globalSearchResults.cableSystemsList[]')

while IFS= read -r facility; do
    id=$(echo $facility | jq -r '.psid')
    echo $facility > /tmp/$id'.json'
    tar -C /tmp -cvf - $id'.json' > $1
done <<< "$facilities"

sleep 604800
