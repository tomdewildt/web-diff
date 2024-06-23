#!/bin/bash

usage() {
    echo "Usage: $0 [--create] <webpage_url> <snapshot_file>"
    exit 2
}

download() {
    local url=$1
    local output=$2
    curl -s "$url" -o "$output"
}

# Check if number of arguments is less than 2
if [ "$#" -lt 2 ]; then
    usage
fi

# Download page and save it as snapshot
if [ "$1" == "--create" ]; then
    if [ "$#" -ne 3 ]; then
        usage
    fi

    download "$2" "$3"
    exit 0
fi

# Check if number of arguments is not equal to 2
if [ "$#" -ne 2 ]; then
    usage
fi

# Parse arguments
url=$1
snapshot=$2
tmp=$(mktemp)

# Download page
download "$url" "$tmp"

# Check if snapshot exists
if [ ! -f "$snapshot" ]; then
    echo "Error: '$snapshot' does not exist"
    rm "$tmp"
    exit 1
fi

# Compare page against snapshot
if diff -q "$tmp" "$snapshot" > /dev/null; then
    rm "$tmp"
    exit 0
else
    echo "Error: '$url' does not match '$snapshot'"
    rm "$tmp"
    exit 1
fi
