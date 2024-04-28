#!/bin/bash
# Send a get request to URL and displays the respond size in bytes
curl -X GET -s -o /dev/null --write-out "%{size_download}\n" "$1"
