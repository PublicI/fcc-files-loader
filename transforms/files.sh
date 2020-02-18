#!/bin/bash

set -euo pipefail

for file in $1/*.json; do
    id=$(basename $file .json)
    echo $id
    response=$(curl -s "https://publicfiles.fcc.gov/api/manager/search/key/Political.json?entityId="$id)
    files=$(echo $response | jq -r -c '.searchResult.files[]')

    while IFS= read -r file; do
        id=$(echo $file | jq -r '.file_id')
        if [ $id != '' ]
		then
        	echo $file > $2'/'$id'.json'
    	fi
    done <<< "$files"

    sleep 2
done
