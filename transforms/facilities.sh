#!/bin/bash

curl "https://publicfiles.fcc.gov/api/service/facility/search/*.json" >> $1/facilities.json
