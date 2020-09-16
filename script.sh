#!/bin/bash
datetime=$(date -u +%FT%TZ)
response=$(curl --location --head --silent --show-error -w "{\"status_code\":%{http_code},\"response_time\":\"%{time_total}\"}" -o /dev/null "${1}")
echo "$response" | \
  jq ".time = \"${datetime}\"" | \
  jq ".url = \"${1}\""
