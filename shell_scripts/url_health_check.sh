#!/bin/bash
# Script to check if a URL is reachable (HTTP 200 = OK)

# Ask user for URL
read -p "Enter URL to check (e.g., http://localhost:8080/health): " URL

# Use curl to get HTTP status code
STATUS_CODE=$(curl -o /dev/null -s -w "%{http_code}\n" "$URL")

# Check if status is 200 (OK)
if [ "$STATUS_CODE" -eq 200 ]; then
    echo "✅ URL is UP (HTTP $STATUS_CODE)"
else
    echo "❌ URL is DOWN (HTTP $STATUS_CODE)"
fi
