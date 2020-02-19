#!/bin/bash

# set -euo pipefail

for file in $1*.json; do
    id=$(basename $file .json)
    file=$(cat $file)
    callSign=$(echo $file | jq -r '.facility.callSign')
    legalName=$(echo $file | jq -r '.facility.legalName')
    fileFolderPath=$(echo $file | jq -r '.file_folder_path')
    fileFolderPathCleaned="${fileFolderPath/Political Files\//}"
    fileName=$(echo $file | jq -r '.file_name')
    if [ "$callSign" != "null" ]; then
    	service=$(echo $file | jq -r '.facility.service')
    	serviceCleaner=${service/ Station/}
    	serviceCleanest=${serviceCleaner/Digital /}
    	callSignCleaner=${callSign/-$serviceCleanest/}
    	communityCity=$(echo $file | jq -r '.facility.communityCity')
    	communityState=$(echo $file | jq -r '.facility.communityState')
    	outputName="${communityState} - ${communityCity} - ${serviceCleanest} - ${callSignCleaner} - ${fileFolderPathCleaned//\// - } - ${fileName}.pdf"
   	else
    	facilityType=$(echo $file | jq -r '.facility.facilityType')
    	# principalCity=$(echo $file | jq -r '.facility.principalCity') ${principalCity} - ${operatorState} - 
    	operatorState=$(echo $file | jq -r '.facility.operatorState')
    	outputName="${operatorState} - ${facilityType/ System/} - ${legalName} - ${fileFolderPathCleaned//\// - } - ${fileName}.pdf"
   	fi
    echo $outputName
    wget -O "$2$outputName" -q -N "https://files.fcc.gov/download/"$id".pdf"
done
