#!/bin/bash

# Directory to search (default is current directory)
DIR=${1:-.}

echo "Finding files modified in the last 7 days in directory: $DIR"

# Find files modified in the last 7 days
find "$DIR" -type f -mtime -7
