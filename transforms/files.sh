#!/bin/bash

set -euo pipefail

for file in $1*.json; do
    id=$(basename $file .json)
    facility=$(cat $file | jq -c)
    echo $id
    response=$(curl -s "https://publicfiles.fcc.gov/api/manager/search/key/Political.json?entityId="$id)
    files=$(echo $response | jq -r -c '.searchResult.files[]')

    while IFS= read -r file; do
        file=$(echo $file | jq --argjson facility "$facility" '. * {facility: $facility}')
        id=$(echo $file | jq -r '.file_manager_id')
        if [ "$id" != "" ]; then
	        path=$(echo $file | jq -r '.file_folder_path')
	        year=(${path//\// })
        	if [ "${year[2]}" = "2019" ] || [ "${year[2]}" = "2020" ]; then # [ "${year[2]}" = "2018" ] || 
        		echo $file > $2$id'.json'
        	fi
    	fi
    done <<< "$files"
done
