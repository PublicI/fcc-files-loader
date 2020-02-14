#!/bin/bash

set -euo pipefail

for file in $1/*.json; do
    id=$(echo $file | tr -dc '0-9')
    echo $id
    curl -s 'https://publicfiles.fcc.gov/api/manager/search/key/Political.json?entityId='$id > $2/$id.json
    sleep 2
done

# START=0
# END=75000
# while [  $START -lt $end ]; do
#     echo $START
#     response=$(curl -s 'https://www.fcc.gov/search/api/?t=opif&q=&s='$START'&o=new&f=\[\{%22political_file_type%22:%22PA%22\},\{%22political_file_type%22:%22NCIA%22\}\]')
#     docs=$(echo $response | jq -r -c '.response.docs[]')
#     while IFS= read -r doc; do
#         id=$(echo $doc | jq -r '.id')
#         echo $doc > $1'/'$id'.json'
#     done <<< "$docs"
#     sleep 2
#     let START=START+10
# done
